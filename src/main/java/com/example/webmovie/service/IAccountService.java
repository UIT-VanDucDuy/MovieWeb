package com.example.webmovie.service;

import com.example.webmovie.entity.Account;

public interface IAccountService {
    boolean login(String username, String password);
    Account getAccount(String username);
}
