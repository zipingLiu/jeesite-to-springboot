/**
 *
 */
package com.baidu.cms.studio.modules.psuser.entity;

import org.hibernate.validator.constraints.Length;
import javax.validation.constraints.NotNull;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.baidu.cms.common.persistence.DataEntity;

/**
 * Studio用户Entity
 * @author shiyanjun
 * @version 2018-10-15
 */
public class PsUser extends DataEntity<PsUser> {
	
	private static final long serialVersionUID = 1L;
	private String userName;		// 用户名
	private Long userSourceId;		// 源ID
	private String userType;		// 用户类型 1：pass 2：uc
	private Date createTime;		// 创建时间
	private Date lastLoginTime;		// 更新时间
	private String statusCode;		// 状态：1可用
	private String isEmployee;		// 0:普通用户，1：百度帐号
	private String displayName;		// 显示名称
	private String trueName;		// 姓名
	private String idcard;		// 身份证
	private String mobile;		// 手机号
	private String capacity;		// 身份 Consts.UserCapacity
	private String workPlace;		// 工作地点
	private String position;		// 职位
	private String region;		// 地区
	private String portrait;		// 头像
	private String userAbs;		// 介绍
	private String companyName;		// 公司名称
	private String email;		// 邮箱
	
	public PsUser() {
		super();
	}

	public PsUser(String id){
		super(id);
	}

	@Length(min=1, max=100, message="用户名长度必须介于 1 和 100 之间")
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@NotNull(message="源ID不能为空")
	public Long getUserSourceId() {
		return userSourceId;
	}

	public void setUserSourceId(Long userSourceId) {
		this.userSourceId = userSourceId;
	}
	
	@Length(min=1, max=2, message="用户类型 1：pass 2：uc长度必须介于 1 和 2 之间")
	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="创建时间不能为空")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="更新时间不能为空")
	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	
	@Length(min=1, max=2, message="状态：1可用长度必须介于 1 和 2 之间")
	public String getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}
	
	@Length(min=1, max=2, message="0:普通用户，1：百度帐号长度必须介于 1 和 2 之间")
	public String getIsEmployee() {
		return isEmployee;
	}

	public void setIsEmployee(String isEmployee) {
		this.isEmployee = isEmployee;
	}
	
	@Length(min=1, max=100, message="显示名称长度必须介于 1 和 100 之间")
	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
	
	@Length(min=1, max=100, message="姓名长度必须介于 1 和 100 之间")
	public String getTrueName() {
		return trueName;
	}

	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}
	
	@Length(min=1, max=50, message="身份证长度必须介于 1 和 50 之间")
	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	
	@Length(min=1, max=50, message="手机号长度必须介于 1 和 50 之间")
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	@Length(min=1, max=2, message="身份证长度必须介于 1 和 2 之间")
	public String getCapacity() {
		return capacity;
	}

	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
	
	@Length(min=1, max=255, message="工作地点长度必须介于 1 和 255 之间")
	public String getWorkPlace() {
		return workPlace;
	}

	public void setWorkPlace(String workPlace) {
		this.workPlace = workPlace;
	}
	
	@Length(min=1, max=255, message="职位长度必须介于 1 和 255 之间")
	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}
	
	@Length(min=1, max=255, message="地区长度必须介于 1 和 255 之间")
	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}
	
	@Length(min=1, max=255, message="头像长度必须介于 1 和 255 之间")
	public String getPortrait() {
		return portrait;
	}

	public void setPortrait(String portrait) {
		this.portrait = portrait;
	}
	
	@Length(min=1, max=500, message="介绍长度必须介于 1 和 500 之间")
	public String getUserAbs() {
		return userAbs;
	}

	public void setUserAbs(String userAbs) {
		this.userAbs = userAbs;
	}
	
	@Length(min=1, max=255, message="公司名称长度必须介于 1 和 255 之间")
	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
	@Length(min=1, max=255, message="邮箱长度必须介于 1 和 255 之间")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}