package com.baidu.cms.studio.modules.psmatchprocess.service;

import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.service.CrudService;
import com.baidu.cms.studio.modules.psmatch.entity.PsMatch;
import com.baidu.cms.studio.modules.psmatch.service.PsMatchService;
import com.baidu.cms.studio.modules.psmatchprocess.dao.PsMatchProcessDao;
import com.baidu.cms.studio.modules.psmatchprocess.entity.PsMatchProcess;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 阶段管理Service
 *
 * @author shiyanjun
 * @version 2018-10-18
 */
@Service
@Transactional(readOnly = true)
public class PsMatchProcessService extends CrudService<PsMatchProcessDao, PsMatchProcess> {

    @Autowired
    private PsMatchService psMatchService;

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
        // 更新比赛表中的阶段ID
        PsMatch psMatch = psMatchService.get(String.valueOf(psMatchProcess.getMatchId()));
        if (psMatch != null && psMatch.getProcessId() == 0) {
            psMatch.setProcessId(Long.valueOf(psMatchProcess.getId()));
            psMatchService.save(psMatch);
        }
    }

    @Transactional(readOnly = false)
    public void delete(PsMatchProcess psMatchProcess) {
        super.delete(psMatchProcess);
    }

}