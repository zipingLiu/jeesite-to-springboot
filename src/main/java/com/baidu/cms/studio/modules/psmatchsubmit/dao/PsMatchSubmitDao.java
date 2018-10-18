/**
 *
 */
package com.baidu.cms.studio.modules.psmatchsubmit.dao;

import com.baidu.cms.common.persistence.CrudDao;
import org.apache.ibatis.annotations.Mapper;
import com.baidu.cms.studio.modules.psmatchsubmit.entity.PsMatchSubmit;

/**
 * 提交管理DAO接口
 * @author shiyanjun
 * @version 2018-10-18
 */
@Mapper
public interface PsMatchSubmitDao extends CrudDao<PsMatchSubmit> {
	
}