package com.study.demo.util;

import java.io.*;

public class SerializeUtil {
    public static byte[] serialize(Object object){
        ByteArrayOutputStream baos = null;
        ObjectOutputStream oos = null;
        try {
            baos = new ByteArrayOutputStream();
            oos = new ObjectOutputStream(baos);
            oos.writeObject(object);
            byte[] bytes = baos.toByteArray();
            return bytes;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static Object unSerialize(byte[] bytes){
        ByteArrayInputStream bais = null;
        ObjectInputStream ois = null;
        bais = new ByteArrayInputStream(bytes);
        try {
            ois = new ObjectInputStream(bais);
            try {
                return ois.readObject();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

}
