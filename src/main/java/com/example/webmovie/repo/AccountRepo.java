package com.example.webmovie.repo;

import com.example.webmovie.entity.Account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AccountRepo implements IAccountRepo {
    private static final String LOGIN_SQL = "SELECT * FROM Account WHERE Username = ? AND Password = ?";
    private final String SIGN_UP_SQL = "insert into products(Username,Password,MemberTypeId) values(?,?,?);";
    @Override
    public Account login(String username, String password) {
        Account account = null;
        try (Connection connection = BaseRepository.getConnectDB()) {
            PreparedStatement ps = connection.prepareStatement(LOGIN_SQL);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet resultSet = ps.executeQuery();
            if (resultSet.next()) {
                account = new Account(resultSet.getString("Username"),
                        resultSet.getString("Password"),resultSet.getInt("MemberTypeId"));
            }

        } catch (SQLException e) {
            System.out.println("lỗi querry");
        }
        return account;
    }

    @Override
    public Boolean signUp(Account account) {
        try( Connection connection = BaseRepository.getConnectDB();) {
            PreparedStatement preparedStatement = connection.prepareStatement(SIGN_UP_SQL);
            preparedStatement.setString(1,account.getUsername());
            preparedStatement.setString(2,account.getPassword());
            preparedStatement.setInt(3,account.getMemberTypeId());
            int effectRow = preparedStatement.executeUpdate();
            return effectRow==1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Boolean subcribe(Account account, int memberType) {
        return false;
    }

    @Override
    public Boolean existsByUsername(String username) {
        boolean exists = false;
        String sql = "SELECT 1 FROM Account WHERE Username = ? LIMIT 1";
        try (Connection connection = BaseRepository.getConnectDB()) {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                exists = true;
            }
        } catch (SQLException e) {
            System.out.println("lỗi querry");
        }
        return exists;
    }

}
