package com.baidu.cms.studio.modules.psproject.entity;

import org.hibernate.validator.constraints.Length;
import javax.validation.constraints.NotNull;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.baidu.cms.common.persistence.DataEntity;

/**
 * 项目管理Entity
 * @author shiyanjun
 * @version 2018-10-18
 */
public class PsProject extends DataEntity<PsProject> {
	
	private static final long serialVersionUID = 1L;
	private String projectName;		// 项目名称
	private String projectAbs;		// 项目简介
	private Long userId;		// 用户ID
	private Integer statusCode;		// 状态
	private Date createTime;		// 创建时间
	private Date updateTime;		// 更新时间
	private Long projectFileId;		// 文件ID
	private Integer projectType;		// 项目类型
	private Integer officeProject;		// 办公项目
	private Integer projectFramework;		// 项目框架
	private Integer projectEnvironment;		// 项目环境
	private Long forkFrom;		// Fork来源
	private String projectHtml;		// 项目Html
	private Long projectWeight;		// 项目权重
	private Long forkCount;		// fork数
	private Long collectCount;		// 收藏数
	private Long commentCount;		// 评论数
	private Long weekWeight;		// 每周热度
	private Long monthWeight;		// 每月热度
	private Integer resourceAlloc;		// 资源分配
	private Integer activeNotebookCluster;		// 0cpu集群
	private String activeNotebookCookie;		// 活跃Notebook
	private String activeNotebookPath;		// Notebook路径
	
	public PsProject() {
		super();
	}

	public PsProject(String id){
		super(id);
	}

	@Length(min=1, max=100, message="项目名称长度必须介于 1 和 100 之间")
	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	
	@Length(min=1, max=500, message="项目简介长度必须介于 1 和 500 之间")
	public String getProjectAbs() {
		return projectAbs;
	}

	public void setProjectAbs(String projectAbs) {
		this.projectAbs = projectAbs;
	}
	
	@NotNull(message="用户ID不能为空")
	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}
	
	@NotNull(message="状态不能为空")
	public Integer getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(Integer statusCode) {
		this.statusCode = statusCode;
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
	
	@NotNull(message="文件ID不能为空")
	public Long getProjectFileId() {
		return projectFileId;
	}

	public void setProjectFileId(Long projectFileId) {
		this.projectFileId = projectFileId;
	}
	
	@NotNull(message="项目类型不能为空")
	public Integer getProjectType() {
		return projectType;
	}

	public void setProjectType(Integer projectType) {
		this.projectType = projectType;
	}
	
	@NotNull(message="办公项目不能为空")
	public Integer getOfficeProject() {
		return officeProject;
	}

	public void setOfficeProject(Integer officeProject) {
		this.officeProject = officeProject;
	}
	
	@NotNull(message="项目框架不能为空")
	public Integer getProjectFramework() {
		return projectFramework;
	}

	public void setProjectFramework(Integer projectFramework) {
		this.projectFramework = projectFramework;
	}
	
	@NotNull(message="项目环境不能为空")
	public Integer getProjectEnvironment() {
		return projectEnvironment;
	}

	public void setProjectEnvironment(Integer projectEnvironment) {
		this.projectEnvironment = projectEnvironment;
	}
	
	@NotNull(message="Fork来源不能为空")
	public Long getForkFrom() {
		return forkFrom;
	}

	public void setForkFrom(Long forkFrom) {
		this.forkFrom = forkFrom;
	}
	
	public String getProjectHtml() {
		return projectHtml;
	}

	public void setProjectHtml(String projectHtml) {
		this.projectHtml = projectHtml;
	}
	
	@NotNull(message="项目权重不能为空")
	public Long getProjectWeight() {
		return projectWeight;
	}

	public void setProjectWeight(Long projectWeight) {
		this.projectWeight = projectWeight;
	}
	
	@NotNull(message="fork数不能为空")
	public Long getForkCount() {
		return forkCount;
	}

	public void setForkCount(Long forkCount) {
		this.forkCount = forkCount;
	}
	
	@NotNull(message="收藏数不能为空")
	public Long getCollectCount() {
		return collectCount;
	}

	public void setCollectCount(Long collectCount) {
		this.collectCount = collectCount;
	}
	
	@NotNull(message="评论数不能为空")
	public Long getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(Long commentCount) {
		this.commentCount = commentCount;
	}
	
	@NotNull(message="每周热度不能为空")
	public Long getWeekWeight() {
		return weekWeight;
	}

	public void setWeekWeight(Long weekWeight) {
		this.weekWeight = weekWeight;
	}
	
	@NotNull(message="每月热度不能为空")
	public Long getMonthWeight() {
		return monthWeight;
	}

	public void setMonthWeight(Long monthWeight) {
		this.monthWeight = monthWeight;
	}
	
	@NotNull(message="资源分配不能为空")
	public Integer getResourceAlloc() {
		return resourceAlloc;
	}

	public void setResourceAlloc(Integer resourceAlloc) {
		this.resourceAlloc = resourceAlloc;
	}
	
	@NotNull(message="0cpu集群不能为空")
	public Integer getActiveNotebookCluster() {
		return activeNotebookCluster;
	}

	public void setActiveNotebookCluster(Integer activeNotebookCluster) {
		this.activeNotebookCluster = activeNotebookCluster;
	}
	
	@Length(min=1, max=300, message="活跃Notebook长度必须介于 1 和 300 之间")
	public String getActiveNotebookCookie() {
		return activeNotebookCookie;
	}

	public void setActiveNotebookCookie(String activeNotebookCookie) {
		this.activeNotebookCookie = activeNotebookCookie;
	}
	
	@Length(min=1, max=100, message="Notebook路径长度必须介于 1 和 100 之间")
	public String getActiveNotebookPath() {
		return activeNotebookPath;
	}

	public void setActiveNotebookPath(String activeNotebookPath) {
		this.activeNotebookPath = activeNotebookPath;
	}
	
}