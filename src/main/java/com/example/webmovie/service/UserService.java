package com.example.webmovie.service;

import com.example.webmovie.dto.UserDTO;
import com.example.webmovie.entity.MemberType;
import com.example.webmovie.entity.User;
import com.example.webmovie.repo.UserRepository;

import java.util.List;

public class UserService implements IUserService {
    UserRepository userRepository = new UserRepository();

    @Override
    public List<UserDTO> getAll(int page, int pageSize) {
        return userRepository.getAll(page, pageSize);
    }

    @Override
    public UserDTO findById(int id) {
        return userRepository.findById(id);
    }

    @Override
    public boolean addUser(UserDTO user) {
        return userRepository.addUser(user);
    }

    @Override
    public boolean updateUser(User user) {
        return userRepository.updateUser(user);
    }

    @Override
    public boolean deleteUser(int id) {
        return userRepository.deleteUser(id);
    }

    public List<MemberType> getAllMemberType() {
        return userRepository.getAllMemberType();
    }
}
