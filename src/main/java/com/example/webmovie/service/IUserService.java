package com.example.webmovie.service;

import com.example.webmovie.entity.User;

import java.util.List;

public interface IUserService {
    public List<User> getAll(int page, int pageSize);
    public User findById(int id);
    public boolean addUser(User user);
    public boolean updateUser(User user);
    public boolean deleteUser(int id);
}
