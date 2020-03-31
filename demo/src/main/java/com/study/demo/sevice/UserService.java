package com.study.demo.sevice;


import com.study.demo.pojo.UserInfo;

public interface UserService {

    UserInfo getUserById(Integer id);

    boolean set(String key);

}
