package com.baidu.cms.base.modules.column.service;

import java.util.List;

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

	public SysColumnHide get(String id) {
		return super.get(id);
	}
	
	public List<SysColumnHide> findList(SysColumnHide sysColumnHide) {
		return super.findList(sysColumnHide);
	}
	
	public Page<SysColumnHide> findPage(Page<SysColumnHide> page, SysColumnHide sysColumnHide) {
		return super.findPage(page, sysColumnHide);
	}
	
	@Transactional(readOnly = false)
	public void save(SysColumnHide sysColumnHide) {
		super.save(sysColumnHide);
	}
	
	@Transactional(readOnly = false)
	public void delete(SysColumnHide sysColumnHide) {
		super.delete(sysColumnHide);
	}
	
}