package com.study.demo.mapper;

import com.study.demo.pojo.UserInfo;
import org.springframework.stereotype.Repository;


@Repository
public interface UserInfoMapper {

    UserInfo getUserById(Integer id);

}