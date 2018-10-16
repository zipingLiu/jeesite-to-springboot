/**
 *
 */
package com.baidu.cms.studio.modules.psmatchprocess.dao;

import com.baidu.cms.common.persistence.CrudDao;
import org.apache.ibatis.annotations.Mapper;
import com.baidu.cms.studio.modules.psmatchprocess.entity.PsMatchProcess;

/**
 * 阶段管理DAO接口
 * @author shiyanjun
 * @version 2018-10-16
 */
@Mapper
public interface PsMatchProcessDao extends CrudDao<PsMatchProcess> {
	
}