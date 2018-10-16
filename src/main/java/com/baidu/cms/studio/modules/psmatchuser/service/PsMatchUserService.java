/**
 *
 */
package com.baidu.cms.studio.modules.psmatchuser.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.service.CrudService;
import com.baidu.cms.studio.modules.psmatchuser.entity.PsMatchUser;
import com.baidu.cms.studio.modules.psmatchuser.dao.PsMatchUserDao;

/**
 * 报名用户Service
 * @author shiyanjun
 * @version 2018-10-16
 */
@Service
@Transactional(readOnly = true)
public class PsMatchUserService extends CrudService<PsMatchUserDao, PsMatchUser> {

	public PsMatchUser get(String id) {
		return super.get(id);
	}
	
	public List<PsMatchUser> findList(PsMatchUser psMatchUser) {
		return super.findList(psMatchUser);
	}
	
	public Page<PsMatchUser> findPage(Page<PsMatchUser> page, PsMatchUser psMatchUser) {
		return super.findPage(page, psMatchUser);
	}
	
	@Transactional(readOnly = false)
	public void save(PsMatchUser psMatchUser) {
		super.save(psMatchUser);
	}
	
	@Transactional(readOnly = false)
	public void delete(PsMatchUser psMatchUser) {
		super.delete(psMatchUser);
	}
	
}