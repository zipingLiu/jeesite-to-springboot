/**
 *
 */
package com.baidu.cms.base.modules.tool.dao;

import com.baidu.cms.base.modules.tool.entity.GenMenu;
import com.baidu.cms.common.persistence.CrudDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * 生成菜单DAO接口
 * @author shiyanjun
 * @version 2018-10-12
 */
@Mapper
public interface GenMenuDao extends CrudDao<GenMenu> {
	
}