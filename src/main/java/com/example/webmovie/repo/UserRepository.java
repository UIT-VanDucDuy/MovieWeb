package com.example.webmovie.repo;

import com.example.webmovie.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

public class UserRepository implements IUserRepository {
    List<User> userList = new ArrayList<>();
    private final String SELECT_ALL = "select * from user LIMIT ? OFFSET ?;";
    private final String FIND_BY_ID = "select * from user WHERE id = ?;";

    @Override
    public List<User> getAll(int page, int pageSize) {
        List<User> userList = new ArrayList<>();
        int offset = (page - 1) * pageSize;

        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL)) {

            preparedStatement.setInt(1, pageSize);
            preparedStatement.setInt(2, offset);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("Id");
                String name = rs.getString("Name");
                boolean gender = rs.getBoolean("Gender");
                Date birthday = rs.getDate("Birthday");
                String address = rs.getString("Address");
                String phoneNumber = rs.getString("PhoneNumber");
                int accountId = rs.getInt("AccountID");

                User user = new User(id, name, gender, birthday, address, phoneNumber, accountId);
                userList.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Lỗi query");
        }
        return userList;
    }


    @Override
    public User findById(int userId) {
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID)) {
            preparedStatement.setInt(1, userId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("Id");
                String name = rs.getString("Name");
                boolean gender = rs.getBoolean("Gender");
                Date birthday = rs.getDate("Birthday");
                String address = rs.getString("Address");
                String phoneNumber = rs.getString("PhoneNumber");
                int accountId = rs.getInt("AccountID");
                User user = new User(id, name, gender, birthday, address, phoneNumber, accountId);
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
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
