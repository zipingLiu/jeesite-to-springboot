package com.baidu.cms.studio.modules.psuser.service;

import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.service.CrudService;
import com.baidu.cms.studio.common.PsUserUtil;
import com.baidu.cms.studio.modules.psuser.dao.PsUserDao;
import com.baidu.cms.studio.modules.psuser.entity.PsUser;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * 用户管理Service
 *
 * @author shiyanjun
 * @version 2018-10-18
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
        Page<PsUser> pageResult = super.findPage(page, psUser);
        if (!CollectionUtils.isEmpty(pageResult.getList())) {
            for (PsUser user : pageResult.getList()) {
                PsUserUtil.decrypt(user);
            }
        }
        return pageResult;
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