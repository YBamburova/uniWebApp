package com.uniweb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Getter
@Setter
@ToString
@Table(name = "question")
public class Question {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "test_id")
  private Test test;
  private String text;
  private String option1;
  private String option2;
  private String option3;
  private String option4;
  @Column(name = "o1is_correct")
  private boolean option1IsCorrect;
  @Column(name = "o2IsCorrect")
  private boolean option2IsCorrect;
  @Column(name = "o3IsCorrect")
  private boolean option3IsCorrect;
  @Column(name = "o4IsCorrect")
  private boolean option4IsCorrect;
}
