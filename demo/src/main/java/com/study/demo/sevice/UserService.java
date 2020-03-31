package com.study.demo.sevice;


import com.study.demo.pojo.UserInfo;

public interface UserService {

    /**
     * 通过id获取用户信息
     * @param id
     * @return
     */
    UserInfo getUserById(Integer id);

    boolean set(String key);

}
