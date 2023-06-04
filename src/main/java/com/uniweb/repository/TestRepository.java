package com.uniweb.repository;

import com.uniweb.entity.Test;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TestRepository extends JpaRepository<Test, Integer> {

  List<Test> findAllByAssignedStudentsId(Integer userId);
}
