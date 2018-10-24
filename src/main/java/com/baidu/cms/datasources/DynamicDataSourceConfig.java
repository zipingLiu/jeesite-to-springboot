package com.baidu.cms.datasources;

import com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.Map;

/**
 * 多数据源配置
 *
 * @author: shiyanjun
 * @Date: 2018/10/14 下午9:13
 */
@Configuration
public class DynamicDataSourceConfig {

    /**
     * base数据源
     */
    @Bean
    @ConfigurationProperties("spring.datasource.druid.base")
    public DataSource firstDataSource() {
        return DruidDataSourceBuilder.create().build();
    }

    /**
     * studio数据源
     */
    @Bean
    @ConfigurationProperties("spring.datasource.druid.studio")
    public DataSource secondDataSource() {
        return DruidDataSourceBuilder.create().build();
    }

    @Bean
    @Primary
    public DynamicDataSource dataSource(DataSource firstDataSource, DataSource secondDataSource) {
        Map<Object, Object> targetDataSources = new HashMap<>();
        targetDataSources.put(DataSourceNames.BASE.getKey(), firstDataSource);
        targetDataSources.put(DataSourceNames.STUDIO.getKey(), secondDataSource);
        return new DynamicDataSource(firstDataSource, targetDataSources);
    }
}
