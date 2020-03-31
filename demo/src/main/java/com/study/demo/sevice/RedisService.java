package com.study.demo.sevice;

import java.util.List;

/**
 * Created by zhangtao on 2017/11/8.
 */

public interface RedisService {

     /**
      * 设置缓存
      * @param key
      * @param value
      * @return
      * @throws Exception
      */
     boolean set(String key, String value) throws Exception;

     /**
      * 获得缓存
      * @param key
      * @return
      * @throws Exception
      */
     Object get(String key) throws Exception;

     /**
      * 设置key的缓存时间
      * @param key
      * @param expire
      * @return
      * @throws Exception
      */
     boolean expire(String key, long expire) throws Exception;

     /**
      * 将key-list的数据放入缓存
      * @param key
      * @param list
      * @param <T>
      * @return
      * @throws Exception
      */
     <T> boolean setList(String key, List<T> list) throws Exception;

     /**
      * 获取key-list的缓存
      * @param key
      * @param clz
      * @param <T>
      * @return
      * @throws Exception
      */
     <T> List<T> getList(String key, Class<T> clz) throws Exception;

     long lpush(String key, Object obj) throws Exception;

     long rpush(String key, Object obj) throws Exception;

     void hmset(String key, Object obj) throws Exception;

     <T> T hget(String key, Class<T> clz) throws Exception;


     void del(String key) throws Exception;

     <T> List<T>  hmGetAll(String key, Class<T> clz) throws Exception;

     String lpop(String key) throws Exception;
}
