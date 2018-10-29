package com.baidu.cms.base.modules.redis.service;

import com.baidu.cms.base.modules.redis.entity.SysRedis;
import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.utils.RedisUtils;
import com.baidu.cms.common.utils.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Collections;
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
        String redisValue = redisUtils.getByKeyType(RedisUtils.prefix(redisKey));
        return redisValue != null ? new SysRedis(redisKey, redisValue) : null;
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
        List<String> keyList = new ArrayList<>(keySet);
        // 对key排序
        Collections.sort(keyList);
        page.setCount(keyList.size());
        List<SysRedis> list = new ArrayList<>();
        if (!CollectionUtils.isEmpty(keyList)) {
            int start = pageNo == 1 ? 0 : (pageNo - 1) * pageSize;
            for (int i = start, j = 0; i < keyList.size() && j < pageSize; i++, j++) {
                String key = keyList.get(i);
                String value = redisUtils.getByKeyType(key);
                list.add(new SysRedis(RedisUtils.delPrefix(key), value));
            }
        }
        page.setList(list);
        return page;
    }

    public void save(SysRedis sysRedis) {
        redisUtils.set(sysRedis.getRedisKey(), sysRedis.getRedisValue());
    }

    public void delete(SysRedis sysRedis) {
        redisUtils.delete(sysRedis.getRedisKey());
    }
}