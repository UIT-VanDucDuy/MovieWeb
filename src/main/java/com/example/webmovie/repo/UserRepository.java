package com.example.webmovie.repo;

import com.example.webmovie.entity.Account;
import com.example.webmovie.entity.DTO_entity.UserDTO;
import com.example.webmovie.entity.MemberType;
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
    private final String SELECT_ALL = "SELECT u.Id, u.Name, u.Gender, u.Birthday, u.PhoneNumber, u.Address, u.AccountID, a.Username, a.Email, a.MemberTypeId, a.CreatedAt FROM user u JOIN account a ON u.AccountID = a.Id ORDER BY a.CreatedAt DESC LIMIT ? OFFSET ?;";
    private final String FIND_BY_ID = "SELECT u.Id, u.Name, u.Gender, u.Birthday, u.PhoneNumber, u.Address, u.AccountID, a.Username, a.Email, a.MemberTypeId, a.CreatedAt FROM user u JOIN account a ON u.AccountID = a.Id WHERE u.Id = ?;";
    private final String UPDATE_USER = "UPDATE User SET Name = ?, Gender = ?, Birthday = ?, Address = ?, PhoneNumber = ? WHERE Id = ?";
    private final String DELETE_USER = "DELETE FROM user WHERE id = ?;";
    private final String DELETE_RATING_BY_USER = "DELETE FROM rating WHERE UserId = ?";
    private final String DELETE_WATCHLIST_BY_USER = "DELETE FROM watchlist WHERE UserId = ?";
    private final String ADD_ACCOUNT = "INSERT INTO account (Username, Password, Email, MemberTypeId) VALUES (?, ?, ?,?);";
    private final String ADD_USER = "INSERT INTO user (Name, Gender, Birthday, PhoneNumber, Address, AccountID) VALUES (?, ?, ?, ?, ?, ?);";
    private final String GET_DISTINCT_MEMBER_TYPES = "SELECT DISTINCT * FROM membertype";

    @Override
    public List<UserDTO> getAll(int page, int pageSize) {
        List<UserDTO> userList = new ArrayList<>();
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
                String username = rs.getString("Username");
                String email = rs.getString("Email");
                int memberTypeId = rs.getInt("MemberTypeId");

                UserDTO user = new UserDTO(id, name, email, birthday, phoneNumber, address, gender, username, accountId, memberTypeId);
                userList.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Lỗi query");
        }
        return userList;
    }


    @Override
    public UserDTO findById(int userId) {
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
                String username = rs.getString("Username");
                String email = rs.getString("Email");
                int memberTypeId = rs.getInt("MemberTypeId");

                UserDTO user = new UserDTO(id, name, email, birthday, phoneNumber, address, gender, username, accountId, memberTypeId);
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean addUser(UserDTO user) {
        boolean rowInserted = false;

        try (Connection connection = BaseRepository.getConnectDB()) {
            connection.setAutoCommit(false); // bắt đầu transaction

            // Thêm account
            int accountId = -1;
            try (PreparedStatement psAccount = connection.prepareStatement(ADD_ACCOUNT, java.sql.Statement.RETURN_GENERATED_KEYS)) {
                psAccount.setString(1, user.getUsername());
                psAccount.setString(2, user.getPassword());
                psAccount.setString(3, user.getEmail());
                psAccount.setInt(4, user.getMemberTypeId());

                int affectedRows = psAccount.executeUpdate();
                if (affectedRows > 0) {
                    try (ResultSet generatedKeys = psAccount.getGeneratedKeys()) {
                        if (generatedKeys.next()) {
                            accountId = generatedKeys.getInt(1);
                        } else {
                            throw new SQLException("Creating account failed, no ID obtained.");
                        }
                    }
                } else {
                    throw new SQLException("Creating account failed, no rows affected.");
                }
            }

            // Thêm user
            try (PreparedStatement psUser = connection.prepareStatement(ADD_USER)) {
                psUser.setString(1, user.getName());
                psUser.setBoolean(2, user.isGender());
                psUser.setDate(3, user.getBirthday());
                psUser.setString(4, user.getPhoneNumber());
                psUser.setString(5, user.getAddress());
                psUser.setInt(6, accountId);

                rowInserted = psUser.executeUpdate() > 0;
                if (!rowInserted) {
                    throw new SQLException("Creating user failed, no rows affected.");
                }
            }

            connection.commit(); // commit cả transaction

        } catch (SQLException e) {
            e.printStackTrace();
            rowInserted = false;
            // rollback tự động nếu try-with-resources kết thúc với lỗi
        }

        return rowInserted;
    }

//    @Override
//    public boolean addUser(UserDTO user) {
//        boolean rowUpdated = false;
//        int accountId = addAccount(user);
//        if (accountId == -1) {
//            return false;
//        } else {
//            try (Connection connection = BaseRepository.getConnectDB();
//                 PreparedStatement preparedStatement = connection.prepareStatement(ADD_USER)) {
//                preparedStatement.setString(1, user.getName());
//                preparedStatement.setBoolean(2, user.isGender());
//                preparedStatement.setDate(3, user.getBirthday());
//                preparedStatement.setString(4, user.getPhoneNumber());
//                preparedStatement.setString(5, user.getAddress());
//                preparedStatement.setInt(6, accountId);
//
//                rowUpdated = preparedStatement.executeUpdate() > 0;
//            } catch (SQLException e) {
//                throw new RuntimeException(e);
//            }
//            return rowUpdated;
//        }
//
//    }
//
//    public int addAccount(UserDTO user) {
//        int accountId = -1;
//        try (Connection connection = BaseRepository.getConnectDB();
//             PreparedStatement preparedStatement = connection.prepareStatement(ADD_ACCOUNT, java.sql.Statement.RETURN_GENERATED_KEYS)) {
//            preparedStatement.setString(1, user.getUsername());
//            preparedStatement.setString(2, user.getPassword());
//            preparedStatement.setString(3, user.getEmail());
//            preparedStatement.setInt(4, user.getMemberTypeId());
//
//            int affectedRows = preparedStatement.executeUpdate();
//
//            if (affectedRows > 0) {
//                try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
//                    if (generatedKeys.next()) {
//                        accountId = generatedKeys.getInt(1);
//                    }
//                }
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return accountId;
//    }


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

    public List<MemberType> getAllMemberType() {
        List<MemberType> memberTypeList = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_DISTINCT_MEMBER_TYPES)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("Id");
                String name = rs.getString("MemberTypeName");
                MemberType memberType = new MemberType(id, name);
                memberTypeList.add(memberType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return memberTypeList;
    }
}
