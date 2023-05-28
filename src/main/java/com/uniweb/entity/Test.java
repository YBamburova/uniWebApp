package com.uniweb.entity;

import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
}
