package com.uniweb.service;

import com.uniweb.entity.Course;
import com.uniweb.repository.CourseRepository.CourseDuration;
import java.util.List;

public interface CourseService {

  void update(Course course);

  Course create(Course course);

  void delete(Integer id);

  Course findById(Integer id);

  CourseDuration getCourseStartEndDate(Integer courseId, Integer userId);

  void beginCourse(Integer courseId);
  void completeCourse(Integer courseId);

  List<Course> findAll();
}
