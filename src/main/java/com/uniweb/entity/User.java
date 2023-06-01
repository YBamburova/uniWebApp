package com.uniweb.entity;

import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Getter
@Setter
@ToString
@Table(name = "users")
public class User {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;
  @Column(unique = true)
  private String username;
  private String name;
  private String surname;
  @Column(unique = true)
  private String email;
  private String password;
  private boolean isBlocked;
  @Column(columnDefinition = "enum('student','admin')")
  @Enumerated(EnumType.STRING)
  private UserType type = UserType.student;

  @Column(columnDefinition = "enum('typical', 'modified', 'adaptive')")
  @Enumerated(EnumType.STRING)
  private EducationalProgram educationalProgram = EducationalProgram.typical;
  private int supportLevel;

  private String additionalInfo;

  @ManyToMany(fetch = FetchType.EAGER, mappedBy = "assignedStudents")
  private Set<Course> courses;

  public boolean getIsBlocked() {
    return isBlocked;
  }
}
