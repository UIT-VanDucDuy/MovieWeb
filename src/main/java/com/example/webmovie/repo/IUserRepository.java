package com.example.webmovie.repo;

import com.example.webmovie.dto.UserDTO;
import com.example.webmovie.entity.User;

import java.util.List;

public interface IUserRepository {
    public List<UserDTO> getAll(int page, int pageSize);

    public UserDTO findById(int id);

    public boolean addUser(UserDTO user);

    public boolean updateUser(User user);

    public boolean deleteUser(int id);
}
