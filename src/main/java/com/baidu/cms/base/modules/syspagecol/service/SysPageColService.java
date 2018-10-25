package com.baidu.cms.base.modules.syspagecol.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.service.CrudService;
import com.baidu.cms.base.modules.syspagecol.entity.SysPageCol;
import com.baidu.cms.base.modules.syspagecol.dao.SysPageColDao;

/**
 * 视图展示列管理Service
 * @author shiyanjun
 * @version 2018-10-25
 */
@Service
@Transactional(readOnly = true)
public class SysPageColService extends CrudService<SysPageColDao, SysPageCol> {

	public SysPageCol get(String id) {
		return super.get(id);
	}
	
	public List<SysPageCol> findList(SysPageCol sysPageCol) {
		return super.findList(sysPageCol);
	}
	
	public Page<SysPageCol> findPage(Page<SysPageCol> page, SysPageCol sysPageCol) {
		return super.findPage(page, sysPageCol);
	}
	
	@Transactional(readOnly = false)
	public void save(SysPageCol sysPageCol) {
		super.save(sysPageCol);
	}
	
	@Transactional(readOnly = false)
	public void delete(SysPageCol sysPageCol) {
		super.delete(sysPageCol);
	}
	
}