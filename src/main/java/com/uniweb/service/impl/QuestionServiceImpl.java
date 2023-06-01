package com.uniweb.service.impl;

import com.uniweb.entity.Question;
import com.uniweb.entity.TestPass;
import com.uniweb.repository.QuestionRepository;
import com.uniweb.service.QuestionService;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class QuestionServiceImpl implements QuestionService {

  private final QuestionRepository questionRepository;

  @Override
  public List<Question> get(int testID) {
    return questionRepository.findAllByTestId(testID);
  }

  @Override
  public boolean save(Question question) {
    questionRepository.save(question);
    return true;
  }

  @Override
  public boolean delete(String questionID) {
    questionRepository.deleteById(Integer.valueOf(questionID));
    return true;
  }

  @Override
  public Boolean checkAnswer(TestPass testPass) {
    Question question = questionRepository.findById(testPass.getQuestionID()).orElseThrow();
    return String.valueOf(question.isOption1IsCorrect()).equals(testPass.getOption1Chosen()) &&
        String.valueOf(question.isOption2IsCorrect()).equals(testPass.getOption2Chosen()) &&
        String.valueOf(question.isOption3IsCorrect()).equals(testPass.getOption3Chosen()) &&
        String.valueOf(question.isOption4IsCorrect()).equals(testPass.getOption4Chosen());
  }
}
