/**
 *
 */
package com.baidu.cms.base.modules.gen.dao;

import com.baidu.cms.base.modules.gen.entity.GenScheme;
import com.baidu.cms.common.persistence.CrudDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * 生成方案DAO接口
 * @author ThinkGem
 * @version 2013-10-15
 */
@Mapper
public interface GenSchemeDao extends CrudDao<GenScheme> {
	
}
