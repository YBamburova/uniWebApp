package com.uniweb.repository;

import com.uniweb.entity.Course;
import java.util.Date;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CourseRepository extends JpaRepository<Course, Integer> {

  @Query(nativeQuery = true, value = "select started_date from user_course where course_id = :courseId and user_id = :userId")
  Date getCourseStartedDateByCourseIdAndUserId(@Param("courseId") Integer courseId,
      @Param("userId") Integer userId);

  @Query(nativeQuery = true, value = "select completed_date from user_course where course_id = :courseId and user_id = :userId")
  Date getCourseCompletedDateByCourseIdAndUserId(@Param("courseId") Integer courseId,
      @Param("userId") Integer userId);

  @Modifying
  @Query(nativeQuery = true, value = "update user_course set started_date = current_timestamp() where course_id = :courseId")
  void startCourseById(@Param("courseId") Integer courseId);

  @Modifying
  @Query(nativeQuery = true, value = "update user_course set completed_date = current_timestamp() where course_id = :courseId")
  void completeCourseById(@Param("courseId") Integer courseId);

  public static interface CourseDuration {

    Date getStarteddate();

    Date getCompleteddate();
  }
}
