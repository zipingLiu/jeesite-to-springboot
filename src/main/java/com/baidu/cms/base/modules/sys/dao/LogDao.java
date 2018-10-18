package com.baidu.cms.base.modules.sys.dao;

import com.baidu.cms.base.modules.sys.entity.Log;
import com.baidu.cms.common.persistence.CrudDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * 日志DAO接口
 *
 * @author Idea
 * @version 2014-05-16
 */
@Mapper
public interface LogDao extends CrudDao<Log> {

}
