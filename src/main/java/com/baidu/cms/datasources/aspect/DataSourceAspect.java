package com.baidu.cms.datasources.aspect;

import com.baidu.cms.datasources.DataSourceNames;
import com.baidu.cms.datasources.DynamicDataSource;
import com.baidu.cms.datasources.annotation.DataSource;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;

/**
 *  多数据源，切面处理类
 *  @author: shiyanjun
 *  @Date: 2018/10/14 下午9:35
 */
@Aspect
@Component
public class DataSourceAspect implements Ordered {
    protected Logger logger = LoggerFactory.getLogger(getClass());

    @Pointcut("@annotation(com.baidu.cms.datasources.annotation.DataSource)")
    public void dataSourcePointCutWithAnnotation() {

    }

    @Around("dataSourcePointCutWithAnnotation()")
    public Object aroundWithAnnotation(ProceedingJoinPoint point) throws Throwable {
        MethodSignature signature = (MethodSignature) point.getSignature();
        Method method = signature.getMethod();

        DataSource ds = method.getAnnotation(DataSource.class);
        if(ds == null){
            DynamicDataSource.setDataSource(DataSourceNames.FIRST);
            logger.debug(">>>>>>>>> set datasource is " + DataSourceNames.FIRST);
        }else {
            DynamicDataSource.setDataSource(ds.name());
            logger.debug(">>>>>>>>> set datasource is " + ds.name());
        }

        try {
            return point.proceed();
        } finally {
            DynamicDataSource.clearDataSource();
            logger.debug(">>>>>>>>> clean datasource");
        }
    }

    @Pointcut("execution(* com.baidu.cms.base.modules..*.*(..))")
    public void dataSourcePointCutForBasePackage() {

    }

    @Around("dataSourcePointCutForBasePackage()")
    public Object aroundForBasePackage(ProceedingJoinPoint point) throws Throwable {
        DynamicDataSource.setDataSource(DataSourceNames.FIRST);
        logger.debug(">>>>>>>>> set datasource is " + DataSourceNames.FIRST);
        try {
            return point.proceed();
        } finally {
            DynamicDataSource.clearDataSource();
            logger.debug(">>>>>>>>> clean datasource");
        }
    }

    @Pointcut("execution(* com.baidu.cms.studio.modules..*.*(..))")
    public void dataSourcePointCutForStudioPackage() {

    }

    @Around("dataSourcePointCutForStudioPackage()")
    public Object aroundForStudioPackage(ProceedingJoinPoint point) throws Throwable {
        DynamicDataSource.setDataSource(DataSourceNames.SECOND);
        logger.debug(">>>>>>>>> set datasource is " + DataSourceNames.SECOND);
        try {
            return point.proceed();
        } finally {
            DynamicDataSource.clearDataSource();
            logger.debug(">>>>>>>>> clean datasource");
        }
    }

    @Override
    public int getOrder() {
        return 1;
    }
}
