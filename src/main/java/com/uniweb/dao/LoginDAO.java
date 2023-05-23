package com.uniweb.dao;

import com.uniweb.entity.Login;

public interface LoginDAO {
    public Login authenticate(Login login);
}
