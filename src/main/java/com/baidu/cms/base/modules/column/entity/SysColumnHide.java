package com.baidu.cms.base.modules.column.entity;

import org.hibernate.validator.constraints.Length;

import com.baidu.cms.common.persistence.DataEntity;

/**
 * 列隐藏配置Entity
 * @author shiyanjun
 * @version 2018-10-22
 */
public class SysColumnHide extends DataEntity<SysColumnHide> {
	
	private static final long serialVersionUID = 1L;
	private String pageName;		// 页面名称
	private String className;		// 所属类名
	private String columnHideArr;		// 隐藏列索引
	
	public SysColumnHide() {
		super();
	}

	public SysColumnHide(String id){
		super(id);
	}

	@Length(min=1, max=50, message="页面名称长度必须介于 1 和 50 之间")
	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}
	
	@Length(min=1, max=50, message="所属类名长度必须介于 1 和 50 之间")
	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}
	
	@Length(min=0, max=100, message="隐藏列索引长度必须介于 0 和 100 之间")
	public String getColumnHideArr() {
		return columnHideArr;
	}

	public void setColumnHideArr(String columnHideArr) {
		this.columnHideArr = columnHideArr;
	}
	
}