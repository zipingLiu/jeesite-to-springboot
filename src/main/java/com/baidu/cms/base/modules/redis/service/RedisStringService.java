package com.baidu.cms.base.modules.redis.service;

public interface RedisStringService {

    Object getSTRING(String key);

    void addSTRING(String key, String value);

    void delSTRING(String key);
}
