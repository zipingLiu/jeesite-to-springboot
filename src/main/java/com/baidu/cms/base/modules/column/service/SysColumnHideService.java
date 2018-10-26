package com.baidu.cms.base.modules.column.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baidu.cms.base.modules.column.dao.SysColumnHideDao;
import com.baidu.cms.base.modules.column.entity.SysColumnHide;
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
 * 列隐藏配置Service
 *
 * @author shiyanjun
 * @version 2018-10-22
 */
@Service
@Transactional(readOnly = true)
public class SysColumnHideService extends CrudService<SysColumnHideDao, SysColumnHide> {

    @Autowired
    private RedisUtils redisUtils;

    @Autowired
    private ListOperations<String, Object> listOps;

    public SysColumnHide get(String id) {
        return super.get(id);
    }

    public List<SysColumnHide> findList(SysColumnHide sysColumnHide) {
        try {
            String key = Global.getSysColumnHideKey(sysColumnHide.getClassName());
            String value = redisUtils.get(key);
            logger.info("查询缓存:" + key + "=" + value);
            if (StringUtils.isNotBlank(value)) {
                List<SysColumnHide> hideList = new ArrayList<>();
                sysColumnHide.setColumnHideArr(value);
                hideList.add(sysColumnHide);
                return hideList;
            }
        } catch (Exception e) {
            logger.error("查询缓存异常:" + e.toString());
        }
        return super.findList(sysColumnHide);
    }

    public Page<SysColumnHide> findPage(Page<SysColumnHide> page, SysColumnHide sysColumnHide) {
        return super.findPage(page, sysColumnHide);
    }

    @Transactional(readOnly = false)
    public void save(SysColumnHide hide) {
        super.save(hide);
        //this.updateCache();
    }

    /**
     * 刷新缓存
     *
     * @author: shiyanjun
     * @Date: 2018/10/24 上午9:59
     */
    private void updateCache() {
        try {
            List<SysColumnHide> list = findAllList(new SysColumnHide());
            String key = RedisUtils.prefix(Global.SYS_PAGE_COL_LIST_KEY);
            // 先删除list,再写入
            redisUtils.delete(key);
            for (SysColumnHide hide : list) {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("pageName", hide.getPageName());
                jsonObject.put("className", hide.getClassName());
                jsonObject.put("columnHideArr", hide.getColumnHideArr());
                String value = JSON.toJSONString(jsonObject);
                listOps.leftPush(RedisUtils.prefix(Global.SYS_PAGE_COL_LIST_KEY), value);
                logger.info("写入缓存:" + key + "=" + value);
            }
        } catch (Exception e) {
            logger.error("写入缓存异常:" + e.toString());
        }
    }

    @Transactional(readOnly = false)
    public void delete(SysColumnHide sysColumnHide) {
        super.delete(sysColumnHide);
        //this.updateCache();
    }

}