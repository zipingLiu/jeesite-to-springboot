/**
 *
 */
package com.baidu.cms.studio.modules.psproject.dao;

import com.baidu.cms.common.persistence.CrudDao;
import org.apache.ibatis.annotations.Mapper;
import com.baidu.cms.studio.modules.psproject.entity.PsProject;

/**
 * 项目管理DAO接口
 * @author shiyanjun
 * @version 2018-10-18
 */
@Mapper
public interface PsProjectDao extends CrudDao<PsProject> {
	
}