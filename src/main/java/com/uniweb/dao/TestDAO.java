package com.uniweb.dao;

import com.uniweb.entity.Test;

import java.util.List;

public interface TestDAO {
    List<Test> get();

    Test get(int id);

    boolean save(Test test);

    boolean delete(String testID);

    boolean update(Test test);

    void addNumberOfRequests(String testID);
}
