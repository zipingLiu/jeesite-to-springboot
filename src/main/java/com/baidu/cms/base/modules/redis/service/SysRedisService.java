package com.baidu.cms.base.modules.redis.service;

import com.baidu.cms.base.modules.redis.entity.SysRedis;
import com.baidu.cms.common.utils.RedisUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 缓存管理Service
 * @author shiyanjun
 * @version 2018-10-20
 */
@Service
public class SysRedisService {

	@Autowired
	private RedisUtils redisUtils;

	public SysRedis get(String redisKey) {
		String redisValue = redisUtils.get(redisKey);
		return redisValue != null ? new SysRedis(redisKey, redisValue) : null;
	}

	public void save(SysRedis sysRedis) {
		redisUtils.set(sysRedis.getRedisKey(), sysRedis.getRedisValue());
	}

	public void delete(SysRedis sysRedis) {
		redisUtils.delete(sysRedis.getRedisKey());
	}
}