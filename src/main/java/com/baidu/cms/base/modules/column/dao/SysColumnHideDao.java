package com.baidu.cms.base.modules.column.dao;

import com.baidu.cms.base.modules.column.entity.SysColumnHide;
import com.baidu.cms.common.persistence.CrudDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * 列隐藏配置DAO接口
 *
 * @author shiyanjun
 * @version 2018-10-22
 */
@Mapper
public interface SysColumnHideDao extends CrudDao<SysColumnHide> {

}