package com.baidu.cms.common.config;

import com.baidu.cms.common.interceptor.LogInterceptor;
import com.baidu.cms.common.interceptor.PageViewInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * WebMvc配置
 *
 * @author: shiyanjun
 * @Date: 2018/10/14 下午9:05
 */
@Configuration
public class WebConfig extends WebMvcConfigurerAdapter {

    /**
     * 拦截器配置，拦截顺序：先执行后定义的，排在第一位的最后执行。
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        LogInterceptor logInterceptor = new LogInterceptor();
        PageViewInterceptor pageViewInterceptor = new PageViewInterceptor();
        registry.addInterceptor(logInterceptor);
        registry.addInterceptor(pageViewInterceptor);
    }

}