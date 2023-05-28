package com.uniweb.service;

import com.uniweb.entity.PassedTest;
import java.util.List;

public interface PassedTestService {

  boolean save(PassedTest passedTest);

  List<PassedTest> get(int userID);

}
