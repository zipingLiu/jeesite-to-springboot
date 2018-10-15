/**
 *
 */
package com.baidu.cms.studio.modules.pscode.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.service.CrudService;
import com.baidu.cms.studio.modules.pscode.entity.PsCode;
import com.baidu.cms.studio.modules.pscode.dao.PsCodeDao;

/**
 * code测试Service
 * @author shiyanjun
 * @version 2018-10-15
 */
@Service
@Transactional(readOnly = true)
public class PsCodeService extends CrudService<PsCodeDao, PsCode> {

	public PsCode get(String id) {
		return super.get(id);
	}
	
	public List<PsCode> findList(PsCode psCode) {
		return super.findList(psCode);
	}
	
	public Page<PsCode> findPage(Page<PsCode> page, PsCode psCode) {
		return super.findPage(page, psCode);
	}
	
	@Transactional(readOnly = false)
	public void save(PsCode psCode) {
		super.save(psCode);
	}
	
	@Transactional(readOnly = false)
	public void delete(PsCode psCode) {
		super.delete(psCode);
	}
	
}