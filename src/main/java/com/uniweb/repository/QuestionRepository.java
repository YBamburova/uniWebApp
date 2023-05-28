package com.uniweb.repository;

import com.uniweb.entity.Question;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuestionRepository extends JpaRepository<Question, Integer> {

  List<Question> findAllByTestId(int testId);
}
