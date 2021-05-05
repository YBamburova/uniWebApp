package dao;

import controller.DBConnectionUtil;
import entity.PassedTest;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PassedTestDAOImpl implements PassedTestDAO {
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    PreparedStatement preparedStatement = null;

    @Override
    public boolean save(PassedTest passedTest) {
        boolean flag = false;

        String sql = "INSERT INTO passed_tests(user_id, test_id, result, time_spent) values ('" + passedTest.getUserID() + "', '" + passedTest.getTestID() + "', '" + passedTest.getResult() + "', '" + passedTest.getTimeSpent() + "')";

        try {
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
    public List<PassedTest> get(int userID) {
        List<PassedTest> list = null;
        PassedTest passedTest = null;

        list = new ArrayList<>();
        String sql = "SELECT * from passed_tests where user_id=" + userID;
        connection = DBConnectionUtil.openConnection();

        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                passedTest = new PassedTest();
                passedTest.setId(resultSet.getInt("id"));
                passedTest.setUserID(resultSet.getInt("user_id"));
                passedTest.setTestID(resultSet.getInt("test_id"));
                passedTest.setResult(resultSet.getInt("result"));
                passedTest.setTimeSpent(resultSet.getInt("time_spent"));
                list.add(passedTest);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }
}
