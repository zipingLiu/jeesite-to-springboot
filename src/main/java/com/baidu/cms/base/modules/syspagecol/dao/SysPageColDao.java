package com.baidu.cms.base.modules.syspagecol.dao;

import com.baidu.cms.common.persistence.CrudDao;
import org.apache.ibatis.annotations.Mapper;
import com.baidu.cms.base.modules.syspagecol.entity.SysPageCol;

/**
 * 视图展示列管理DAO接口
 * @author shiyanjun
 * @version 2018-10-25
 */
@Mapper
public interface SysPageColDao extends CrudDao<SysPageCol> {
	
}