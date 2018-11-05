package com.baidu.cms.base.modules.redis.service.impl;

import com.baidu.cms.base.modules.redis.dao.RedisDao;
import com.baidu.cms.base.modules.redis.service.RedisStringService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RedisStringServiceImpl implements RedisStringService {

    @Autowired
    private RedisDao redisDao;

    @Override
    public Object getSTRING(String key) {
        return redisDao.getSTRING(key);
    }

    @Override
    public void addSTRING(String key, String value) {
        redisDao.addSTRING(key, value);
    }

    @Override
    public void delSTRING(String key) {
        redisDao.delSTRING(key);
    }
}
