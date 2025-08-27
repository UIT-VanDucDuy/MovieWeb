package com.example.webmovie.dto;

import java.sql.Date;

public class UserDTO {
    private int id;
    private String name;
    private String email;
    private Date birthday;
    private String phoneNumber;
    private String address;
    private boolean gender;
    private String username;
    private int accountId;
    private int memberTypeId;
    private double money;


    public UserDTO(String name, String email, Date birthday, String phoneNumber, String address, boolean gender, String username, int memberTypeId) {
        this.name = name;
        this.email = email;
        this.birthday = birthday;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.gender = gender;
        this.username = username;
        this.memberTypeId = memberTypeId;
    }

    public UserDTO(int id, String name, String email, Date birthday, String phoneNumber, String address, boolean gender, String username, int memberTypeId) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.birthday = birthday;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.gender = gender;
        this.username = username;
        this.memberTypeId = memberTypeId;
    }

    public UserDTO(int id, String name, String email, Date birthday, String phoneNumber, String address, boolean gender, String username, int accountId, int memberTypeId, double money) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.birthday = birthday;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.gender = gender;
        this.username = username;
        this.accountId = accountId;
        this.memberTypeId = memberTypeId;
        this.money = money;
    }
    public UserDTO(int id, String name, String email, Date birthday, String phoneNumber, String address, boolean gender, String username, int accountId, int memberTypeId) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.birthday = birthday;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.gender = gender;
        this.username = username;
        this.accountId = accountId;
        this.memberTypeId = memberTypeId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public int getMemberTypeId() {
        return memberTypeId;
    }

    public void setMemberTypeId(int memberTypeId) {
        this.memberTypeId = memberTypeId;
    }

    public double getMoney() {
        return money;
    }
}
