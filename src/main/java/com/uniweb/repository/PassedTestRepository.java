package com.uniweb.repository;

import com.uniweb.entity.PassedTest;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PassedTestRepository extends JpaRepository<PassedTest, Integer> {

  List<PassedTest> findByUserId(Integer userID);

}
