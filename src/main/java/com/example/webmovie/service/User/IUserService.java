package com.example.webmovie.service.User;

import com.example.webmovie.dto.UserDTO;
import com.example.webmovie.entity.MemberType;
import com.example.webmovie.entity.User;

import java.util.List;

public interface IUserService {
    public List<UserDTO> getAll(int page, int pageSize);

    public UserDTO findById(int id);

    public boolean addUser(UserDTO user);

    public boolean updateUser(User user);

    public boolean deleteUser(int id);

    public List<MemberType> getAllMemberType();

    UserDTO findUserByAccountId(int accId);
}
