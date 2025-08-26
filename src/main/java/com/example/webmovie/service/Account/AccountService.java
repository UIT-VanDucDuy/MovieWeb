package com.example.webmovie.service.Account;

import com.example.webmovie.entity.Account;
import com.example.webmovie.repo.Account.AccountRepo;
import com.example.webmovie.repo.Account.IAccountRepo;

import javax.servlet.http.HttpServletRequest;

public class AccountService implements IAccountService {
    private IAccountRepo accountRepo = new AccountRepo();
    @Override
    public Account login(String username, String password) {
        return accountRepo.login(username,password);
    }

    @Override
    public boolean signUp(String username,String email, String password1, String password2, HttpServletRequest request) {
        if (!password1.equals(password2)) {
            request.setAttribute("errorSignup", "Passwords do not match!");
            return false;
        }
        if (accountRepo.existsByUsername(username)) {
            request.setAttribute("errorSignup", "This account already exists");
            return false;
        }
        if (accountRepo.existsByEmail(email)) {
            request.setAttribute("errorSignup", "This email already exists");
        }

        Account account = new Account(username,email, password1, 1);
        boolean success = accountRepo.signUp(account);
        if (!success) {
            request.setAttribute("errorSignup", "Registration failed!");
        }
        return success;
    }

    @Override
    public boolean subscribe(Account account, int memberTypeId,HttpServletRequest request) {
        int currentMemberType = account.getMemberTypeId();
        if (currentMemberType >= memberTypeId) {
            request.setAttribute("errorSubscribe", "You are already subscribed to this package!");
            return false;
        }
        return accountRepo.subcribe(account, memberTypeId);

    }


}
