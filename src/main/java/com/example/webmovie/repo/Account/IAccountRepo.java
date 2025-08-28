package com.example.webmovie.repo.Account;

import com.example.webmovie.entity.Account;

public interface IAccountRepo {
    Account login(String username,String password);
    Boolean signUp(Account account);
    Boolean subcribe(Account account, int memberType);
    Boolean existsByUsername(String username);
    Boolean existsByEmail(String email);
}
