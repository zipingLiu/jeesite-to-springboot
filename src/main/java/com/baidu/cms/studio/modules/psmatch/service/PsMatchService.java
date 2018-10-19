package com.baidu.cms.studio.modules.psmatch.service;

import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.service.CrudService;
import com.baidu.cms.studio.modules.psmatch.dao.PsMatchDao;
import com.baidu.cms.studio.modules.psmatch.entity.PsMatch;
import com.baidu.cms.studio.modules.psmatchprocess.entity.PsMatchProcess;
import com.baidu.cms.studio.modules.psmatchprocess.service.PsMatchProcessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * 比赛管理Service
 * @author shiyanjun
 * @version 2018-10-17
 */
@Service
@Transactional(readOnly = true)
public class PsMatchService extends CrudService<PsMatchDao, PsMatch> {

	@Autowired
	private PsMatchProcessService processService;

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
		psMatch.setStatusCode(0);
		super.delete(psMatch);
		// 删除该比赛下所有比赛阶段
		PsMatchProcess process = new PsMatchProcess();
		process.setMatchId(Long.parseLong(psMatch.getId()));
		List<PsMatchProcess> list = processService.findList(process);
		if (!CollectionUtils.isEmpty(list)) {
			for (PsMatchProcess p : list) {
				processService.delete(p);
			}
		}
	}
	
}