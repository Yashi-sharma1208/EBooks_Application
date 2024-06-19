package com.Dao;

import com.entity.User;

public interface UserDao {
	public boolean userRegister(User us);
    public User userLogin(String email,String password);
    public boolean updateUser(User u);
    public boolean updateAddress(User u);
    
    public boolean checkUser(String email);
}

