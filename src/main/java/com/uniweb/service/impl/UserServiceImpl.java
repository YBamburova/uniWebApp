package com.uniweb.service.impl;

import com.uniweb.entity.PassedTest;
import com.uniweb.entity.User;
import com.uniweb.entity.UserStatistics;
import com.uniweb.entity.UserType;
import com.uniweb.repository.CourseRepository;
import com.uniweb.repository.UserRepository;
import com.uniweb.service.PassedTestService;
import com.uniweb.service.UserService;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import javax.persistence.EntityExistsException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@RequiredArgsConstructor
@Transactional
@Service
public class UserServiceImpl implements UserService {

  private final UserRepository userRepository;
  private final CourseRepository courseRepository;

  private final PassedTestService passedTestService;

  @Override
  public List<User> findAll() {
    return userRepository.findAll();
  }

  @Override
  public List<User> findAllById(Iterable<Integer> ids) {
    return userRepository.findAllById(ids);
  }

  @Override
  public List<User> findAllByType(UserType type) {
    return userRepository.findAllByType(type);
  }


  @Override
  public boolean save(User user) {
    userRepository.save(user);
    return true;
  }

  @Override
  public boolean block(int id) {
    User existing = userRepository.findById(id).orElseThrow(
        () -> new EntityExistsException("User doesn't exist with id: " + id));
    existing.setBlocked(true);
    userRepository.save(existing);
    return true;
  }

  @Override
  public boolean unBlock(int id) {
    User existing = userRepository.findById(id).orElseThrow(
        () -> new EntityExistsException("User doesn't exist with id: " + id));
    existing.setBlocked(false);
    userRepository.save(existing);
    return true;
  }

  @Override
  public User getByID(int id) {
    return userRepository.findById(id).orElse(null);
  }

  @Override
  public boolean update(User user) {
    User existing = userRepository.findById(user.getId()).orElseThrow(
        () -> new EntityExistsException("User doesn't exist with id: " + user.getId()));
    existing.setUsername(user.getUsername());
    existing.setName(user.getName());
    existing.setSurname(user.getSurname());
    existing.setSupportLevel(user.getSupportLevel());
    existing.setEducationalProgram(user.getEducationalProgram());
    existing.setAdditionalInfo(user.getAdditionalInfo());
    existing.setEmail(user.getEmail());
    if (user.getPassword() != null) {
      existing.setPassword(user.getPassword());
    }
    userRepository.save(existing);
    return true;
  }

  @Override
  public boolean delete(String userID) {
    userRepository.deleteById(Integer.valueOf(userID));
    return true;
  }

  @Override
  public User authenticate(String username, String password) {
    return userRepository.findByUsernameAndPassword(username, password).orElseThrow();
  }

  @Override
  public UserStatistics getStatisticsById(int id) {
    User user = userRepository.findById(id).orElseThrow();
    AtomicInteger startedCourses = new AtomicInteger();
    AtomicInteger completedCourses = new AtomicInteger();
    user.getCourses().forEach(c -> {
      if (courseRepository.getCourseStartedDateByCourseIdAndUserId(c.getId(), id) != null) {
        if (courseRepository.getCourseCompletedDateByCourseIdAndUserId(c.getId(), id) != null) {
          completedCourses.getAndIncrement();
        } else {
          startedCourses.incrementAndGet();
        }
      }
    });
    int assignedCourses = user.getCourses().size();
    List<PassedTest> passedTests = passedTestService.get(id);
    return UserStatistics.builder()
        .assignedCourses(assignedCourses)
        .startedCourses(startedCourses.get())
        .completedCourses(completedCourses.get())
        .takenTests(passedTests.size())
        .passedTests((int) passedTests.stream().filter(t -> t.getResult() >= 60).count())
        .failedTests((int) passedTests.stream().filter(t -> t.getResult() < 60).count())
        .userId(id)
        .name(user.getName())
        .surname(user.getSurname())
        .build();
  }
}
