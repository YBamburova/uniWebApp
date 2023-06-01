package com.uniweb.service.impl;

import com.uniweb.entity.PassedTest;
import com.uniweb.repository.PassedTestRepository;
import com.uniweb.service.PassedTestService;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class PassedTestServiceImpl implements PassedTestService {

  private final PassedTestRepository passedTestRepository;

  @Override
  public boolean save(PassedTest passedTest) {
    passedTestRepository.save(passedTest);
    return true;
  }

  @Override
  public List<PassedTest> get(int userID) {
    return passedTestRepository.findByUserId(userID);
  }
}
