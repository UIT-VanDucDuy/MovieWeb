package com.example.webmovie.service;

import com.example.webmovie.entity.Account;
import com.example.webmovie.repo.AccountRepo;
import com.example.webmovie.repo.IAccountRepo;

import javax.servlet.http.HttpServletRequest;

public class AccountService implements IAccountService {
    private IAccountRepo accountRepo = new AccountRepo();
    @Override
    public Account login(String username, String password) {
        return accountRepo.login(username,password);
    }

    @Override
    public boolean signUp(String username, String password1, String password2, HttpServletRequest request) {
        if (!password1.equals(password2)) {
            request.setAttribute("errorSignup", "Passwords do not match!");
            return false;
        }
        if (accountRepo.existsByUsername(username)) {
            request.setAttribute("errorSignup", "This account already exists");
            return false;
        }

        Account account = new Account(username, password1, 1);
        boolean success = accountRepo.signUp(account);
        if (!success) {
            request.setAttribute("errorSignup", "Registration failed!");
        }
        return success;
    }


}
