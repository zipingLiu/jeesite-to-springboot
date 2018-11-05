package com.baidu.cms.base.modules.redis.service.impl;

import com.baidu.cms.base.modules.redis.dao.RedisDao;
import com.baidu.cms.base.modules.redis.service.RedisSetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Set;

@Service
public class RedisSetServiceImpl implements RedisSetService {

    @Autowired
    private RedisDao redisDao;

    @Override
    public Set<Object> getSET(String key) {
        return redisDao.getSET(key);
    }

    @Override
    public void addSET(String key, String... values) {
        redisDao.addSET(key, values);
    }

    @Override
    public void delSET(String key, String... values) {
        redisDao.delSET(key, values);
    }
}
