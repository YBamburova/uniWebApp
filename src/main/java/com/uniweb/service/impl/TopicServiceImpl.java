package com.uniweb.service.impl;

import com.uniweb.entity.Topic;
import com.uniweb.repository.TopicRepository;
import com.uniweb.service.TopicService;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class TopicServiceImpl implements TopicService {

  private final TopicRepository topicRepository;

  @Override
  public List<Topic> getAllTopics() {
    return topicRepository.findAll();
  }

  @Override
  public Topic getTopicByID(String topicID) {
    return topicRepository.findById(Integer.valueOf(topicID)).orElse(null);
  }

  @Override
  public boolean save(Topic topic) {
    topicRepository.save(topic);
    return true;
  }

  @Override
  public boolean delete(String topicID) {
    topicRepository.deleteById(Integer.valueOf(topicID));
    return true;
  }

  @Override
  public boolean update(Topic topic) {
    Topic existing = topicRepository.findById(topic.getId()).orElseThrow();
    existing.setName(topic.getName());
    topicRepository.save(existing);
    return true;
  }
}
