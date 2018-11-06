package com.baidu.cms.base.modules.redis.service;

import com.baidu.cms.base.modules.redis.dao.RedisDao;
import com.baidu.cms.base.modules.redis.entity.SysRedis;
import com.baidu.cms.common.cache.RedisModel;
import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.utils.NumberUtil;
import com.baidu.cms.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.DataType;
import org.springframework.stereotype.Service;

@Service
public class RedisService {

    @Autowired
    private RedisDao redisDao;

    public SysRedis getByType(String key) {
        return redisDao.getByType(key);
    }

    public Page<SysRedis> findPage(Page<SysRedis> page, SysRedis sysRedis) {
        return redisDao.findPage(page, sysRedis);
    }

    public void save(SysRedis sysRedis) {
        RedisModel redisModel = new RedisModel();
        redisModel.setDataType(DataType.fromCode(sysRedis.getDataType()));
        redisModel.setKey(sysRedis.getRedisKey());
        redisModel.setValue(sysRedis.getRedisValue());
        redisModel.setHashKey(sysRedis.getHashKey());
        redisModel.setScore(StringUtils.toDouble(sysRedis.getScore()));
        redisModel.setLeft(StringUtils.toInteger(sysRedis.getFromLeft()) == 1);
        redisModel.setExpire(NumberUtil.toLong(sysRedis.getExpire()));

        redisDao.save(redisModel);
    }

    public void del(SysRedis sysRedis) {
        redisDao.del(sysRedis.getRedisKey());
    }

    public void remove(SysRedis sysRedis) {
        DataType type = DataType.fromCode(sysRedis.getDataType());
        switch (type) {
            case STRING:
                break;
            case HASH:
                redisDao.remove(sysRedis.getRedisKey(), sysRedis.getHashKey());
                break;
            default:
                redisDao.remove(sysRedis.getRedisKey(), sysRedis.getRedisValue());
                break;
        }
    }

    public void rename(SysRedis sysRedis) {
        redisDao.rename(sysRedis.getOldRedisKey(), sysRedis.getRedisKey());
    }
}
