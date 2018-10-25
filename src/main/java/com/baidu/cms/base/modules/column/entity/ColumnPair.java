package com.baidu.cms.base.modules.column.entity;

public class ColumnPair {

    private Integer columnIndex;

    private String columnName;

    public ColumnPair() {
    }

    public ColumnPair(Integer columnIndex, String columnName) {
        this.columnIndex = columnIndex;
        this.columnName = columnName;
    }

    public Integer getColumnIndex() {
        return columnIndex;
    }

    public void setColumnIndex(Integer columnIndex) {
        this.columnIndex = columnIndex;
    }

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }
}
