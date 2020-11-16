package com.kliurat.service;

import com.kliurat.dao.UserMapper;
import com.kliurat.pojo.User;
import org.springframework.web.bind.annotation.RequestMapping;

public class UserServiceImpl implements UserService {

    private UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }



    public User isExist(String username, String password) {
        return userMapper.isExist(username,password);
    }
}
