package com.study.demo.config;

import com.study.demo.pojo.UserInfo;
import com.study.demo.sevice.RedisService;
import com.study.demo.util.RedisKeyUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.*;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.*;
import java.util.concurrent.TimeUnit;

@RunWith(SpringRunner.class)
@SpringBootTest
public class RedisConfigTest {
    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @Autowired
    private RedisTemplate redisTemplate;

    @Resource
    private ValueOperations<String,Object> valueOperations;

    @Autowired
    private HashOperations<String, String, Object> hashOperations;

    @Autowired
    private ListOperations<String, Object> listOperations;

    @Autowired
    private SetOperations<String, Object> setOperations;

    @Autowired
    private ZSetOperations<String, Object> zSetOperations;

    @Resource
    private RedisService redisService;

    @Test
    public void testObj() throws Exception{
        UserInfo userVo = new UserInfo();
        userVo.setId(5);
        userVo.setName("测试dfas");
        userVo.setAge("2");
        ValueOperations<String,Object> operations = redisTemplate.opsForValue();
        redisService.expireKey("name",20, TimeUnit.SECONDS);
        String key = RedisKeyUtil.getKey(UserInfo.Table,"name",userVo.getName());
        UserInfo vo = (UserInfo) operations.get(key);
        System.out.println(vo);
    }

    @Test
    public void testValueOperation(){
        UserInfo userInfo = new UserInfo();
        userInfo.setId(1);
        userInfo.setName("张飞");
        userInfo.setAge("78");
        ValueOperations<String,Object> operations = redisTemplate.opsForValue();
        operations.set("test",userInfo);
        UserInfo u = (UserInfo) operations.get("test");
        System.out.println(u.toString());
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

        //hashOperations.put("user:map","id","6");
        //hashOperations.putAll("user:map",map);
        Object obj = hashOperations.entries("user:map");
        System.out.println("obj: "+obj);
        List<String> mapStr = new ArrayList<>();
        List<String> mapStr2 = new ArrayList<>();
        mapStr.add("name");
        mapStr.add("age");
        mapStr2.add("name");
        Object obj2 = hashOperations.multiGet(key,Collections.singleton(mapStr));
        Object obj3 = hashOperations.multiGet(key,Collections.singleton(mapStr2));
        System.out.println("obj2: "+obj2);
        System.out.println("obj3: "+obj3);
    }
}
