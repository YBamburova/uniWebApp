package dao;

import entity.User;

import java.util.List;

public interface UserDAO {
    List<User> get();

    boolean save(User user);

    boolean block(User user);

    boolean unBlock(User user);

    User getByID(int id);

    boolean update(User user);

    boolean delete(String userID);


}
