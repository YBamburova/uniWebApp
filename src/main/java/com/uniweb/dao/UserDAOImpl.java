package com.uniweb.dao;

import com.uniweb.controller.DBConnectionUtil;
import com.uniweb.entity.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAOImpl implements UserDAO {

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    PreparedStatement preparedStatement = null;


    public List<User> get() {
        List<User> list = null;
        User user = null;

        list = new ArrayList<>();
        String sql = "SELECT * FROM users";
        connection = DBConnectionUtil.openConnection();

        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setUsername(resultSet.getString("username"));
                user.setName(resultSet.getString("name"));
                user.setSurname(resultSet.getString("surname"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setType(resultSet.getString("type"));
                user.setIsBlocked(resultSet.getString("isBlocked"));
                list.add(user);
            }
        } catch (SQLException throwables) {
            try {
                throwables.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public boolean save(User user) {
        boolean flag = false;
        try {
            String sql = "INSERT INTO users(username, name, surname, email, password) VALUES('" + user.getUsername() + "','" + user.getName() + "','" + user.getSurname() + "','" + user.getEmail() + "','" + user.getPassword() + "')";

            connection = DBConnectionUtil.openConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.executeUpdate();
            flag = true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return flag;
    }

    public boolean block(User user) {
        boolean flag = false;
        try {
            String sql = "UPDATE `users` SET `isBlocked` = 'true' WHERE (`username` = '" + user.getUsername() + "');";
            connection = DBConnectionUtil.openConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.executeUpdate();
            flag = true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return flag;
    }

    public boolean unBlock(User user) {
        boolean flag = false;
        try {
            String sql = "UPDATE `users` SET `isBlocked` = 'false' WHERE (`username` = '" + user.getUsername() + "');";
            connection = DBConnectionUtil.openConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.executeUpdate();
            flag = true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return flag;
    }

    public User getByID(int id) {
        User user = null;

        try {
            String sql = "SELECT * FROM users where id=" + id;
            connection = DBConnectionUtil.openConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setUsername(resultSet.getString("username"));
                user.setName(resultSet.getString("name"));
                user.setSurname(resultSet.getString("surname"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setType(resultSet.getString("type"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return user;
    }

    public boolean update(User user) {
        boolean flag = false;
        String sql = null;
        try {
            if (user.getPassword() != null) {
                sql = "UPDATE users SET username='" + user.getUsername() + "',name='" + user.getName() + "',surname='" + user.getSurname() + "',email='" + user.getEmail() + "',password='" + user.getPassword() + "' where id=" + user.getId();
            } else {
                sql = "UPDATE users SET username='" + user.getUsername() + "',name='" + user.getName() + "',surname='" + user.getSurname() + "',email='" + user.getEmail() + "' where id=" + user.getId();

            }
            connection = DBConnectionUtil.openConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.executeUpdate();
            flag = true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return flag;
    }

    @Override
    public boolean delete(String userID) {
        boolean flag = false;
        String sql = "DELETE FROM users where id=" + userID;

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
