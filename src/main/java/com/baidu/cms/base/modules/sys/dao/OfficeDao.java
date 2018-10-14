/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.baidu.cms.modules.sys.dao;

import com.baidu.cms.modules.sys.entity.Office;
import com.baidu.cms.common.persistence.TreeDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * 机构DAO接口
 *
 * @author ThinkGem
 * @version 2014-05-16
 */
@Mapper
public interface OfficeDao extends TreeDao<Office> {

}
