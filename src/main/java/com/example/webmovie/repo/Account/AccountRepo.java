package com.example.webmovie.repo.Account;

import com.example.webmovie.entity.Account;
import com.example.webmovie.repo.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountRepo implements IAccountRepo {
    private final String LOGIN_SQL = "SELECT * FROM Account WHERE Username = ? AND Password = ?";
    private final String SIGN_UP_SQL = "insert into Account(Username,Email,Password,MemberTypeId) values(?,?,?,?);";
    private final String GET_MONEY_SQL = "SELECT * FROM Account WHERE Username = ? AND Password = ?";
    private final String SUBSCRIBE_SQL = "UPDATE Wallet " +
            " SET Money = Money - ? " +
            " WHERE Id = (SELECT WalletId FROM User u join account a on u.AccountID = a.id WHERE a.Id = ?) " +
            " AND Money >= ?;";
    private final String ADD_MONEY_ADMIN_SQL = "UPDATE Wallet " +
            "SET Money = Money + ? " +
            "WHERE Id = 1;";

    @Override
    public Account login(String username, String password) {
        Account account = null;
        try (Connection connection = BaseRepository.getConnectDB()) {
            PreparedStatement ps = connection.prepareStatement(LOGIN_SQL);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet resultSet = ps.executeQuery();
            if (resultSet.next()) {
                int id = resultSet.getInt("id");
                String username1 = resultSet.getString("Username");
                String pass = resultSet.getString("Password");
                int memberTypeId = resultSet.getInt("MemberTypeId");
                account = new Account(id, username1, pass, memberTypeId);
            }

        } catch (SQLException e) {
            System.out.println("lỗi query");
        }
        return account;
    }

    @Override
    public Boolean signUp(Account account) {
        try( Connection connection = BaseRepository.getConnectDB();) {
            PreparedStatement preparedStatement = connection.prepareStatement(SIGN_UP_SQL);
            preparedStatement.setString(1,account.getUsername());
            preparedStatement.setString(2,account.getEmail());
            preparedStatement.setString(3,account.getPassword());
            preparedStatement.setInt(4,account.getMemberTypeId());
            int effectRow = preparedStatement.executeUpdate();
            return effectRow==1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Boolean subcribe(Account account, int memberType) {
        int amount;
        if(memberType ==2 ){
            amount = 100;
        }else if(memberType ==3 ){
            amount = 300;
        }else return false;

        try( Connection conn = BaseRepository.getConnectDB()) {
            conn.setAutoCommit(false); // transaction

            // 1. Trừ tiền trong Wallet
            PreparedStatement psWallet = conn.prepareStatement(SUBSCRIBE_SQL);
            psWallet.setInt(1, amount);
            psWallet.setInt(2, account.getId());
            psWallet.setInt(3, amount); // chỉ trừ nếu đủ tiền
            int rows = psWallet.executeUpdate();
            if (rows == 0) {
                conn.rollback();
                return false; // không đủ tiền
            }

            //2.Cộng tiền cho admin
            PreparedStatement psAdmin = conn.prepareStatement(ADD_MONEY_ADMIN_SQL);
            psAdmin.setInt(1, amount);
            int rows1 =psAdmin.executeUpdate();
            if (rows1 == 0) {
                conn.rollback();
                return false; //cộng tiền thất bại
            }

            // 3. Update memberType trong Account
            String sqlUpdateAccount = "UPDATE Account SET MemberTypeId = ? WHERE Id = ?";
            PreparedStatement psAccount = conn.prepareStatement(sqlUpdateAccount);
            psAccount.setInt(1, memberType);
            psAccount.setInt(2, account.getId());
            psAccount.executeUpdate();
            int rows2 =psAccount.executeUpdate();
            if (rows2 == 0) {
                conn.rollback();
                return false; //cộng tiền thất bại
            }

            conn.commit();

            // Cập nhật lại object Account trong session
            account.setMemberTypeId(memberType);
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
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
    @Override
    public Boolean existsByEmail(String email) {
        boolean exists = false;
        String sql = "SELECT 1 FROM Account WHERE Email = ? LIMIT 1";
        try (Connection connection = BaseRepository.getConnectDB()) {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
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
