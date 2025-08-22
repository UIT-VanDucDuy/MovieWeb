package com.example.webmovie.repo;

import com.example.webmovie.entity.User;

import java.util.List;

public interface IUserRepository {
    public List<User> getAll(int page, int pageSize);
    public User findById(int id);
    public boolean addUser(User user);
    public boolean updateUser(User user);
    public boolean deleteUser(int id);
}
