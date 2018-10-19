package com.baidu.cms.studio.modules.psmatch.entity;

import org.hibernate.validator.constraints.Length;
import javax.validation.constraints.NotNull;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.baidu.cms.common.persistence.DataEntity;

/**
 * 比赛管理Entity
 * @author shiyanjun
 * @version 2018-10-17
 */
public class PsMatch extends DataEntity<PsMatch> {
	
	private static final long serialVersionUID = 1L;
	private String matchName;		// 比赛名称
	private String reward;		// 比赛奖金
	private Long processId;		// 当前比赛阶段
	private Long signupCount;		// 报名人数
	private Long projectId;		// 关联项目
	private Date startTime;		// 开始时间
	private Date endTime;		// 结束时间
	private Integer routine;		// 是否为常规赛
	private Integer statusCode;		// 状态
	private String matchAbs;		// 简介
	private String tags;		// 标签
	private String matchKey;		// 关键字
	private String logo;		// 比赛logo
	private String forumUrl;		// 论坛链接
	private Date createTime;		// 创建时间
	private Date updateTime;		// 更新时间
	private String processName;		// 比赛阶段名称
	private String projectName;		// 关联项目名称

	public PsMatch() {
		super();
	}

	public PsMatch(String id){
		super(id);
	}

	@Length(min=1, max=255, message="比赛名称长度必须介于 1 和 255 之间")
	public String getMatchName() {
		return matchName;
	}

	public void setMatchName(String matchName) {
		this.matchName = matchName;
	}
	
	@Length(min=1, max=100, message="比赛奖金长度必须介于 1 和 100 之间")
	public String getReward() {
		return reward;
	}

	public void setReward(String reward) {
		this.reward = reward;
	}
	
	@NotNull(message="当前比赛阶段不能为空")
	public Long getProcessId() {
		return processId;
	}

	public void setProcessId(Long processId) {
		this.processId = processId;
	}
	
	@NotNull(message="报名人数不能为空")
	public Long getSignupCount() {
		return signupCount;
	}

	public void setSignupCount(Long signupCount) {
		this.signupCount = signupCount;
	}
	
	@NotNull(message="关联项目不能为空")
	public Long getProjectId() {
		return projectId;
	}

	public void setProjectId(Long projectId) {
		this.projectId = projectId;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="开始时间不能为空")
	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="结束时间不能为空")
	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	
	@NotNull(message="是否为常规赛不能为空")
	public Integer getRoutine() {
		return routine;
	}

	public void setRoutine(Integer routine) {
		this.routine = routine;
	}
	
	@NotNull(message="状态不能为空")
	public Integer getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(Integer statusCode) {
		this.statusCode = statusCode;
	}
	
	@Length(min=1, max=1000, message="简介长度必须介于 1 和 1000 之间")
	public String getMatchAbs() {
		return matchAbs;
	}

	public void setMatchAbs(String matchAbs) {
		this.matchAbs = matchAbs;
	}
	
	@Length(min=1, max=255, message="标签长度必须介于 1 和 255 之间")
	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}
	
	@Length(min=1, max=255, message="关键字长度必须介于 1 和 255 之间")
	public String getMatchKey() {
		return matchKey;
	}

	public void setMatchKey(String matchKey) {
		this.matchKey = matchKey;
	}
	
	@Length(min=1, max=255, message="比赛logo长度必须介于 1 和 255 之间")
	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}
	
	@Length(min=1, max=255, message="论坛链接长度必须介于 1 和 255 之间")
	public String getForumUrl() {
		return forumUrl;
	}

	public void setForumUrl(String forumUrl) {
		this.forumUrl = forumUrl;
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

	public String getProcessName() {
		return processName;
	}

	public void setProcessName(String processName) {
		this.processName = processName;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
}