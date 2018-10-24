package com.baidu.cms.studio.modules.psproject.service;

import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.service.CrudService;
import com.baidu.cms.studio.modules.psproject.dao.PsProjectDao;
import com.baidu.cms.studio.modules.psproject.entity.PsProject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 项目管理Service
 *
 * @author shiyanjun
 * @version 2018-10-18
 */
@Service
@Transactional(readOnly = true)
public class PsProjectService extends CrudService<PsProjectDao, PsProject> {

    public PsProject get(String id) {
        return super.get(id);
    }

    public List<PsProject> findList(PsProject psProject) {
        return super.findList(psProject);
    }

    public Page<PsProject> findPage(Page<PsProject> page, PsProject psProject) {
        return super.findPage(page, psProject);
    }

    @Transactional(readOnly = false)
    public void save(PsProject psProject) {
        super.save(psProject);
    }

    @Transactional(readOnly = false)
    public void delete(PsProject psProject) {
        super.delete(psProject);
    }

}