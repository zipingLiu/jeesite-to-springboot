package com.baidu.cms.base.modules.redis.service.impl;

import com.baidu.cms.base.modules.redis.dao.RedisDao;
import com.baidu.cms.base.modules.redis.service.RedisHashService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class RedisHashServiceImpl implements RedisHashService {

    @Autowired
    private RedisDao redisDao;

    @Override
    public Map<String, Object> getHASH(String key) {
        return redisDao.getHASH(key);
    }

    @Override
    public void addHASH(String key, String hkey, String hvalue) {
        redisDao.addHASH(key, hkey, hvalue);
    }

    @Override
    public void delHASH(String key, String... hashKeys) {
        redisDao.delHASH(key, hashKeys);
    }
}
