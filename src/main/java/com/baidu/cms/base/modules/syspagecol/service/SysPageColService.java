package com.baidu.cms.base.modules.syspagecol.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baidu.cms.base.modules.syspagecol.dao.SysPageColDao;
import com.baidu.cms.base.modules.syspagecol.entity.SysPageCol;
import com.baidu.cms.common.config.Global;
import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.service.CrudService;
import com.baidu.cms.common.utils.RedisUtils;
import com.baidu.cms.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * 视图展示列管理Service
 *
 * @author shiyanjun
 * @version 2018-10-25
 */
@Service
@Transactional(readOnly = true)
public class SysPageColService extends CrudService<SysPageColDao, SysPageCol> {

    @Autowired
    private RedisUtils redisUtils;

    @Autowired
    private ListOperations<String, Object> listOps;

    @Autowired
    private SysPageColDao sysPageColDao;

    public SysPageCol get(String id) {
        return super.get(id);
    }

    public List<SysPageCol> findList(SysPageCol sysPageCol) {
        return super.findList(sysPageCol);
    }

    public Page<SysPageCol> findPage(Page<SysPageCol> page, SysPageCol sysPageCol) {
        return super.findPage(page, sysPageCol);
    }

    @Transactional(readOnly = false)
    public void save(SysPageCol sysPageCol) {
        super.save(sysPageCol);
        this.updateCache();
    }

    @Transactional(readOnly = false)
    public void delete(SysPageCol sysPageCol) {
        super.delete(sysPageCol);
        this.updateCache();
    }


    /**
     * 刷新缓存
     *
     * @author: shiyanjun
     * @Date: 2018/10/24 上午9:59
     */
    private void updateCache() {
        try {
            List<SysPageCol> list = findAllList(new SysPageCol());
            String key = RedisUtils.prefix(Global.SYS_PAGE_COL_LIST_KEY);
            // 先删除list,再写入
            redisUtils.delete(key);
            for (SysPageCol col : list) {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("moduleName", col.getModuleName());
                jsonObject.put("entityName", col.getEntityName());
                jsonObject.put("viewName", col.getViewName());
                jsonObject.put("viewPath", col.getViewPath());
                jsonObject.put("colHide", col.getColHide());
                String toJSONString = JSON.toJSONString(jsonObject);
                listOps.leftPush(RedisUtils.prefix(Global.SYS_PAGE_COL_LIST_KEY), toJSONString);
                logger.info("刷新视图展示列缓存:" + toJSONString);
            }
        } catch (Exception e) {
            logger.error("刷新视图展示列缓存异常:" + e.toString());
        }
    }

    /**
     * 验证视图名称是否可用，如果已存在，则返回false
     *
     * @param viewName
     * @return
     */
    public boolean checkTableName(String viewName) {
        if (StringUtils.isBlank(viewName)) {
            return true;
        }
        SysPageCol sysPageCol = new SysPageCol();
        sysPageCol.setViewName(viewName);
        List<SysPageCol> list = new ArrayList<>();
        try {
            list = sysPageColDao.findList(sysPageCol);
        } catch (Exception e) {
            // Nothing to do
        }
        return list.size() == 0;
    }
}