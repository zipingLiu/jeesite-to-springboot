package com.baidu.cms.base.modules.sys.dao;

import com.baidu.cms.base.modules.sys.entity.Office;
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
