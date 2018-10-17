/**
 *
 */
package com.baidu.cms.base.modules.gen.dao;

import com.baidu.cms.base.modules.gen.entity.GenTableColumn;
import com.baidu.cms.common.persistence.CrudDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * 业务表字段DAO接口
 * @author Idea
 * @version 2013-10-15
 */
@Mapper
public interface GenTableColumnDao extends CrudDao<GenTableColumn> {
	
	public void deleteByGenTableId(String genTableId);
}
