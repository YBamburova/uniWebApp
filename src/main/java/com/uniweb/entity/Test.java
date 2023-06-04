package com.uniweb.entity;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Getter
@Setter
@ToString
@Table(name = "tests")
public class Test {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;
  private String name;
  private Integer complexity;
  private Integer numberOfRequests;
  private Integer timeForTest;
  private Integer topic;
  @OneToMany(mappedBy = "test", fetch = FetchType.EAGER)
  private List<Question> questions;

  @ManyToMany(fetch = FetchType.EAGER)
  @JoinTable(name = "user_test",
      joinColumns = {@JoinColumn(name = "test_id")},
      inverseJoinColumns = {@JoinColumn(name = "user_id")})
  private Set<User> assignedStudents;

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
