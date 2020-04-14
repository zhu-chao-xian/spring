package com.study.demo.controller;

import org.springframework.web.bind.annotation.*;

@RestController
public class UserController {

    @RequestMapping(value = "/hello",method = {RequestMethod.GET})
    @ResponseBody
    public Object test(){
        return "good!";
    }


}
