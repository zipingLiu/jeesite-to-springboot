/**
 *
 */
package com.baidu.cms.studio.modules.psmatchprocess.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.service.CrudService;
import com.baidu.cms.studio.modules.psmatchprocess.entity.PsMatchProcess;
import com.baidu.cms.studio.modules.psmatchprocess.dao.PsMatchProcessDao;

/**
 * 阶段管理Service
 * @author shiyanjun
 * @version 2018-10-18
 */
@Service
@Transactional(readOnly = true)
public class PsMatchProcessService extends CrudService<PsMatchProcessDao, PsMatchProcess> {

	public PsMatchProcess get(String id) {
		return super.get(id);
	}
	
	public List<PsMatchProcess> findList(PsMatchProcess psMatchProcess) {
		return super.findList(psMatchProcess);
	}
	
	public Page<PsMatchProcess> findPage(Page<PsMatchProcess> page, PsMatchProcess psMatchProcess) {
		return super.findPage(page, psMatchProcess);
	}
	
	@Transactional(readOnly = false)
	public void save(PsMatchProcess psMatchProcess) {
		super.save(psMatchProcess);
	}
	
	@Transactional(readOnly = false)
	public void delete(PsMatchProcess psMatchProcess) {
		super.delete(psMatchProcess);
	}
	
}