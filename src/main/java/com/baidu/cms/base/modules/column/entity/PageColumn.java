package com.baidu.cms.base.modules.column.entity;

import java.util.List;

/**
 * 封装列表页面所有的列相关属性
 *
 * @author: shiyanjun
 * @Date: 2018/10/25 下午2:45
 */
public class PageColumn {

    /**
     * 所属模块
     */
    private String moduleName;

    /**
     * 实体类名
     */
    private String entityName;

    /**
     * 视图Path
     */
    private String viewPath;

    /**
     * 视图文件名(含扩展名)
     */
    private String viewName;

    /**
     * 所有的列名集合
     */
    private List<String> thList;

    public PageColumn() {
    }

    public PageColumn(String moduleName, String entityName, String viewPath, String viewName, List<String> thList) {
        this.moduleName = moduleName;
        this.entityName = entityName;
        this.viewPath = viewPath;
        this.viewName = viewName;
        this.thList = thList;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public String getEntityName() {
        return entityName;
    }

    public void setEntityName(String entityName) {
        this.entityName = entityName;
    }

    public String getViewPath() {
        return viewPath;
    }

    public void setViewPath(String viewPath) {
        this.viewPath = viewPath;
    }

    public String getViewName() {
        return viewName;
    }

    public void setViewName(String viewName) {
        this.viewName = viewName;
    }

    public List<String> getThList() {
        return thList;
    }

    public void setThList(List<String> thList) {
        this.thList = thList;
    }
}
