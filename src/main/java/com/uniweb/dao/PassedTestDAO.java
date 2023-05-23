package com.uniweb.dao;

import com.uniweb.entity.PassedTest;

import java.util.List;

public interface PassedTestDAO {
    boolean save(PassedTest passedTest);

    List<PassedTest> get(int userID);
}
