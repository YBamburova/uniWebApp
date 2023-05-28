package com.uniweb.repository;

import com.uniweb.entity.Test;
import com.uniweb.entity.Topic;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TopicRepository extends JpaRepository<Topic, Integer> {

}
