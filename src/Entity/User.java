package Entity;

import java.util.Date;

public class User {
    private int id;
    private String name;
    private int gender;
    private Date Birthday;
    private String PhoneNumber;
    private String address;

    public User(int id, String name, int gender, Date birthday, String phoneNumber, String address) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        Birthday = birthday;
        PhoneNumber = phoneNumber;
        this.address = address;
    }

}
