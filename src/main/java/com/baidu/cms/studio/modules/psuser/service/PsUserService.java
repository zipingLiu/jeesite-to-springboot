/**
 *
 */
package com.baidu.cms.studio.modules.psuser.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.service.CrudService;
import com.baidu.cms.studio.modules.psuser.entity.PsUser;
import com.baidu.cms.studio.modules.psuser.dao.PsUserDao;

/**
 * Studio用户Service
 * @author shiyanjun
 * @version 2018-10-15
 */
@Service
@Transactional(readOnly = true)
public class PsUserService extends CrudService<PsUserDao, PsUser> {

	public PsUser get(String id) {
		return super.get(id);
	}
	
	public List<PsUser> findList(PsUser psUser) {
		return super.findList(psUser);
	}
	
	public Page<PsUser> findPage(Page<PsUser> page, PsUser psUser) {
		return super.findPage(page, psUser);
	}
	
	@Transactional(readOnly = false)
	public void save(PsUser psUser) {
		super.save(psUser);
	}
	
	@Transactional(readOnly = false)
	public void delete(PsUser psUser) {
		super.delete(psUser);
	}
	
}