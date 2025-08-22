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
            request.setAttribute("errorSignup", "Mật khẩu không trùng khớp!");
            return false;
        }
        if (accountRepo.existsByUsername(username)) {
            request.setAttribute("errorSignup", "Tài khoản đã tồn tại!");
            return false;
        }

        Account account = new Account(username, password1, 1);
        boolean success = accountRepo.signUp(account);
        if (!success) {
            request.setAttribute("errorSignup", "Có lỗi khi đăng ký!");
        }
        return success;
    }


}
