package com.uniweb.entity;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class UserStatistics {

  private String name;
  private String surname;
  private int userId;
  private int assignedCourses;
  private int startedCourses;
  private int completedCourses;
  private int takenTests;
  private int passedTests;
  private int failedTests;

}
