package com.uniweb.service;

import com.uniweb.entity.Course;
import java.util.List;

public interface CourseService {

  void update(Course course);

  Course create(Course course);

  void delete(Integer id);

  Course findById(Integer id);

  List<Course> findAll();
}
