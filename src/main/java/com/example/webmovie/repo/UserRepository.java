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
    private final String UPDATE_USER = "UPDATE User SET Name = ?, Gender = ?, Birthday = ?, Address = ?, PhoneNumber = ? WHERE Id = ?";
    private final String DELETE_USER = "DELETE FROM user WHERE id = ?;";
    private final String DELETE_RATING_BY_USER = "DELETE FROM rating WHERE UserId = ?";
    private final String DELETE_WATCHLIST_BY_USER = "DELETE FROM watchlist WHERE UserId = ?";

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
        boolean rowUpdated = false;
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER)) {

            preparedStatement.setString(1, user.getName());
            preparedStatement.setBoolean(2, user.isGender());
            preparedStatement.setDate(3, user.getBirthday());
            preparedStatement.setString(4, user.getAddress());
            preparedStatement.setString(5, user.getPhoneNumber());
            preparedStatement.setInt(6, user.getId());

            rowUpdated = preparedStatement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }


    @Override
    public boolean deleteUser(int id) {
        try (Connection connection = BaseRepository.getConnectDB()) {
            connection.setAutoCommit(false); // bắt đầu transaction
            boolean result = false;

            try (
                    PreparedStatement ps1 = connection.prepareStatement(DELETE_RATING_BY_USER);
                    PreparedStatement ps2 = connection.prepareStatement(DELETE_WATCHLIST_BY_USER);
                    PreparedStatement ps3 = connection.prepareStatement(DELETE_USER);
            ) {
                // Xóa rating trước
                ps1.setInt(1, id);
                ps1.executeUpdate();

                // Sau đó xóa user
                ps2.setInt(1, id);
                ps2.executeUpdate();

                ps3.setInt(1, id);
                int rowsDeleted = ps3.executeUpdate();

                if (rowsDeleted > 0) {
                    result = true;
                }

                // Nếu tất cả OK thì commit
                connection.commit();

            } catch (SQLException e) {
                // Nếu có lỗi, rollback để dữ liệu không bị sai
                connection.rollback();
                throw e;
            } finally {
                connection.setAutoCommit(true); // bật lại auto-commit
            }

            return result;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
