package com.uniweb.service;

import com.uniweb.entity.Topic;
import java.util.List;

public interface TopicService {
    List<Topic> getAllTopics();
    Topic getTopicByID(String topicID);
    boolean save(Topic topic);
    boolean delete(String topicID);
    boolean update(Topic topic);
}
