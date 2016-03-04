package com.scut.util;

import java.util.List;
import java.util.Map;
import java.util.Set;
 
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;
 
public class JedisUtil {
    private static String JEDIS_IP;
    private static int JEDIS_PORT;
    private static JedisPool jedisPool;
    static {

        JedisPoolConfig config = new JedisPoolConfig();
        /*config.setMaxActive(5000);*/
        config.setMaxIdle(256);//20
        config.setMaxWaitMillis(5000L);
        config.setTestOnBorrow(true);
        config.setTestOnReturn(true);
        config.setTestWhileIdle(true);
        config.setMinEvictableIdleTimeMillis(60000l);
        config.setTimeBetweenEvictionRunsMillis(3000l);
        config.setNumTestsPerEvictionRun(-1);
        jedisPool=new JedisPool(config, "115.28.101.73",6379);
    }
    /**
     * 获取数据
     * @param key
     * @return
     */
    public static String get(String key) {
        String value = null;
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            value = jedis.get(key);
        } catch (Exception e) {
            //释放redis对象
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
        } finally {
            //返还到连接池
            close(jedis);
        }
        return value;
    }
 
    @SuppressWarnings("deprecation")
	public static void close(Jedis jedis) {
        try {
            jedisPool.returnResource(jedis);
 
        } catch (Exception e) {
            if (jedis.isConnected()) {
                jedis.quit();
                jedis.disconnect();
            }
        }
    }
 
    /**
     * 获取数据
     * 
     * @param key
     * @return
     */
    @SuppressWarnings("deprecation")
	public static byte[] get(byte[] key) {
 
        byte[] value = null;
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            value = jedis.get(key);
        } catch (Exception e) {
            //释放redis对象
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
        } finally {
            //返还到连接池
            close(jedis);
        }
        return value;
    }
 
    public static void set(byte[] key, byte[] value) {
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            jedis.set(key, value);
        } catch (Exception e) {
            //释放redis对象
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
        } finally {
            //返还到连接池
            close(jedis);
        }
    }
 
    public static void set(byte[] key, byte[] value, int time) {
 
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            jedis.set(key, value);
            jedis.expire(key, time);
        } catch (Exception e) {
            //释放redis对象
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
        } finally {
            //返还到连接池
            close(jedis);
        }
    }
 
    public static void hset(byte[] key, byte[] field, byte[] value) {
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            jedis.hset(key, field, value);
        } catch (Exception e) {
            //释放redis对象
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
        } finally {
            //返还到连接池
            close(jedis);
        }
    }
 
    public static void hset(String key, String field, String value) {
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            jedis.hset(key, field, value);
        } catch (Exception e) {
            //释放redis对象
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
        } finally {
            //返还到连接池
            close(jedis);
        }
    }
 
    /**
     * 获取数据
     * 
     * @param key
     * @return
     */
    public static String hget(String key, String field) {
        String value = null;
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            value = jedis.hget(key, field);
        } catch (Exception e) {
            //释放redis对象
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
        } finally {
            //返还到连接池
            close(jedis);
        }
        return value;
    }
 
    /**
     * 获取数据
     * 
     * @param key
     * @return
     */
    public static byte[] hget(byte[] key, byte[] field) {
 
        byte[] value = null;
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            value = jedis.hget(key, field);
        } catch (Exception e) {
            //释放redis对象
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
        } finally {
            //返还到连接池
            close(jedis);
        }
 
        return value;
    }
    public static void hdel(byte[] key, byte[] field) {
 
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            jedis.hdel(key, field);
        } catch (Exception e) {
            //释放redis对象
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
        } finally {
            //返还到连接池
            close(jedis);
        }
    }
 
    /**
     * 存储REDIS队列 顺序存储
     * @param byte[] key reids键名
     * @param byte[] value 键�??
     */
    @SuppressWarnings("deprecation")
	public static void lpush(byte[] key, byte[] value) {
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            jedis.lpush(key, value);
 
        } catch (Exception e) {
            //释放redis对象
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
 
        } finally {
            //返还到连接池
            close(jedis);
        }
    }
    /**
     * 存储REDIS队列 反向存储
     * @param byte[] key reids键名
     * @param byte[] value 键�??
     */
    public static void rpush(byte[] key, byte[] value) {
 
        Jedis jedis = null;
        try {
 
            jedis = jedisPool.getResource();
            jedis.rpush(key, value);
 
        } catch (Exception e) {
 
            //释放redis对象
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
 
        } finally {
 
            //返还到连接池
            close(jedis);
 
        }
    }
 
    /**
     * 将列�? source 中的�?后一个元�?(尾元�?)弹出，并返回给客户端
     * @param byte[] key reids键名
     * @param byte[] value 键�??
     */
    public static void rpoplpush(byte[] key, byte[] destination) {
 
        Jedis jedis = null;
        try {
 
            jedis = jedisPool.getResource();
            jedis.rpoplpush(key, destination);
 
        } catch (Exception e) {
 
            //释放redis对象
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
 
        } finally {
 
            //返还到连接池
            close(jedis);
 
        }
    }
 
    /**
     * 获取队列数据
     * @param byte[] key 键名
     * @return
     */
    public static List<byte[]> lpopList(byte[] key) {
 
        List<byte[]> list = null;
        Jedis jedis = null;
        try {
 
            jedis = jedisPool.getResource();
            list = jedis.lrange(key, 0, -1);
 
        } catch (Exception e) {
 
            //释放redis对象
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
 
        } finally {
 
            //返还到连接池
            close(jedis);
 
        }
        return list;
    }
 
    /**
     * 获取队列数据
     * @param byte[] key 键名
     * @return
     */
    public static byte[] rpop(byte[] key) {
 
        byte[] bytes = null;
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            bytes = jedis.rpop(key);
        } catch (Exception e) {
            //释放redis对象
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
        } finally {
            //返还到连接池
            close(jedis);
        }
        return bytes;
    }
 
