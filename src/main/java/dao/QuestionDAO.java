package dao;

import entity.Question;

import java.util.List;

public interface QuestionDAO {
    List<Question> get(int testID);

    boolean save(Question question);

    boolean delete(String questionID);
}
