/**
 *
 */
package com.baidu.cms.studio.modules.psmatch.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.service.CrudService;
import com.baidu.cms.studio.modules.psmatch.entity.PsMatch;
import com.baidu.cms.studio.modules.psmatch.dao.PsMatchDao;

/**
 * 比赛管理Service
 * @author shiyanjun
 * @version 2018-10-16
 */
@Service
@Transactional(readOnly = true)
public class PsMatchService extends CrudService<PsMatchDao, PsMatch> {

	public PsMatch get(String id) {
		return super.get(id);
	}
	
	public List<PsMatch> findList(PsMatch psMatch) {
		return super.findList(psMatch);
	}
	
	public Page<PsMatch> findPage(Page<PsMatch> page, PsMatch psMatch) {
		return super.findPage(page, psMatch);
	}
	
	@Transactional(readOnly = false)
	public void save(PsMatch psMatch) {
		super.save(psMatch);
	}
	
	@Transactional(readOnly = false)
	public void delete(PsMatch psMatch) {
		super.delete(psMatch);
	}
	
}