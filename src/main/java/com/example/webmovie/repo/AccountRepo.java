package com.example.webmovie.repo;

import com.example.webmovie.entity.Account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AccountRepo implements IAccountRepo {
    private final String SELECT_ONE = "select * from products where username = ?;";
    private final String INSERT_INTO = "insert into products(username,password) values(?,?,?,?);";
    private static List<Account> accountList = new ArrayList<>();
    static {
        accountList.add(new Account(1,"admin@gmail.com","admin1",0));
        accountList.add(new Account(2,"alice","alice1",1));
        accountList.add(new Account(3,"bob","bob1",1));
    }

    @Override
    public Boolean login(String username, String password) {
        for (Account account : accountList) {
            if (account.getUsername().equals(username) && account.getPassword().equals(password)) {
                return true;
            }
        }
        return false;
    }

    @Override
    public Account getAccount(String username) {
        for (Account account : accountList) {
            if (account.getUsername().equals(username)) {
                return account;
            }
        }
        return null;
    }

    @Override
    public Boolean addAccount(Account account) {
        try(Connection connection = BaseRepository.getConnectDB();) {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1,account.getUsername());
            preparedStatement.setString(2,account.getPassword());
            preparedStatement.setInt(3,account.getMemberTypeId());
            int effectRow = preparedStatement.executeUpdate();
            return effectRow==1;
        } catch (SQLException e) {
            System.out.println("lỗi query");
            return false;
        }

    }


//    public List<Account> findAccount() {
//        // keets nối DB
//
//        try(Connection connection = BaseRepository.getConnectDB();) {
//            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ONE);
//            ResultSet resultSet = preparedStatement.executeQuery();
//            while (resultSet.next()){
//                int id = resultSet.getInt("id");
//                String name = resultSet.getString("name");
//                int price = resultSet.getInt("price");
//                String description = resultSet.getString("description");
//                String manufacturer = resultSet.getString("manufacturer");
//                Account account = new Account();
//                accountList.add(account);
//            }
//        } catch (SQLException e) {
//            System.out.println("Username không tồn tại");
//        }
//        return accountList;
//    }
//    @Override
//    public boolean delete(int id) {
//        try( Connection connection = BaseRepository.getConnectDB();) {
//            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
//            preparedStatement.setInt(1,id);
//            int effectRow = preparedStatement.executeUpdate();
//            return effectRow==1;
//        } catch (SQLException e) {
//            System.out.println("lỗi query");
//            return false;
//        }
//    }

}
