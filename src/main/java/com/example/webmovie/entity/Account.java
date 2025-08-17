package com.example.webmovie.entity;

public class Account {
     private int id;
     private String username;
     private String password;
     private String email;
     private int memberTypeId;

    public Account(int id, String username, String password, int memberTypeId) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.memberTypeId = memberTypeId;
    }
    public Account( String username, String password, int memberTypeId) {
        this.username = username;
        this.password = password;
        this.memberTypeId = memberTypeId;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public int getMemberTypeId() {
        return memberTypeId;
    }
}
