package com.baidu.cms.common.cache;

import com.alibaba.fastjson.JSON;
import com.baidu.cms.base.modules.redis.entity.SysRedis;
import com.baidu.cms.common.config.Global;
import com.baidu.cms.common.utils.StringUtils;
import com.google.gson.Gson;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.DataType;
import org.springframework.data.redis.core.Cursor;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ScanOptions;
import org.springframework.data.redis.core.SetOperations;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;

/**
 * redis工具类
 *
 * @Author shiyanjun
 * @Date 2018/10/20 下午3:37
 * @Param
 * @Return
 * @Exception
 */
@Component
public class RedisUtils {

    private static Logger logger = LoggerFactory.getLogger(RedisUtils.class);

    // 默认缓存过期时间
    private static final long REDIS_DEFAULT_EXPIRE_SECOND = 60 * 60 * 12;

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;
    @Autowired
    private ValueOperations<String, String> valueOperations;
    @Autowired
    private HashOperations<String, String, Object> hashOperations;
    @Autowired
    private ListOperations<String, Object> listOperations;
    @Autowired
    private SetOperations<String, Object> setOperations;
    @Autowired
    private ZSetOperations<String, Object> zSetOperations;
    /**
     * 缓存key默认前缀
     */
    public static String DEFAULT_CACHE_PREFIX = "STUDIO-CMS:";
    public static boolean useDefaultPrefix = useDefaultKeyPrefix();
    /**
     * 默认过期时长，单位：秒
     */
    public final static long DEFAULT_EXPIRE = 60 * 60 * 24;
    /**
     * 不设置过期时长
     */
    public final static long NOT_EXPIRE = -1;
    private final static Gson gson = new Gson();

    public void set(String key, Object value, long expire) {
        valueOperations.set(prefix(key), toJson(value));
        if (expire != NOT_EXPIRE) {
            redisTemplate.expire(prefix(key), expire, TimeUnit.SECONDS);
        }
    }

    public void set(String key, Object value) {
        set(key, value, DEFAULT_EXPIRE);
    }

    public <T> T get(String key, Class<T> clazz, long expire) {
        String value = valueOperations.get(prefix(key));
        if (expire != NOT_EXPIRE) {
            redisTemplate.expire(prefix(key), expire, TimeUnit.SECONDS);
        }
        return value == null ? null : fromJson(value, clazz);
    }

    public <T> T get(String key, Class<T> clazz) {
        return get(key, clazz, NOT_EXPIRE);
    }

