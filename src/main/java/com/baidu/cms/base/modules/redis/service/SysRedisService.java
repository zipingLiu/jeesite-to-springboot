package com.baidu.cms.base.modules.redis.service;

import com.baidu.cms.base.modules.redis.entity.SysRedis;
import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.utils.RedisUtils;
import com.baidu.cms.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

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

	/**
	 * 分页查询缓存
	 */
	public Page<SysRedis> findPage(Page<SysRedis> page, SysRedis sysRedis) {
		// 设置页码
		int pageNo = page.getPageNo();
		int pageSize = page.getPageSize();
		sysRedis.setPage(page);

		String redisKey = sysRedis.getRedisKey();
		List<String> keyList;
		if (StringUtils.isNotBlank(redisKey)) {
			keyList = new ArrayList<>(redisUtils.keys(redisKey));
		} else {
			keyList = new ArrayList<>(redisUtils.keys("*"));
		}
		page.setCount(keyList.size());
		List<SysRedis> list = new ArrayList<>();
		if (!CollectionUtils.isEmpty(keyList)) {
			int start = pageNo == 1 ? 0 : (pageNo - 1) * pageSize;
			for (int i = start, j = 0; i < keyList.size() && j < pageSize; i++, j++) {
				String key = keyList.get(i);
				String value = redisUtils.get(key);
				list.add(new SysRedis(key, value));
			}
		}
		page.setList(list);
		return page;
	}

	public void save(SysRedis sysRedis) {
		redisUtils.set(sysRedis.getRedisKey(), sysRedis.getRedisValue());
	}

	public void delete(SysRedis sysRedis) {
		redisUtils.delete(sysRedis.getRedisKey());
	}
}