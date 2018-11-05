package com.baidu.cms.base.modules.redis.service;

import java.util.Map;

public interface RedisHashService {

    Map<String, Object> getHASH(String key);

    void addHASH(String key, String hkey, String hvalue);

    void delHASH(String key, String... hashKeys);

}
