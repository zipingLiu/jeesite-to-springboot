/**
 *
 */
package com.baidu.cms.studio.modules.seo.dao;

import com.baidu.cms.common.persistence.CrudDao;
import com.baidu.cms.studio.modules.seo.entity.TestSeo;
import org.apache.ibatis.annotations.Mapper;

/**
 * 官网SEODAO接口
 * @author shiyanjun
 * @version 2018-10-07
 */
@Mapper
public interface TestSeoDao extends CrudDao<TestSeo> {
	
}