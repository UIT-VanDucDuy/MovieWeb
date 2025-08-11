package com.example.webmovie.repo;

import com.example.webmovie.entity.Account;

import java.util.ArrayList;
import java.util.List;

public class AccountRepo implements IAccountRepo {
    private static List<Account> accountList = new ArrayList<>();
    static {
        accountList.add(new Account(1,"admin","admin1",0));
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
}
