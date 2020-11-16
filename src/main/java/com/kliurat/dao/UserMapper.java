package com.kliurat.dao;

import com.kliurat.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

    int addUser(User user);

    int deleteUserById(@Param("userID") int id);

    int updateUser(User user);

    User queryUserById(@Param("userID") int id);

    List<User> queryAllUser();

    User isExist(@Param("username") String username,@Param("password") String password);



}
