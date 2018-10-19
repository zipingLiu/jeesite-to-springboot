package com.baidu.cms.studio.modules.psmatchuser.dao;

import com.baidu.cms.common.persistence.CrudDao;
import org.apache.ibatis.annotations.Mapper;
import com.baidu.cms.studio.modules.psmatchuser.entity.PsMatchUser;

/**
 * 报名用户DAO接口
 * @author shiyanjun
 * @version 2018-10-18
 */
@Mapper
public interface PsMatchUserDao extends CrudDao<PsMatchUser> {
	
}