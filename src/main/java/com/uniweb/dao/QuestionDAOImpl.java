package com.uniweb.dao;

import com.uniweb.controller.DBConnectionUtil;
import com.uniweb.entity.Question;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class QuestionDAOImpl implements QuestionDAO {
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    PreparedStatement preparedStatement = null;


    public List<Question> get(int testID) {
        List<Question> list = null;
        Question question = null;

        list = new ArrayList<>();
        String sql = "SELECT * FROM question WHERE test_id=" + testID;
        connection = DBConnectionUtil.openConnection();

        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                question = new Question();
                question.setId(resultSet.getInt("id"));
                question.setTestID(resultSet.getInt("test_id"));
                question.setText(resultSet.getString("text"));
                question.setOption1(resultSet.getString("option1"));
                question.setOption2(resultSet.getString("option2"));
                question.setOption3(resultSet.getString("option3"));
                question.setOption4(resultSet.getString("option4"));
                question.setOption1IsCorrect(resultSet.getString("o1IsCorrect"));
                question.setOption2IsCorrect(resultSet.getString("o2IsCorrect"));
                question.setOption3IsCorrect(resultSet.getString("o3IsCorrect"));
                question.setOption4IsCorrect(resultSet.getString("o4IsCorrect"));
                list.add(question);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    public boolean save(Question question) {
        boolean flag = false;


        try {
            String sql = "INSERT INTO question(test_id, text, option1, option2, option3, option4, o1IsCorrect, o2IsCorrect, o3IsCorrect, o4IsCorrect) VALUES('" + question.getTestID() + "','" + question.getText() + "','" + question.getOption1() + "','" + question.getOption2() + "','" + question.getOption3() + "','" + question.getOption4() + "','" + question.getOption1IsCorrect() + "','" + question.getOption2IsCorrect() + "','" + question.getOption3IsCorrect() + "','" + question.getOption4IsCorrect() + "')";

            connection = DBConnectionUtil.openConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.executeUpdate();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    @Override
    public boolean delete(String questionID) {
        boolean flag = false;
        String sql = "DELETE FROM question where id=" + questionID;

        try {
            connection = DBConnectionUtil.openConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.executeUpdate();
            flag = true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return flag;
    }
}
