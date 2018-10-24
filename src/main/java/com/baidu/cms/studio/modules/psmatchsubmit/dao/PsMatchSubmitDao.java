package com.baidu.cms.studio.modules.psmatchsubmit.dao;

import com.baidu.cms.common.persistence.CrudDao;
import com.baidu.cms.studio.modules.psmatchsubmit.entity.PsMatchSubmit;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 提交管理DAO接口
 *
 * @author shiyanjun
 * @version 2018-10-18
 */
@Mapper
public interface PsMatchSubmitDao extends CrudDao<PsMatchSubmit> {

    List<PsMatchSubmit> findSubmitTopPage(PsMatchSubmit entity);
}