package com.uniweb.service.impl;

import com.uniweb.entity.Course;
import com.uniweb.repository.CourseRepository;
import com.uniweb.repository.CourseRepository.CourseDuration;
import com.uniweb.service.CourseService;
import java.util.Date;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
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
  public CourseDuration getCourseStartEndDate(Integer courseId, Integer userId) {
    return new CourseDuration() {
      @Override
      public Date getStarteddate() {
        return courseRepository.getCourseStartedDateByCourseIdAndUserId(courseId, userId);
      }

      @Override
      public Date getCompleteddate() {
        return courseRepository.getCourseCompletedDateByCourseIdAndUserId(courseId, userId);
      }
    };
  }

  @Override
  public void beginCourse(Integer courseId) {
    courseRepository.startCourseById(courseId);
  }

  @Override
  public void completeCourse(Integer courseId) {
    courseRepository.completeCourseById(courseId);
  }

  @Override
  public List<Course> findAll() {
    return courseRepository.findAll();
  }
}
