package com.example.webmovie.entity;

public class User {
    private int id;
    private String name;
    private boolean gender;
    private String birthday;
    private String address;
    private int accountId;

    public User(int id, String name, boolean gender, String birthday, String address, int accountId) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.birthday = birthday;
        this.address = address;
        this.accountId = accountId;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public boolean isGender() {
        return gender;
    }

    public String getBirthday() {
        return birthday;
    }

    public String getAddress() {
        return address;
    }

    public int getAccountId() {
        return accountId;
    }
}
