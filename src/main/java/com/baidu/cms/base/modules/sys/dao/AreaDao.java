/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.baidu.cms.base.modules.sys.dao;

import com.baidu.cms.base.modules.sys.entity.Area;
import com.baidu.cms.common.persistence.TreeDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * 区域DAO接口
 *
 * @author ThinkGem
 * @version 2014-05-16
 */
@Mapper
public interface AreaDao extends TreeDao<Area> {

}
