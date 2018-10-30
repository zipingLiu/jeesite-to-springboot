package com.baidu.cms.base.modules.redis.service;

import com.baidu.cms.base.modules.redis.entity.SysRedis;
import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.utils.RedisUtils;
import com.baidu.cms.common.utils.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.DataType;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 缓存管理Service
 *
 * @author shiyanjun
 * @version 2018-10-20
 */
@Service
public class SysRedisService {

    private static Logger logger = LoggerFactory.getLogger(SysRedisService.class);

    @Autowired
    private RedisUtils redisUtils;

    public SysRedis get(String redisKey) {
        String key = RedisUtils.prefix(redisKey);
        //SysRedis newSysRedis = redisUtils.getStringValByKeyType(key);
        SysRedis newSysRedis = redisUtils.getSysRedisByKeyType(key);
        return newSysRedis;
    }

    /**
     * 分页查询缓存
     */
    public Page<SysRedis> findPage(Page<SysRedis> page, SysRedis sysRedis) {
        // 设置页码
        int pageNo = page.getPageNo();
        int pageSize = page.getPageSize();
        sysRedis.setPage(page);

        String redisKey = sysRedis.getRedisKey();
        Set<String> keySet;
        if (StringUtils.isNotBlank(redisKey)) {
            keySet = redisUtils.keys(redisKey);
        } else {
            keySet = redisUtils.keys("*");
        }

        if (keySet == null || keySet.size() == 0) {
            page.setCount(0);
            page.setList(new ArrayList<>());
            return page;
        }

        // 类型过滤
        Set<String> filterKeySet = new HashSet<>();
        String dataType = sysRedis.getDataType();
        if (StringUtils.isNotBlank(dataType)) {
            for (String key : keySet) {
                DataType type = redisUtils.type(key);
                if (type.code().equals(dataType)) {
                    filterKeySet.add(key);
                }
            }
            // 如果根据key能查到,但数据类型匹配不上,则返回空
            if (CollectionUtils.isEmpty(filterKeySet)) {
                page.setCount(0);
                page.setList(new ArrayList<>());
                return page;
            }
        }

        List<String> keyList;
        if (!CollectionUtils.isEmpty(filterKeySet)) {
            keyList = new ArrayList<>(filterKeySet);
        } else {
            keyList = new ArrayList<>(keySet);
        }

        // 对key排序
        Collections.sort(keyList);
        page.setCount(keyList.size());
        List<SysRedis> list = new ArrayList<>();
        if (!CollectionUtils.isEmpty(keyList)) {
            int start = pageNo == 1 ? 0 : (pageNo - 1) * pageSize;
            for (int i = start, j = 0; i < keyList.size() && j < pageSize; i++, j++) {
                String key = keyList.get(i);
                SysRedis newSysRedis = redisUtils.getStringValByKeyType(key);
                list.add(newSysRedis);
            }
        }
        page.setList(list);
        return page;
    }

    public void save(SysRedis sysRedis) {
        String redisType = sysRedis.getDataType();
        DataType type = DataType.fromCode(redisType);
        String key = sysRedis.getRedisKey();
        String value = sysRedis.getRedisValue();
        String hashKey = sysRedis.getHashKey();
        double score = StringUtils.toDouble(sysRedis.getScore());
        boolean isLeft = StringUtils.toInteger(sysRedis.getFromLeft()) == 1;
        long expire = StringUtils.toLong(sysRedis.getExpire());
        redisUtils.set(type, key, value, hashKey, isLeft, score, expire);
    }

    public void delete(SysRedis sysRedis) {
        redisUtils.delete(sysRedis.getRedisKey());
    }
}