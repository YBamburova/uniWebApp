package com.uniweb.service.impl;

import com.uniweb.entity.Course;
import com.uniweb.repository.CourseRepository;
import com.uniweb.service.CourseService;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CourseServiceImpl implements CourseService {

  private final CourseRepository courseRepository;

  @Override
  public void update(Course course) {
    Course existing = courseRepository.findById(course.getId()).orElseThrow();
    existing.setContent(course.getContent());
    existing.setName(course.getName());
    existing.setEducationalProgram(course.getEducationalProgram());
    existing.setComplexity(course.getComplexity());
    existing.setAssignedStudents(course.getAssignedStudents());
    courseRepository.save(existing);
  }

  @Override
  public Course create(Course course) {
    return courseRepository.save(course);
  }

  @Override
  public void delete(Integer id) {
    courseRepository.deleteById(id);
  }

  @Override
  public Course findById(Integer id) {
    return courseRepository.findById(id).orElseThrow();
  }

  @Override
  public List<Course> findAll() {
    return courseRepository.findAll();
  }
}
