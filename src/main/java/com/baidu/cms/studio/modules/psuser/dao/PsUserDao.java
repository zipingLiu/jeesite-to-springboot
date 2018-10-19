package com.baidu.cms.studio.modules.psuser.dao;

import com.baidu.cms.common.persistence.CrudDao;
import org.apache.ibatis.annotations.Mapper;
import com.baidu.cms.studio.modules.psuser.entity.PsUser;

/**
 * 用户管理DAO接口
 * @author shiyanjun
 * @version 2018-10-18
 */
@Mapper
public interface PsUserDao extends CrudDao<PsUser> {
	
}