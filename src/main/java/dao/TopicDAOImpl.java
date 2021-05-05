package dao;

import controller.DBConnectionUtil;
import entity.Topic;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TopicDAOImpl implements TopicDAO {

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    PreparedStatement preparedStatement = null;

    @Override
    public List<Topic> getAllTopics() {
        List<Topic> list = new ArrayList<>();
        Topic topic = null;
        String sql = "SELECT * FROM topic";
        connection = DBConnectionUtil.openConnection();
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                topic = new Topic();
                topic.setId(resultSet.getInt("id"));
                topic.setName(resultSet.getString("name"));
                list.add(topic);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    @Override
    public Topic getTopicByID(String topicID) {
        Topic topic = new Topic();
        try {
            String sql = "SELECT * FROM topic WHERE id=" + topicID;
            connection = DBConnectionUtil.openConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                topic.setId(resultSet.getInt("id"));
                topic.setName(resultSet.getString("name"));

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return topic;
    }

    @Override
    public boolean save(Topic topic) {
        boolean flag = false;

        try {
            String sql = "INSERT INTO topic(name) VALUES('" + topic.getName() + "')";
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
    public boolean delete(String topicID) {
        boolean flag = false;
        String sql = "DELETE FROM topic where id=" + topicID;

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

    @Override
    public boolean update(Topic topic) {
        boolean flag = false;
        String sql = "UPDATE topic SET name='" + topic.getName() + "' where id=" + topic.getId();

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
