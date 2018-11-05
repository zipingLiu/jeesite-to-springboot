package com.baidu.cms.base.modules.redis.dao;

import com.baidu.cms.base.modules.redis.entity.SysRedis;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Component
public class RedisDao {

    @Autowired
    @Qualifier("redisTemplate")
    private RedisTemplate template;

    @Autowired
    @Qualifier("stringRedisTemplate")
    private StringRedisTemplate stringRedisTemplate;


    public Object getSTRING(String key) {
        return stringRedisTemplate.opsForValue().get(key);
    }

    public void addSTRING(String key, String value) {
        stringRedisTemplate.opsForValue().set(key, value);
    }

    public void delSTRING(String key) {
        stringRedisTemplate.delete(key);
    }

    public List<Object> getLIST(String key) {
        return template.opsForList().range(key, 0, -1);
    }

    public void addLIST(String key, String... values) {
        for (String value : values) {
            template.opsForList().rightPush(key, value);
        }
    }

    public void delLIST(String key) {
        template.opsForList().rightPop(key);
    }

    public Set<Object> getSET(String key) {
        return template.opsForSet().members(key);
    }

    public void addSET(String key, String... values) {
        template.opsForSet().add(key, values);
    }

    public void delSET(String key, String... values) {
        template.opsForSet().remove(key, values);
    }

    public Map<String, Object> getHASH(String key) {
        Map map = template.opsForHash().entries(key);
        return map;
    }

    public void addHASH(String key, String hkey, String hvalue) {
        template.opsForHash().put(key, hkey, hvalue);
    }

    public void delHASH(String key, String... hashKeys) {
        template.opsForHash().delete(key, hashKeys);
    }

    public List<SysRedis.ScoreVal> getZSET(String key) {
        List<SysRedis.ScoreVal> list = new ArrayList<>();
        Set<ZSetOperations.TypedTuple<Object>> set = template.opsForZSet().rangeWithScores(key, 0, -1);
        Iterator it = set.iterator();
        while (it.hasNext()) {
            ZSetOperations.TypedTuple<Object> next = (ZSetOperations.TypedTuple<Object>) it.next();
            list.add(new SysRedis.ScoreVal(String.valueOf(next.getScore()), String.valueOf(next.getValue())));
        }
        return list;
    }

    public void addZSET(String key, String value, double score) {
        template.opsForZSet().add(key, value, score);
    }

    public void delZSET(String key, String... values) {
        template.opsForZSet().remove(key, values);
    }
}
