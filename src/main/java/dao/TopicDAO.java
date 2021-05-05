package dao;

import entity.Topic;

import java.util.List;

public interface TopicDAO {
    List<Topic> getAllTopics();
    Topic getTopicByID(String topicID);
    boolean save(Topic topic);
    boolean delete(String topicID);
    boolean update(Topic topic);
}
