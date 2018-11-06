package com.baidu.cms.base.modules.redis.dao;

import com.baidu.cms.base.modules.redis.entity.SysRedis;
import com.baidu.cms.common.cache.RedisModel;
import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.redis.connection.DataType;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;

@Component
public class RedisDao {

    @Autowired
    @Qualifier("redisTemplate")
    private RedisTemplate template;

    @Autowired
    @Qualifier("stringRedisTemplate")
    private StringRedisTemplate stringRedisTemplate;


    /**
     * 根据数据类型进行查询
     *
     * @param key 缓存key
     */
    public SysRedis getByType(String key) {
        DataType type = template.type(key);
        Long expire = template.getExpire(key);
        SysRedis sysRedis = new SysRedis(type.code(), key, null, String.valueOf(expire));
        switch (type) {
            case STRING:
                Object redisValue = template.opsForValue().get(key);
                sysRedis.setRedisValue(String.valueOf(redisValue));
                break;
            case LIST:
                List<Object> list = template.opsForList().range(key, 0, -1);
                sysRedis.setValList(list);
                break;
            case SET:
                Set<Object> set = template.opsForSet().members(key);
                sysRedis.setValSet(set);
                break;
            case ZSET:
                List<SysRedis.ScoreVal> zsetList = new ArrayList<>();
                Set<ZSetOperations.TypedTuple<Object>> tuples = template.opsForZSet().rangeWithScores(key, 0, -1);
                Iterator<ZSetOperations.TypedTuple<Object>> it = tuples.iterator();
                while (it.hasNext()) {
                    ZSetOperations.TypedTuple<Object> next = it.next();
                    zsetList.add(new SysRedis.ScoreVal(String.valueOf(next.getScore()), String.valueOf(next.getValue())));
                }
                sysRedis.setZsetList(zsetList);
                break;
            case HASH:
                Map<String, Object> map = template.opsForHash().entries(key);
                sysRedis.setValMap(map);
                break;
            default:
                break;
        }
        return sysRedis;
    }

    public Page<SysRedis> findPage(Page<SysRedis> page, SysRedis sysRedis) {

        // 设置页码
        int pageNo = page.getPageNo();
        int pageSize = page.getPageSize();
        sysRedis.setPage(page);

        Set<String> keySet;
        if (StringUtils.isNotBlank(sysRedis.getRedisKey())) {
            keySet = template.keys(sysRedis.getRedisKey());
        } else {
            keySet = template.keys("*");
        }
        List<String> keyList = new ArrayList<>(keySet);
        page.setCount(keyList.size());
        List<SysRedis> list = new ArrayList<>();
        if (!CollectionUtils.isEmpty(keyList)) {
            int start = pageNo == 1 ? 0 : (pageNo - 1) * pageSize;
            for (int i = start, j = 0; i < keyList.size() && j < pageSize; i++, j++) {
                String key = keyList.get(i);
                SysRedis newSysRedis = this.getByType(key);
                list.add(newSysRedis);
            }
        }
        page.setList(list);
        return page;
    }

    /**
     * 根据数据类型进行保存
     *
     * @param redisModel 各类型缓存统一模型
     */
    public void save(RedisModel redisModel) {
        String key = redisModel.getKey();
        switch (redisModel.getDataType()) {
            case STRING:
                template.opsForValue().set(key, redisModel.getValue());
                break;
            case LIST:
                if (redisModel.isLeft()) {
                    template.opsForList().leftPush(key, redisModel.getValue());
                } else {
                    template.opsForList().rightPush(key, redisModel.getValue());
                }
                break;
            case SET:
                template.opsForSet().add(key, redisModel.getValue());
                break;
            case ZSET:
                template.opsForZSet().add(key, redisModel.getValue(), redisModel.getScore());
                break;
            case HASH:
                template.opsForHash().put(key, redisModel.getHashKey(), redisModel.getValue());
                break;
            default:
                break;
        }
        // 更新过期时间
        setExpire(key, redisModel.getExpire());
    }

    public void del(String key) {
        template.delete(key);
    }

    /**
     * 删除集合中的元素
     *
     * @param key    集合的key
     * @param elName 集合的元素名称
     */
    public void remove(Object key, Object elName) {
        DataType type = template.type(key);
        switch (type) {
            case STRING:
                break;
            case LIST:
                // TODO 需要按索引删除元素
                template.opsForList().rightPop(key);
                break;
            case SET:
                template.opsForSet().remove(key, elName);
                break;
            case ZSET:
                template.opsForZSet().remove(key, elName);
                break;
            case HASH:
                template.opsForHash().delete(key, elName);
                break;
            case NONE:
                break;
        }
    }

    public void rename(Object oldKey, Object newKey) {
        template.rename(oldKey, newKey);
    }

    /**
     * 更新过期时间
     *
     * @param key    缓存key
     * @param expire 过期时间,单位秒
     */
    public void setExpire(String key, Long expire) {
        // 忽略等于0的过期时间
        if (expire != null && expire != 0) {
            if (expire < 0) {
                template.persist(key);
            } else {
                template.expire(key, expire * 1000, TimeUnit.MILLISECONDS);
            }
        }
    }

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

    public void addLIST(String key, Object... values) {
        for (Object value : values) {
            template.opsForList().rightPush(key, value);
        }
    }

    public void delLIST(String key) {
        template.opsForList().rightPop(key);
    }

    public Set<Object> getSET(String key) {
        return template.opsForSet().members(key);
    }

    public void addSET(String key, Object... values) {
        template.opsForSet().add(key, values);
    }

    public void delSET(String key, Object... values) {
        template.opsForSet().remove(key, values);
    }

    public Map<String, Object> getHASH(String key) {
        Map map = template.opsForHash().entries(key);
        return map;
    }

    public void addHASH(String key, String hkey, String hvalue) {
        template.opsForHash().put(key, hkey, hvalue);
    }

    public void delHASH(String key, Object... hashKeys) {
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

    public void delZSET(String key, Object... values) {
        template.opsForZSet().remove(key, values);
    }
}
