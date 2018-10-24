package com.baidu.cms.base.modules.gen.dao;

import com.baidu.cms.base.modules.gen.entity.GenTable;
import com.baidu.cms.base.modules.gen.entity.GenTableColumn;
import com.baidu.cms.common.persistence.CrudDao;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 业务表字段DAO接口
 *
 * @author Idea
 * @version 2013-10-15
 */
@Mapper
public interface GenDataBaseDictDao extends CrudDao<GenTableColumn> {

    /**
     * 查询表列表
     *
     * @param genTable
     * @return
     */
    List<GenTable> findTableList(GenTable genTable);

    /**
     * 获取数据表字段
     *
     * @param genTable
     * @return
     */
    List<GenTableColumn> findTableColumnList(GenTable genTable);

    /**
     * 获取数据表主键
     *
     * @param genTable
     * @return
     */
    List<String> findTablePK(GenTable genTable);

}
