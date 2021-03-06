package com.baidu.cms.base.modules.syspagecol.entity;

import com.baidu.cms.common.config.Global;
import com.baidu.cms.common.persistence.DataEntity;
import com.google.common.collect.Lists;
import org.hibernate.validator.constraints.Length;

import java.util.ArrayList;
import java.util.List;

/**
 * 视图展示列管理Entity
 *
 * @author shiyanjun
 * @version 2018-10-25
 */
public class SysPageCol extends DataEntity<SysPageCol> {

    private static final long serialVersionUID = 1L;
    private String moduleName;  // 模块名称
    private String entityName;  // 实体类名称
    private String viewPath;    // 视图路径
    private String viewName;    // 视图文件名称
    private String colAll;      // 所有列,逗号分隔
    private String colHide;     // 隐藏的列,多选,逗号分隔

    public SysPageCol() {
        super();
    }

    public SysPageCol(String id) {
        super(id);
    }

    /**
     * 根据PageColumn来构造SysPageCol
     */
    public SysPageCol(PageColumn pageColumn, String id, String colHide) {
        this.id = id;
        this.colHide = colHide;
        if (pageColumn != null) {
            this.viewName = pageColumn.getViewName();
            this.entityName = pageColumn.getEntityName();
            this.moduleName = pageColumn.getModuleName();
            this.viewPath = pageColumn.getViewPath();
            this.colAll = Global.getThListString(pageColumn.getViewName());
        }
    }

    @Length(min = 1, max = 50, message = "模块名称长度必须介于 1 和 50 之间")
    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    @Length(min = 1, max = 100, message = "实体类名称长度必须介于 1 和 100 之间")
    public String getEntityName() {
        return entityName;
    }

    public void setEntityName(String entityName) {
        this.entityName = entityName;
    }

    @Length(min = 1, max = 100, message = "视图路径长度必须介于 1 和 100 之间")
    public String getViewPath() {
        return viewPath;
    }

    public void setViewPath(String viewPath) {
        this.viewPath = viewPath;
    }

    @Length(min = 1, max = 50, message = "视图文件名称长度必须介于 1 和 50 之间")
    public String getViewName() {
        return viewName;
    }

    public void setViewName(String viewName) {
        this.viewName = viewName;
    }

    @Length(min = 1, max = 1000, message = "所有列长度必须介于 1 和 1000 之间")
    public String getColAll() {
        return colAll;
    }

    public void setColAll(String colAll) {
        this.colAll = colAll;
    }

    @Length(min = 0, max = 1000, message = "隐藏的列长度必须介于 0 和 1000 之间")
    public String getColHide() {
        return colHide;
    }

    public void setColHide(String colHide) {
        this.colHide = colHide;
    }

    public List<String> getColHideList() {
        List<String> list = Lists.newArrayList();
        if (colHide != null) {
            String[] split = colHide.split(",");
            for (int i = 0; i < split.length; i++) {
                list.add(split[i]);
            }
        }
        return list;
    }

    public void setColHideList(List<String> list) {
        StringBuilder sb = new StringBuilder();
        for (String s : list) {
            sb.append(s).append(",");
        }
        colHide = sb.toString();
    }

    public void setThList(List<String> list) {
        StringBuilder sb = new StringBuilder();
        for (String s : list) {
            sb.append(s).append(",");
        }
        colAll = sb.toString();
    }

    /**
     * 获取所有列(用于复选框)
     * thList为所有的列名集合
     */
    public List<ColLabVal> getColLabValList(List<String> thList) {
        List<ColLabVal> colLabValList = new ArrayList<>();
        for (int i = 0; i < thList.size(); i++) {
            colLabValList.add(new ColLabVal(thList.get(i), String.valueOf(i)));
        }
        return colLabValList;
    }

}