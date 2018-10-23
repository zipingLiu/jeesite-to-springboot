package com.baidu.cms.base.modules.column.service;

import java.util.ArrayList;
import java.util.List;

import com.baidu.cms.common.config.Global;
import com.baidu.cms.common.utils.RedisUtils;
import com.baidu.cms.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.service.CrudService;
import com.baidu.cms.base.modules.column.entity.SysColumnHide;
import com.baidu.cms.base.modules.column.dao.SysColumnHideDao;

/**
 * 列隐藏配置Service
 * @author shiyanjun
 * @version 2018-10-22
 */
@Service
@Transactional(readOnly = true)
public class SysColumnHideService extends CrudService<SysColumnHideDao, SysColumnHide> {

	@Autowired
	private RedisUtils redisUtils;

	public SysColumnHide get(String id) {
		return super.get(id);
	}
	
	public List<SysColumnHide> findList(SysColumnHide sysColumnHide) {
		try {
			String key = Global.getSysColumnHideKey(sysColumnHide.getClassName());
			String value = redisUtils.get(key);
			logger.info("查询缓存:" + key + "=" + value);
			if (StringUtils.isNotBlank(value)) {
				List<SysColumnHide> hideList = new ArrayList<>();
				sysColumnHide.setColumnHideArr(value);
				hideList.add(sysColumnHide);
				return hideList;
			}
		} catch (Exception e) {
			logger.error("查询缓存异常:" + e.toString());
		}
		return super.findList(sysColumnHide);
	}
	
	public Page<SysColumnHide> findPage(Page<SysColumnHide> page, SysColumnHide sysColumnHide) {
		return super.findPage(page, sysColumnHide);
	}
	
	@Transactional(readOnly = false)
	public void save(SysColumnHide sysColumnHide) {
		super.save(sysColumnHide);
		try {
			// 写入缓存
			String key = Global.getSysColumnHideKey(sysColumnHide.getClassName());
			String value = sysColumnHide.getColumnHideArr();
			redisUtils.set(key, value);
			logger.info("写入缓存:" + key + "=" + value);
		} catch (Exception e) {
			logger.error("写入缓存异常:" + e.toString());
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(SysColumnHide sysColumnHide) {
		super.delete(sysColumnHide);
	}
	
}