    public String get(String key, long expire) {
        String value = null;
        try {
            value = valueOperations.get(prefix(key));
            if (expire != NOT_EXPIRE) {
                redisTemplate.expire(prefix(key), expire, TimeUnit.SECONDS);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return value;
    }

    public String get(String key) {
        String value = get(key, NOT_EXPIRE);
        return value;
    }

    public Set<String> keys(String pattern) {
        Set<String> set = redisTemplate.keys(prefix(pattern));
        return set;
    }

    public void delete(String key) {
        try {
            redisTemplate.delete(prefix(key));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Object转成JSON数据
     */
    private String toJson(Object object) {
        if (object instanceof Integer || object instanceof Long || object instanceof Float ||
                object instanceof Double || object instanceof Boolean || object instanceof String) {
            return String.valueOf(object);
        }
        return gson.toJson(object);
    }

    /**
     * JSON数据，转成Object
     */
    private <T> T fromJson(String json, Class<T> clazz) {
        return gson.fromJson(json, clazz);
    }

    /**
     * 给key添加默认前缀
     */
    public static String prefix(String key) {
        if (useDefaultPrefix && !key.startsWith(DEFAULT_CACHE_PREFIX)) {
            key = DEFAULT_CACHE_PREFIX + key;
        }
        return key;
    }

    /**
     * 去掉key的前缀
     */
    public static String delPrefix(String key) {
        if (useDefaultPrefix && key.startsWith(DEFAULT_CACHE_PREFIX)) {
            String[] split = key.split(DEFAULT_CACHE_PREFIX);
            if (split.length > 1) {
                return split[1];
            }
        }
        return key;
    }

    /**
     * 从配置中读取是否使用缓存key默认前缀
     */
    public static boolean useDefaultKeyPrefix() {
        String value = Global.getConfig("useDefaultCacheKeyPrefix");
        boolean boo = Global.FALSE.equalsIgnoreCase(value);
        return StringUtils.isNotBlank(value) && boo ? false : true;
    }

    /**
     * 根据key的类型获取value
     * 将value转成json
     */
    public SysRedis getStringValByKeyType(String key) {
        DataType type = redisTemplate.type(key);
        SysRedis sysRedis = new SysRedis(type.code(), key, null);
        switch (type) {
            case STRING:
                sysRedis.setRedisValue(get(key));
                break;
            case LIST:
                List<Object> list = listOperations.range(key, 0, -1);
                sysRedis.setRedisValue(JSON.toJSONString(list));
                break;
            case SET:
                Set<Object> set = setOperations.members(key);
                sysRedis.setRedisValue(JSON.toJSONString(set));
                break;
            case ZSET:
                Set<Object> zSet = zSetOperations.range(key, 0, -1);
                sysRedis.setRedisValue(JSON.toJSONString(zSet));
                break;
            case HASH:
                Map<String, Object> map = hashOperations.entries(key);
                sysRedis.setRedisValue(JSON.toJSONString(map));
                break;
            default:
                logger.error("未知的key类型");
                break;
        }
        return sysRedis;
    }

    /**
     * 根据数据类型进行查询
     *
     * @param key 缓存key
     */
    public SysRedis getSysRedisByKeyType(String key) {
        DataType type = redisTemplate.type(key);
        SysRedis sysRedis = new SysRedis(type.code(), key, null);
        switch (type) {
            case STRING:
                sysRedis.setRedisValue(get((key)));
                break;
            case LIST:
                List<Object> list = listOperations.range(key, 0, -1);
                sysRedis.setValList(list);
                break;
            case SET:
                Set<Object> set = setOperations.members(key);
                sysRedis.setValSet(set);
                break;
            case ZSET:
                Cursor<ZSetOperations.TypedTuple<Object>> cursor = zSetOperations.scan(key, ScanOptions.NONE);
                List<SysRedis.ScoreVal> zsetList = new ArrayList<>();
                while (cursor.hasNext()) {
                    ZSetOperations.TypedTuple<Object> tuple = cursor.next();
                    String score = String.valueOf(tuple.getScore());
                    String value = String.valueOf(tuple.getValue());
                    zsetList.add(new SysRedis.ScoreVal(score, value));
                }
                sysRedis.setZsetList(zsetList);
                break;
            case HASH:
                Map<String, Object> map = hashOperations.entries(key);
                sysRedis.setValMap(map);
                break;
            default:
                logger.error("未知的key类型");
                break;
        }
        return sysRedis;
    }

    /**
     * 根据数据类型进行保存
     *
     * @param redisModel 各类型缓存统一模型
     */
    public void set(RedisModel redisModel) {
        long expire = redisModel.getExpire() > 0 ? redisModel.getExpire() : REDIS_DEFAULT_EXPIRE_SECOND;
        String prefixKey = RedisUtils.prefix(redisModel.getKey());
        redisTemplate.expire(prefixKey, expire, TimeUnit.SECONDS);
        switch (redisModel.getDataType()) {
            case STRING:
                valueOperations.set(prefixKey, redisModel.getValue());
                break;
            case LIST:
                if (redisModel.isLeft()) {
                    listOperations.leftPush(prefixKey, redisModel.getValue());
                } else {
                    listOperations.rightPush(prefixKey, redisModel.getValue());
                }
                break;
            case SET:
                setOperations.add(prefixKey, redisModel.getValue());
                break;
            case ZSET:
                zSetOperations.add(prefixKey, redisModel.getValue(), redisModel.getScore());
                break;
            case HASH:
                hashOperations.put(prefixKey, redisModel.getHashKey(), redisModel.getValue());
                break;
            default:
                break;
        }
    }

    /**
     * 根据key查询数据类型
     *
     * @param key
     */
    public DataType type(String key) {
        return redisTemplate.type(key);
    }
}