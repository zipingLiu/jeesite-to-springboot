/**
 *
 */
package com.baidu.cms.base.modules.test.dao;

import com.baidu.cms.common.persistence.CrudDao;
import org.apache.ibatis.annotations.Mapper;
import com.baidu.cms.base.modules.test.entity.TestDataMain;

/**
 * 主表DAO接口
 * @author shiyanjun
 * @version 2018-10-16
 */
@Mapper
public interface TestDataMainDao extends CrudDao<TestDataMain> {
	
}