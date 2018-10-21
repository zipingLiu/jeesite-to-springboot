package com.baidu.cms.base.modules.redis.entity;

import com.baidu.cms.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;

/**
 * 缓存管理Entity
 * @author shiyanjun
 * @version 2018-10-20
 */
public class SysRedis extends DataEntity<SysRedis> implements Comparable<SysRedis>{
	
	private static final long serialVersionUID = 1L;
	private String redisKey;		// 缓存键
	private String redisValue;		// 缓存值
	
	public SysRedis() {
		super();
	}

	public SysRedis(String redisKey, String redisValue) {
		this.redisKey = redisKey;
		this.redisValue = redisValue;
	}

	@Length(min=1, max=200, message="缓存键长度必须介于 1 和 200 之间")
	public String getRedisKey() {
		return redisKey;
	}

	public void setRedisKey(String redisKey) {
		this.redisKey = redisKey;
	}
	
	public String getRedisValue() {
		return redisValue;
	}

	public void setRedisValue(String redisValue) {
		this.redisValue = redisValue;
	}

	/**
	 * 按key排序
	 */
	@Override
	public int compareTo(SysRedis sysRedis) {
		return this.redisKey.compareTo(sysRedis.getRedisKey());
	}
}