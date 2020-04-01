package com.study.demo.pojo;


import java.io.Serializable;

public class UserInfo implements Serializable {

    public  static final String Table = "t_user";

    private Integer id;
    private String name;
    private String age;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age='" + age + '\'' +
                '}';
    }

    public UserInfo(Integer id, String name, String age) {
        this.id = id;
        this.name = name;
        this.age = age;
    }

    public UserInfo() {
    }
}