/*    public static void hmset(Object key, Map<String, string=""> hash) {
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            jedis.hmset(key.toString(), hash);
        } catch (Exception e) {
            //释放redis对象
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
 
        } finally {
            //返还到连接池
            close(jedis);
        }
    }*/
 
/*    public static void hmset(Object key, Map<string, string=""> hash, int time) {
        Jedis jedis = null;
        try {
 
            jedis = jedisPool.getResource();
            jedis.hmset(key.toString(), hash);
            jedis.expire(key.toString(), time);
        } catch (Exception e) {
            //释放redis对象
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
 
        } finally {
            //返还到连接池
            close(jedis);
 
        }
    }*/
 
    public static List<String> hmget(Object key, String... fields) {
        List<String> result = null;
        Jedis jedis = null;
        try {
 
            jedis = jedisPool.getResource();
            result = jedis.hmget(key.toString(), fields);
 
        } catch (Exception e) {
            //释放redis对象
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
 
        } finally {
            //返还到连接池
            close(jedis);
 
        }
        return result;
    }
 
    public static Set<String> hkeys(String key) {
        Set<String> result = null;
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            result = jedis.hkeys(key);
 
        } catch (Exception e) {
            //释放redis对象
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
 
        } finally {
            //返还到连接池
            close(jedis);
 
        }
        return result;
    }
 
    public static List<byte[]> lrange(byte[] key, int from, int to) {
        List<byte[]> result = null;
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            result = jedis.lrange(key, from, to);
 
        } catch (Exception e) {
            //释放redis对象
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
 
        } finally {
            //返还到连接池
            close(jedis);
 
        }
        return result;
    }
 
    public static Map<byte[],?> hgetAll(byte[] key) {
        Map<byte[],?> result = null;
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            result = jedis.hgetAll(key);
        } catch (Exception e) {
            //释放redis对象
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
 
        } finally {
            //返还到连接池
            close(jedis);
        }
        return result;
    }
 
    public static void del(byte[] key) {
 
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            jedis.del(key);
        } catch (Exception e) {
            //释放redis对象
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
        } finally {
            //返还到连接池
            close(jedis);
        }
    }
    public static long llen(byte[] key) {
        long len = 0;
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            jedis.llen(key);
        } catch (Exception e) {
            //释放redis对象
            jedisPool.returnBrokenResource(jedis);
            e.printStackTrace();
        } finally {
            //返还到连接池
            close(jedis);
        }
        return len;
    }
}