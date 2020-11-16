package com.kliurat.service;


import com.kliurat.pojo.User;

public interface UserService {

    User isExist(String username, String password);

}
