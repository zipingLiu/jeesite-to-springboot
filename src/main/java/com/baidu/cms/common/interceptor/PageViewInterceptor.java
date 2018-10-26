package com.baidu.cms.common.interceptor;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baidu.cms.base.modules.syspagecol.entity.SysPageCol;
import com.baidu.cms.base.modules.syspagecol.service.SysPageColService;
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
public class PageViewInterceptor implements HandlerInterceptor {

    protected Logger logger = LoggerFactory.getLogger(getClass());

    private SysPageColService sysPageColService = SpringContextHolder.getBean(SysPageColService.class);
    private ListOperations<String, Object> lo = SpringContextHolder.getBean(ListOperations.class);

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) {
        return true;
    }

    /**
     * 查询列隐藏配置写入视图对象
     *
     * @author: shiyanjun
     * @Date: 2018/10/23 下午10:00
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object o, ModelAndView modelAndView) {
        try {
            if (modelAndView != null && ColumnHideView.hasKey(modelAndView.getViewName())) {
                // 读缓存
                List<Object> list = lo.range(RedisUtils.prefix(Global.SYS_PAGE_COL_LIST_KEY), 0, -1);
                if (!Collections3.isEmpty(list)) {
                    for (Object obj : list) {
                        JSONObject jsonObject = JSON.parseObject(obj.toString());
//                        String moduleName = (String) jsonObject.get("moduleName");
//                        String entityName = (String) jsonObject.get("entityName");
//                        String viewName = (String) jsonObject.get("viewName");
                        String viewPath = (String) jsonObject.get("viewPath");
                        String colHide = (String) jsonObject.get("colHide");
                        if (modelAndView.getViewName().equals(viewPath)) {
                            modelAndView.addObject("colHide", colHide);
                            logger.info("拦截器从缓存读取列隐藏配置:" + viewPath + "=" + colHide);
                            return;
                        }
                    }
                }
                // 读数据库
                List<SysPageCol> pageColList = sysPageColService.findAllList(new SysPageCol());
                if (pageColList != null && pageColList.size() > 0) {
                    for (SysPageCol col : pageColList) {
                        if (modelAndView.getViewName().equals(col.getViewName())) {
                            modelAndView.addObject("colHide", col.getColHide());
                        }
                        JSONObject jsonObject = new JSONObject();
                        jsonObject.put("moduleName", col.getModuleName());
                        jsonObject.put("entityName", col.getEntityName());
                        jsonObject.put("viewName", col.getViewName());
                        jsonObject.put("viewPath", col.getViewPath());
                        jsonObject.put("colHide", col.getColHide());
                        String toJSONString = JSON.toJSONString(jsonObject);
                        lo.leftPush(RedisUtils.prefix(Global.SYS_PAGE_COL_LIST_KEY), toJSONString);
                        logger.info("拦截器从数据库查询列隐藏配置写入缓存:" + toJSONString);

                    }
                }
            }
        } catch (Exception e) {
            logger.error("拦截器查询列隐藏配置异常:" + e.toString());
        }

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {

    }
}
