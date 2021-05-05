package dao;

import controller.DBConnectionUtil;
import entity.TestPass;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class TestPassDAOImpl implements TestPassDAO {

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    @Override
    public Boolean checkAnswer(TestPass testPass) {
        Boolean flag = false;

        String sql = "SELECT * FROM question WHERE id=" + testPass.getQuestionID();
        connection = DBConnectionUtil.openConnection();
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                flag = resultSet.getString("o1IsCorrect").equals(testPass.getOption1Chosen()) &&
                        resultSet.getString("o2IsCorrect").equals(testPass.getOption2Chosen()) &&
                        resultSet.getString("o3IsCorrect").equals(testPass.getOption3Chosen()) &&
                        resultSet.getString("o4IsCorrect").equals(testPass.getOption4Chosen());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
}
