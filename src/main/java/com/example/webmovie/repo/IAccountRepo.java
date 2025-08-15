package com.example.webmovie.repo;

import com.example.webmovie.entity.Account;

public interface IAccountRepo {
    Boolean login(String username,String password);
    Account getAccount(String username);
    Boolean addAccount(Account account);

}
