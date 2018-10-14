/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.baidu.cms.modules.sys.dao;

import com.baidu.cms.modules.sys.entity.Log;
import com.baidu.cms.common.persistence.CrudDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * 日志DAO接口
 *
 * @author ThinkGem
 * @version 2014-05-16
 */
@Mapper
public interface LogDao extends CrudDao<Log> {

}
