package com.baidu.cms.studio.modules.psmatchsubmit.service;

import java.util.List;

import com.baidu.cms.studio.common.PsUserUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.service.CrudService;
import com.baidu.cms.studio.modules.psmatchsubmit.entity.PsMatchSubmit;
import com.baidu.cms.studio.modules.psmatchsubmit.dao.PsMatchSubmitDao;
import org.springframework.util.CollectionUtils;

/**
 * 提交管理Service
 * @author shiyanjun
 * @version 2018-10-18
 */
@Service
@Transactional(readOnly = true)
public class PsMatchSubmitService extends CrudService<PsMatchSubmitDao, PsMatchSubmit> {

	public PsMatchSubmit get(String id) {
		return super.get(id);
	}
	
	public List<PsMatchSubmit> findList(PsMatchSubmit psMatchSubmit) {
		return super.findList(psMatchSubmit);
	}
	
	public Page<PsMatchSubmit> findPage(Page<PsMatchSubmit> page, PsMatchSubmit psMatchSubmit) {
		Page<PsMatchSubmit> pageResutl = super.findPage(page, psMatchSubmit);
		if (!CollectionUtils.isEmpty(pageResutl.getList())) {
			for (PsMatchSubmit submit : pageResutl.getList()) {
				PsUserUtil.decrypt(submit);
			}
		}
		return pageResutl;
	}
	
	@Transactional(readOnly = false)
	public void save(PsMatchSubmit psMatchSubmit) {
		super.save(psMatchSubmit);
	}
	
	@Transactional(readOnly = false)
	public void delete(PsMatchSubmit psMatchSubmit) {
		super.delete(psMatchSubmit);
	}
	
}