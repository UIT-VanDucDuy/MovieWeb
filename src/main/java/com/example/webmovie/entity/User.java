package com.example.webmovie.entity;

import java.sql.Date;

public class User {
    private int id;
    private String name;
    private boolean gender;
    private Date birthday;
    private String address;
    private String phoneNumber;
    private int accountId;

    public User(int id, String name, boolean gender, Date birthday, String address,String phoneNumber, int accountId) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.birthday = birthday;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.accountId = accountId;
    }

    public String getPhoneNumber() {
        return phoneNumber;
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

    public Date getBirthday() {
        return birthday;
    }

    public String getAddress() {
        return address;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }
}
