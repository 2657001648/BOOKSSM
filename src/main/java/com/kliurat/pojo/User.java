package com.kliurat.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {

    private int userID;
    private String username;
    private String password;
    private String email;
    private String phone;
    private int status;
    private int lendNum;
    private int maxNum;
    private String picture;

    public User(String username, String password, String email, String phone, int status, int lendNum, int maxNum, String picture) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.status = status;
        this.lendNum = lendNum;
        this.maxNum = maxNum;
        this.picture = picture;
    }
}
