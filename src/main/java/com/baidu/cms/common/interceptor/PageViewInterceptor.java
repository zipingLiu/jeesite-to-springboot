package com.baidu.cms.common.interceptor;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baidu.cms.common.config.Global;
import com.baidu.cms.common.utils.Collections3;
import com.baidu.cms.common.cache.RedisUtils;
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
            if (modelAndView != null && Global.viewPathList.contains(modelAndView.getViewName())) {
                // 读缓存
                List<Object> list = lo.range(RedisUtils.prefix(Global.SYS_PAGE_COL_LIST_KEY), 0, -1);
                if (!Collections3.isEmpty(list)) {
                    for (Object obj : list) {
                        JSONObject jsonObject = JSON.parseObject(obj.toString());
                        String viewPath = (String) jsonObject.get("viewPath");
                        String colHide = (String) jsonObject.get("colHide");
                        if (modelAndView.getViewName().equals(viewPath)) {
                            modelAndView.addObject("colHide", colHide);
                            logger.info("拦截器从缓存读取列隐藏配置:" + viewPath + "=" + colHide);
                            return;
                        }
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
