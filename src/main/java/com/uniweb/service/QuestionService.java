package com.uniweb.service;

import com.uniweb.entity.Question;
import com.uniweb.entity.TestPass;
import java.util.List;

public interface QuestionService {
    List<Question> get(int testID);

    boolean save(Question question);

    boolean delete(String questionID);

    Boolean checkAnswer(TestPass testPass);
}
