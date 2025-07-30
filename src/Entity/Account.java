package Entity;

import java.util.Date;

public class Account {
    private  int id;
    private String userName;
    private String password;
    private String email;
    private int membertype;
    private Date CreateAt;

    public Account(int id, String userName, String password, String email, int membertype, Date createAt) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.membertype = membertype;
        CreateAt = createAt;
    }
}
