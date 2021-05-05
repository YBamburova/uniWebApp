package dao;

import entity.Login;

public interface LoginDAO {
    public Login authenticate(Login login);
}
