package com.baidu.cms.studio.modules.psmatchprocess.dao;

import com.baidu.cms.common.persistence.CrudDao;
import com.baidu.cms.studio.modules.psmatchprocess.entity.PsMatchProcess;
import org.apache.ibatis.annotations.Mapper;

/**
 * 阶段管理DAO接口
 *
 * @author shiyanjun
 * @version 2018-10-18
 */
@Mapper
public interface PsMatchProcessDao extends CrudDao<PsMatchProcess> {

}