package com.study.demo.sevice.impl;


import com.study.demo.commom.SerializeUtil;
import com.study.demo.mapper.UserInfoMapper;
import com.study.demo.pojo.UserInfo;
import com.study.demo.sevice.RedisService;
import com.study.demo.sevice.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserInfoMapper userInfoMapper;

    @Autowired
    private RedisService redisService;

    @Override
    public UserInfo getUserById(Integer id) {
        return userInfoMapper.getUserById(id);
    }

    @Override
    public boolean set(String key) {
        UserInfo userInfo = new UserInfo();
        userInfo.setId(3);
        userInfo.setName("小红");
        userInfo.setAge("18");
        UserInfo u = userInfoMapper.getUserById(userInfo.getId());
        if(u!=null){
            try {
                boolean bol= redisService.set(key,SerializeUtil.serialize(userInfo).toString());
                return bol;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else{
            return  false;
        }
        return false;
    }
}
