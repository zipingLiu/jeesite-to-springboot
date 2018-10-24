package com.baidu.cms.studio.modules.psmatchsubmit.service;

import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.service.CrudService;
import com.baidu.cms.studio.common.PsUserUtil;
import com.baidu.cms.studio.modules.psmatchsubmit.dao.PsMatchSubmitDao;
import com.baidu.cms.studio.modules.psmatchsubmit.entity.PsMatchSubmit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * 提交管理Service
 *
 * @author shiyanjun
 * @version 2018-10-18
 */
@Service
@Transactional(readOnly = true)
public class PsMatchSubmitService extends CrudService<PsMatchSubmitDao, PsMatchSubmit> {

    @Autowired
    private PsMatchSubmitDao psMatchSubmitDao;

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

    /**
     * 排行榜
     *
     * @author: shiyanjun
     * @Date: 2018/10/24 下午12:54
     */
    public Page<PsMatchSubmit> findSubmitTopPage(Page<PsMatchSubmit> page, PsMatchSubmit entity) {
        entity.setPage(page);
        List<PsMatchSubmit> pageTop = psMatchSubmitDao.findSubmitTopPage(entity);
        page.setList(pageTop);
        if (!CollectionUtils.isEmpty(page.getList())) {
            for (PsMatchSubmit submit : page.getList()) {
                PsUserUtil.decrypt(submit);
            }
        }
        return page;
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