package com.example.webmovie.service;

import com.example.webmovie.entity.Account;
import com.example.webmovie.repo.AccountRepo;
import com.example.webmovie.repo.IAccountRepo;

public class AccountService implements IAccountService {
    private IAccountRepo accountRepo = new AccountRepo();
    @Override
    public boolean login(String username, String password) {
        return accountRepo.login(username,password);
    }

    @Override
    public Account getAccount(String username) {
        return accountRepo.getAccount(username);
    }

}
