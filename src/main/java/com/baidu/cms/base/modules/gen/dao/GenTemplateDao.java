/**
 *
 */
package com.baidu.cms.base.modules.gen.dao;

import com.baidu.cms.base.modules.gen.entity.GenTemplate;
import com.baidu.cms.common.persistence.CrudDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * 代码模板DAO接口
 * @author ThinkGem
 * @version 2013-10-15
 */
@Mapper
public interface GenTemplateDao extends CrudDao<GenTemplate> {
	
}
