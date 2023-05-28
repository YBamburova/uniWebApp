package com.uniweb.service.impl;

import com.uniweb.entity.Test;
import com.uniweb.repository.TestRepository;
import com.uniweb.service.TestService;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class TestServiceImpl implements TestService {

  private final TestRepository testRepository;

  @Override
  public List<Test> get() {
    return testRepository.findAll();
  }

  @Override
  public Test get(int id) {
    return testRepository.findById(id).orElse(null);
  }

  @Override
  public boolean save(Test test) {
    testRepository.save(test);
    return true;
  }

  @Override
  public boolean delete(String testID) {
    testRepository.deleteById(Integer.valueOf(testID));
    return true;
  }

  @Override
  public boolean update(Test test) {
    Test existing = testRepository.findById(test.getId()).orElseThrow();
    existing.setComplexity(test.getComplexity());
    existing.setName(test.getName());
    existing.setTopic(test.getTopic());
    existing.setTimeForTest(test.getTimeForTest());
    testRepository.save(existing);
    return true;
  }

  @Override
  public void addNumberOfRequests(String testID) {
    Test existing = testRepository.findById(Integer.valueOf(testID)).orElseThrow();
    existing.setNumberOfRequests(existing.getNumberOfRequests() + 1);
    testRepository.save(existing);
  }
}
