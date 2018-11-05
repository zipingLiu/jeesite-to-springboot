package com.baidu.cms.base.modules.redis.service;

import com.baidu.cms.base.modules.redis.entity.SysRedis;

import java.util.List;

public interface RedisZSetService {

    List<SysRedis.ScoreVal> getZSET(String key);

    void addZSET(String key, String value, double score);

    void delZSET(String key, String... value);
}
