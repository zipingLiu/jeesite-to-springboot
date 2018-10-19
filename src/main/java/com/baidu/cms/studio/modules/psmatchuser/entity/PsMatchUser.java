package com.baidu.cms.studio.modules.psmatchuser.entity;

import javax.validation.constraints.NotNull;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.baidu.cms.common.persistence.DataEntity;

/**
 * 报名用户Entity
 * @author shiyanjun
 * @version 2018-10-18
 */
public class PsMatchUser extends DataEntity<PsMatchUser> {
	
	private static final long serialVersionUID = 1L;
	private Long matchId;		// 比赛ID
	private Long userId;		// 用户ID
	private Long processId;		// 阶段ID
	private Date createTime;	// 创建时间
	private Date updateTime;	// 更新时间
	private Integer routinePass;// 常规赛是否通过
	private String matchName;	// 比赛名称
	private String processName; // 比赛阶段名称

	/** ps_user表信息 */
	private String userName;	// 用户名
	private Integer userType;	// 用户类型
	private String trueName;	// 姓名
	private String idcard;		// 身份证
	private String mobile;		// 手机号
	private String email;		// 邮箱
	private String companyName;	// 公司名称
	private String region;		// 地区
	private Integer capacity;	// 身份
	private String workPlace;	// 工作地点
	private String position;	// 职位
	private String portrait;	// 头像
	private String userAbs;		// 介绍
	private Integer isEmployee;	// 是否为员工
	private String displayName;	// 显示名称

	
	public PsMatchUser() {
		super();
	}

	public PsMatchUser(String id){
		super(id);
	}

	@NotNull(message="比赛ID不能为空")
	public Long getMatchId() {
		return matchId;
	}

	public void setMatchId(Long matchId) {
		this.matchId = matchId;
	}
	
	@NotNull(message="用户ID不能为空")
	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}
	
	@NotNull(message="阶段ID不能为空")
	public Long getProcessId() {
		return processId;
	}

	public void setProcessId(Long processId) {
		this.processId = processId;
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
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
	@NotNull(message="常规赛是否通过不能为空")
	public Integer getRoutinePass() {
		return routinePass;
	}

	public void setRoutinePass(Integer routinePass) {
		this.routinePass = routinePass;
	}

	public String getMatchName() {
		return matchName;
	}

	public void setMatchName(String matchName) {
		this.matchName = matchName;
	}

	public String getProcessName() {
		return processName;
	}

	public void setProcessName(String processName) {
		this.processName = processName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getUserType() {
		return userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}

	public String getTrueName() {
		return trueName;
	}

	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public Integer getCapacity() {
		return capacity;
	}

	public void setCapacity(Integer capacity) {
		this.capacity = capacity;
	}

	public String getWorkPlace() {
		return workPlace;
	}

	public void setWorkPlace(String workPlace) {
		this.workPlace = workPlace;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getPortrait() {
		return portrait;
	}

	public void setPortrait(String portrait) {
		this.portrait = portrait;
	}

	public String getUserAbs() {
		return userAbs;
	}

	public void setUserAbs(String userAbs) {
		this.userAbs = userAbs;
	}

	public Integer getIsEmployee() {
		return isEmployee;
	}

	public void setIsEmployee(Integer isEmployee) {
		this.isEmployee = isEmployee;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
}