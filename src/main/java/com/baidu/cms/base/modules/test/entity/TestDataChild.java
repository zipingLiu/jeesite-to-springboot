package com.baidu.cms.base.modules.test.entity;

import com.baidu.cms.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;

/**
 * 主表Entity
 *
 * @author shiyanjun
 * @version 2018-10-16
 */
public class TestDataChild extends DataEntity<TestDataChild> {

    private static final long serialVersionUID = 1L;
    private TestDataMain testDataMainId;        // 业务主表ID 父类
    private String name;        // 名称

    public TestDataChild() {
        super();
    }

    public TestDataChild(String id) {
        super(id);
    }

    public TestDataChild(TestDataMain testDataMainId) {
        this.testDataMainId = testDataMainId;
    }

    @NotNull(message = "业务主表ID不能为空")
    public TestDataMain getTestDataMainId() {
        return testDataMainId;
    }

    public void setTestDataMainId(TestDataMain testDataMainId) {
        this.testDataMainId = testDataMainId;
    }

    @Length(min = 1, max = 100, message = "名称长度必须介于 1 和 100 之间")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}