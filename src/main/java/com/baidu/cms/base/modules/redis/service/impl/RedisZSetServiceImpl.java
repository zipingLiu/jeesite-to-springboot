package com.baidu.cms.base.modules.redis.service.impl;

import com.baidu.cms.base.modules.redis.dao.RedisDao;
import com.baidu.cms.base.modules.redis.entity.SysRedis;
import com.baidu.cms.base.modules.redis.service.RedisZSetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RedisZSetServiceImpl implements RedisZSetService {

    @Autowired
    private RedisDao redisDao;


    @Override
    public List<SysRedis.ScoreVal> getZSET(String key) {
        return redisDao.getZSET(key);
    }

    @Override
    public void addZSET(String key, String value, double score) {
        redisDao.addZSET(key, value, score);
    }

    @Override
    public void delZSET(String key, String... values) {
        redisDao.delZSET(key, values);
    }
}
