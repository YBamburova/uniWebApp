package com.uniweb.service;

import com.uniweb.entity.User;
import com.uniweb.entity.UserStatistics;
import com.uniweb.entity.UserType;
import java.util.List;

public interface UserService {
  List<User> findAll();

  List<User> findAllById(Iterable<Integer> ids);

  List<User> findAllByType(UserType type);

  boolean save(User user);

  boolean block(int id);

  boolean unBlock(int id);

  User getByID(int id);

  boolean update(User user);

  boolean delete(String userID);

  User authenticate(String username, String password);

  UserStatistics getStatisticsById(int id);
}
