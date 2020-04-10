package com.study.demo.config;

import com.google.gson.Gson;
import com.study.demo.pojo.UserInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.*;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.*;

@RunWith(SpringRunner.class)
@SpringBootTest
public class RedisConfigTest {

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    @Resource
    private RedisTemplate redisTemplate;



    @Test
    public void testObj() throws Exception{
        UserInfo userVo = new UserInfo();
        userVo.setId(5);
        userVo.setName("测试dfas");
        userVo.setAge("2");
        String name = "吴星宇";
        ValueOperations<String,Object> valueOperations = redisTemplate.opsForValue();
        //key = t_User:id
        //String key = RedisKeyUtil.getKey(UserInfo.Table,"5");
        //valueOperations.set(key,userVo);
        //UserInfo vo = (UserInfo) operations.get(key);
        if(!redisTemplate.hasKey(name)) {
            valueOperations.set("name", name);
        }
        String newname = (String) valueOperations.get("name");
        System.out.println(newname);
    }

    @Test
    public void testValueOperation(){
        UserInfo userInfo = new UserInfo();
        userInfo.setId(1);
        userInfo.setName("张飞");
        userInfo.setAge("78");
        Gson gson = new Gson();
        //String jsonUser = gson.toJson(userInfo);
        ValueOperations<String,Object> operations = redisTemplate.opsForValue();
        String key = "t_user" ;
        if(redisTemplate.hasKey(key)){
            redisTemplate.delete(key);

        }else{

        }
        operations.set(key,userInfo);
        UserInfo u = (UserInfo) operations.get(key);
        //UserInfo userInfo1 = gson.fromJson(u,UserInfo.class);
        System.out.println(gson.toJson(u));
    }

    @Test
    public void testListOperation(){
        List<Integer> list = new ArrayList<>();
        ListOperations<String, Object> listOperations = redisTemplate.opsForList();
        for(int i=0;i<10;i++){
            listOperations.leftPush("int:list",i);
        }
        //Long l = listOperations.leftPushAll("user:list",list);

        Object obj = listOperations.range("user:list",0,1);
        Object obj2 = listOperations.range("int:list",0,10);
        List<List<Integer>> listList = (List)obj;
        System.out.println("obj: "+obj);
        for (List listinteger:listList) {
            System.out.println("list: "+listinteger);
        }
        System.out.println("obj2: "+obj2);
    }
    @Test
    public void testListOperation2(){
        ListOperations<String, Object> listOperations = redisTemplate.opsForList();
        UserInfo u1 = new UserInfo(1,"刘备","78");
        UserInfo u2 = new UserInfo(2,"张飞","88");
        UserInfo u3 = new UserInfo(3,"关羽","98");
        Long l = listOperations.leftPushAll("users:list",u1,u2,u3);
        System.out.println("count: "+l);
        Object obj= listOperations.range("users:list",0,3);
        System.out.println("obj: "+obj);
        for (UserInfo user:(List<UserInfo>)obj) {
            System.out.println("user: "+user.toString());
        }
    }
    @Test
    public void testHashOperation(){
        HashOperations<String, Object, Object> hashOperations= redisTemplate.opsForHash();
        Map<String,Object> map = new HashMap<>();
        map.put("name","赵云");
        map.put("age",18);
        String key = "user:map";

        hashOperations.put("user:map","id","6");
        //hashOperations.putAll("user:map",map);
        Object obj = hashOperations.entries("user:map");
        System.out.println("obj: "+obj);
        List<String> mapStr = new ArrayList<>();
        List<String> mapStr2 = new ArrayList<>();
        mapStr.add("name");
        mapStr.add("age");
        mapStr2.add("name");

    }
}
