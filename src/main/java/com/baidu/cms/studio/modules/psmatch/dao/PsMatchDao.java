package com.baidu.cms.studio.modules.psmatch.dao;

import com.baidu.cms.common.persistence.CrudDao;
import com.baidu.cms.studio.modules.psmatch.entity.PsMatch;
import org.apache.ibatis.annotations.Mapper;

/**
 * 比赛管理DAO接口
 *
 * @author shiyanjun
 * @version 2018-10-17
 */
@Mapper
public interface PsMatchDao extends CrudDao<PsMatch> {

}