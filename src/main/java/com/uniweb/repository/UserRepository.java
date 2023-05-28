package com.uniweb.repository;

import com.uniweb.entity.User;
import com.uniweb.entity.UserType;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Integer> {

  Optional<User> findByUsernameAndPassword(String username, String password);

  List<User> findAllByType(UserType type);
}
