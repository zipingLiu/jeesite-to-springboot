package com.baidu.cms.common.config;

/**
 *  列隐藏视图路径枚举
 *  @author: shiyanjun
 *  @Date: 2018/10/23 下午9:58
 */
public enum ColumnHideView {

    psMatchList("studio/modules/psmatch/psMatchList"),
    psMatchProcessList("studio/modules/psmatchprocess/psMatchProcessList"),
    psMatchSubmitList("studio/modules/psmatchsubmit/psMatchSubmitList"),
    psMatchUserList("studio/modules/psmatchuser/psMatchUserList"),
    psProjectList("studio/modules/psproject/psProjectList"),
    psUserList("studio/modules/psuser/psUserList");

    private String key;

    ColumnHideView(String key) {
        this.key = key;
    }

    public static boolean hasKey(String key) {
        ColumnHideView[] values = ColumnHideView.values();
        for (ColumnHideView value : values) {
            if (value.getKey().equals(key)) {
                return true;
            }
        }
        return false;
    }

    public String getKey() {
        return key;
    }
}
