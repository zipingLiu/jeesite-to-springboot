package com.baidu.cms.base.modules.syspagecol.entity;

public class ColLabVal {

    private String colLab;
    private String colVal;

    public ColLabVal() {
    }

    public ColLabVal(String colLab, String colVal) {
        this.colLab = colLab;
        this.colVal = colVal;
    }

    public String getColLab() {
        return colLab;
    }

    public void setColLab(String colLab) {
        this.colLab = colLab;
    }

    public String getColVal() {
        return colVal;
    }

    public void setColVal(String colVal) {
        this.colVal = colVal;
    }
}
