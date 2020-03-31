package com.study.demo.controller;

import com.study.demo.sevice.RedisService;
import com.study.demo.sevice.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/test")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private RedisService redisService;

    @RequestMapping("getUser/{id}")
    @ResponseBody
    public Object getUser(@PathVariable int id){

        return userService.getUserById(id);
    }

    @RequestMapping("get/{key}")
    @ResponseBody
    public Object get(@PathVariable String key){
        try {
            return redisService.get(key);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "key is empty!";
    }

    @RequestMapping("set")
    @ResponseBody
    public Object set(){
        return userService.set("xiaohong");
    }


}
