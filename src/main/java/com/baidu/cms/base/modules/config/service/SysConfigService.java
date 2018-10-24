package com.baidu.cms.base.modules.config.service;

import com.baidu.cms.base.modules.config.dao.SysConfigDao;
import com.baidu.cms.base.modules.config.entity.SysConfig;
import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.service.CrudService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 配置参数管理Service
 *
 * @author shiyanjun
 * @version 2018-10-23
 */
@Service
@Transactional(readOnly = true)
public class SysConfigService extends CrudService<SysConfigDao, SysConfig> {

    public SysConfig get(String id) {
        return super.get(id);
    }

    public List<SysConfig> findList(SysConfig sysConfig) {
        return super.findList(sysConfig);
    }

    public Page<SysConfig> findPage(Page<SysConfig> page, SysConfig sysConfig) {
        return super.findPage(page, sysConfig);
    }

    @Transactional(readOnly = false)
    public void save(SysConfig sysConfig) {
        super.save(sysConfig);
    }

    @Transactional(readOnly = false)
    public void delete(SysConfig sysConfig) {
        super.delete(sysConfig);
    }

}