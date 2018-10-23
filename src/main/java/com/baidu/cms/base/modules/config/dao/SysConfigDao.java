package com.baidu.cms.base.modules.config.dao;

import com.baidu.cms.common.persistence.CrudDao;
import org.apache.ibatis.annotations.Mapper;
import com.baidu.cms.base.modules.config.entity.SysConfig;

/**
 * 配置参数管理DAO接口
 * @author shiyanjun
 * @version 2018-10-23
 */
@Mapper
public interface SysConfigDao extends CrudDao<SysConfig> {
	
}