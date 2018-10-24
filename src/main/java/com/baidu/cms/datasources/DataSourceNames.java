package com.baidu.cms.datasources;

/**
 * 增加数据源，在此配置
 *
 * @author: shiyanjun
 * @Date: 2018/10/14 下午8:35
 */
public enum DataSourceNames {

    /**
     * 默认base库
     */
    BASE("base"),

    /**
     * studio业务库
     */
    STUDIO("studio");


    private String key;

    DataSourceNames(String key) {
        this.key = key;
    }

    public String getKey() {
        return key;
    }

}
