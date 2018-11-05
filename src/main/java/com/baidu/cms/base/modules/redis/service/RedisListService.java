package com.baidu.cms.base.modules.redis.service;

import java.util.List;

public interface RedisListService {

    List<Object> getLIST(String key);

    void addLIST(String key, String... values);

    void delLIST(String key);
}
