package com.uniweb.dao;

import com.uniweb.controller.DBConnectionUtil;
import com.uniweb.entity.Login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAOImpl implements LoginDAO {
    @Override
    public Login authenticate(Login login) {

        String sql = "SELECT * FROM users where username=? and password=?";
        try {
            Connection connection = DBConnectionUtil.openConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, login.getUsername());
            preparedStatement.setString(2, login.getPassword());
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                login = new Login();
                login.setId(resultSet.getInt("id"));
                login.setUsername(resultSet.getString("username"));
                login.setName(resultSet.getString("name"));
                login.setSurname(resultSet.getString("surname"));
                login.setEmail(resultSet.getString("email"));
                login.setPassword(resultSet.getString("password"));
                login.setType(resultSet.getString("type"));
                login.setIsBlocked(resultSet.getString("isBlocked"));
            } else {
                login = null;
            }
        } catch (SQLException throwables) {
            login = null;
        }
        return login;
    }
}
