package com.uniweb.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


/**
 * Returns the connection object that can be used to connect to database
 * <p>
 * Class.forName(DRIVER) - dynamically load the driver class into memory, after which it is automatically registered
 */
public class DBConnectionUtil {
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";
    private static final String URL = "jdbc:mysql://localhost:3306/final_project?useUnicode=true&characterEncoding=utf8";
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static Connection connection = null;

    public static Connection openConnection() {
        if (connection != null)
            return connection;
        else {
            try {
                Class.forName(DRIVER);
                connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return connection;
    }
}


