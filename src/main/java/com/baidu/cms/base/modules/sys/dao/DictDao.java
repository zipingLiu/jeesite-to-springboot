package com.baidu.cms.base.modules.sys.dao;

import com.baidu.cms.base.modules.sys.entity.Dict;
import com.baidu.cms.common.persistence.CrudDao;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 字典DAO接口
 *
 * @author ThinkGem
 * @version 2014-05-16
 */
@Mapper
public interface DictDao extends CrudDao<Dict> {

    List<String> findTypeList(Dict dict);

}
