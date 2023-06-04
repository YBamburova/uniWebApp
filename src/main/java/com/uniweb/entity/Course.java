package com.uniweb.entity;

import java.util.Date;
import java.util.Set;
import java.util.stream.Collectors;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Getter
@Setter
@ToString
@Table(name = "course")
public class Course {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;
  private String name;
  private Integer complexity;
  @Column(columnDefinition = "enum('typical', 'modified', 'adaptive')")
  @Enumerated(EnumType.STRING)
  private EducationalProgram educationalProgram = EducationalProgram.typical;
  @Column(length = 65535, columnDefinition = "TEXT")
  private String content;
  @ManyToMany(fetch = FetchType.EAGER)
  @JoinTable(name = "user_course",
      joinColumns = {@JoinColumn(name = "course_id")},
      inverseJoinColumns = {@JoinColumn(name = "user_id")})
  private Set<User> assignedStudents;

  @Transient
  private Date startedDate;
  @Transient
  private Date completedDate;

  //used in jsp
  public String getAssignedStudentNames() {
    return assignedStudents.stream().map(u -> u.getName() + ", " + u.getUsername())
        .collect(Collectors.joining("; "));
  }
  //used in jsp
  public boolean hasAssignedStudent(int id) {
    return assignedStudents.stream().anyMatch(u -> u.getId() == id);
  }

}
