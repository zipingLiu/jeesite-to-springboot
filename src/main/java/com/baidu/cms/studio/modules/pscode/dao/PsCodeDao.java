/**
 *
 */
package com.baidu.cms.studio.modules.pscode.dao;

import com.baidu.cms.common.persistence.CrudDao;
import org.apache.ibatis.annotations.Mapper;
import com.baidu.cms.studio.modules.pscode.entity.PsCode;

/**
 * code测试DAO接口
 * @author shiyanjun
 * @version 2018-10-15
 */
@Mapper
public interface PsCodeDao extends CrudDao<PsCode> {
	
}