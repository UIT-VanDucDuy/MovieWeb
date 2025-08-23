package com.example.webmovie.service;

import com.example.webmovie.entity.User;
import com.example.webmovie.repo.UserRepository;

import java.util.List;

public class UserService implements IUserService{
    UserRepository userRepository = new UserRepository();

    @Override
    public List<User> getAll(int page, int pageSize) {
        return userRepository.getAll(page, pageSize);
    }

    @Override
    public User findById(int id) {
        return userRepository.findById(id);
    }

    @Override
    public boolean addUser(User user) {
        return false;
    }

    @Override
    public boolean updateUser(User user) {
        return false;
    }

    @Override
    public boolean deleteUser(int id) {
        return false;
    }
}
