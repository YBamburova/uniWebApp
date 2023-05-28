package com.uniweb.service;

import com.uniweb.entity.Test;
import com.uniweb.entity.TestPass;
import java.util.List;

public interface TestService {
    List<Test> get();

    Test get(int id);

    boolean save(Test test);

    boolean delete(String testID);

    boolean update(Test test);

    void addNumberOfRequests(String testID);
}
