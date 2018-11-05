package com.baidu.cms.base.modules.redis.service;

import java.util.Set;

public interface RedisSetService {

    Set<Object> getSET(String key);

    void addSET(String key, String... value);

    void delSET(String key, String... values);

}
