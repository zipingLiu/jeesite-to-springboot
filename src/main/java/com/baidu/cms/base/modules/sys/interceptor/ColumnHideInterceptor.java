package com.baidu.cms.base.modules.sys.interceptor;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baidu.cms.base.modules.column.entity.SysColumnHide;
import com.baidu.cms.base.modules.column.service.SysColumnHideService;
import com.baidu.cms.common.config.ColumnHideView;
import com.baidu.cms.common.config.Global;
import com.baidu.cms.common.utils.Collections3;
import com.baidu.cms.common.utils.RedisUtils;
import com.baidu.cms.common.utils.SpringContextHolder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 列隐藏配置 视图拦截器
 *
 * @author: shiyanjun
 * @Date: 2018/10/23 下午7:42
 */
public class ColumnHideInterceptor implements HandlerInterceptor {

    protected Logger logger = LoggerFactory.getLogger(getClass());

    private SysColumnHideService sysColumnHideService = SpringContextHolder.getBean(SysColumnHideService.class);
    private ListOperations<String, Object> lo = SpringContextHolder.getBean(ListOperations.class);

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        return true;
    }

    /**
     *  查询列隐藏配置写入视图对象
     *  @author: shiyanjun
     *  @Date: 2018/10/23 下午10:00
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object o, ModelAndView modelAndView) throws Exception {
        if (ColumnHideView.hasKey(modelAndView.getViewName())) {
            try {
                // 读缓存
                List<Object> list = lo.range(RedisUtils.prefix(Global.SYS_COLUMN_HIDE_LIST_KEY), 0, -1);
                if (!Collections3.isEmpty(list)) {
                    for (Object obj : list) {
                        SysColumnHide hide = JSON.parseObject(obj.toString(), SysColumnHide.class);
                        if (modelAndView.getViewName().equals(hide.getClassName())) {
                            modelAndView.addObject("columnHideArr", hide.getColumnHideArr());
                            logger.info("从缓存读取列隐藏配置:" + hide.getClassName() + "=" + hide.getColumnHideArr());
                            return;
                        }
                    }
                }
                // 读数据库
                List<SysColumnHide> hideList = sysColumnHideService.findAllList(new SysColumnHide());
                if (hideList != null && hideList.size() > 0) {
                    for (SysColumnHide hide : hideList) {
                        if (modelAndView.getViewName().equals(hide.getClassName())) {
                            modelAndView.addObject("columnHideArr", hide.getColumnHideArr());
                        }
                        JSONObject jsonObject = new JSONObject();
                        jsonObject.put("pageName", hide.getPageName());
                        jsonObject.put("className", hide.getClassName());
                        jsonObject.put("columnHideArr", hide.getColumnHideArr());
                        lo.leftPush(RedisUtils.prefix(Global.SYS_COLUMN_HIDE_LIST_KEY), JSON.toJSONString(jsonObject));
                        logger.info("从数据库查询列隐藏配置写入缓存:" + hide.getClassName() + "=" + hide.getColumnHideArr());

                    }
                }
            } catch (Exception e) {
                logger.error("拦截器查询列隐藏配置异常:" + e.toString());
            }
        }
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
