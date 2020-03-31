package com.study.demo.sevice.impl;

import com.study.demo.sevice.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import java.util.List;

@Service("redisService")
public class RedisServiceImpl implements RedisService {

    @Autowired
    private RedisTemplate<String,?> redisTemplate;

    @Override
    public boolean set(String key, String value) throws Exception {
        Assert.hasText(key,"key is not empty!");
        Boolean result = redisTemplate.execute(new RedisCallback<Boolean>() {

            @Override
            public Boolean doInRedis(RedisConnection redisConnection) throws DataAccessException {
                boolean bol;
                RedisSerializer<String> serializer = redisTemplate.getStringSerializer();
                bol = redisTemplate.hasKey(key);
                bol = redisConnection.set(serializer.serialize(key),serializer.serialize(value));
                return bol;
            }
        });
        return result;
    }

    @Override
    public Object get(String key) throws Exception {
        Assert.hasText(key,"key is not empty!");
        Object obj =  redisTemplate.execute(new RedisCallback<Object>() {
            @Override
            public String doInRedis(RedisConnection redisConnection) throws DataAccessException {
                RedisSerializer<String> serializer = redisTemplate.getStringSerializer();
                byte[] bytes = redisConnection.get(serializer.serialize(key));
                return serializer.deserialize(bytes);
            }
        });
        return obj;
    }

    @Override
    public boolean expire(String key, long expire) throws Exception {
        return false;
    }

    @Override
    public <T> boolean setList(String key, List<T> list) throws Exception {
        return false;
    }

    @Override
    public <T> List<T> getList(String key, Class<T> clz) throws Exception {
        return null;
    }

    @Override
    public long lpush(String key, Object obj) throws Exception {
        return 0;
    }

    @Override
    public long rpush(String key, Object obj) throws Exception {
        return 0;
    }

    @Override
    public void hmset(String key, Object obj) throws Exception {

    }

    @Override
    public <T> T hget(String key, Class<T> clz) throws Exception {
        return null;
    }

    @Override
    public void del(String key) throws Exception {

    }

    @Override
    public <T> List<T> hmGetAll(String key, Class<T> clz) throws Exception {
        return null;
    }

    @Override
    public String lpop(String key) throws Exception {
        return null;
    }
}
