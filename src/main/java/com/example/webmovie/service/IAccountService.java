package com.example.webmovie.service;

import com.example.webmovie.entity.Account;

import javax.servlet.http.HttpServletRequest;

public interface IAccountService {
    Account login(String username, String password);
    boolean signUp(String username, String password1, String password2, HttpServletRequest request);
}
