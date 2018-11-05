package com.baidu.cms.base.modules.redis.service.impl;

import com.baidu.cms.base.modules.redis.dao.RedisDao;
import com.baidu.cms.base.modules.redis.service.RedisListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RedisListServiceImpl implements RedisListService {

    @Autowired
    private RedisDao redisDao;

    @Override
    public List<Object> getLIST(String key) {
        return redisDao.getLIST(key);
    }

    @Override
    public void addLIST(String key, String... values) {
        redisDao.addLIST(key, values);
    }

    @Override
    public void delLIST(String key) {
        redisDao.delLIST(key);
    }
}
