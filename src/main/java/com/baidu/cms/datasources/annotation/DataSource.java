package com.baidu.cms.datasources.annotation;

import com.baidu.cms.datasources.DataSourceNames;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 动态数据源注解
 *
 * @author: shiyanjun
 * @Date: 2018/10/14 下午8:30
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface DataSource {
    DataSourceNames name() default DataSourceNames.BASE;
}
