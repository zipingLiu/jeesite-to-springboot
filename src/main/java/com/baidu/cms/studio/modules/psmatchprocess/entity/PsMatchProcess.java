package com.baidu.cms.studio.modules.psmatchprocess.entity;

import org.hibernate.validator.constraints.Length;
import javax.validation.constraints.NotNull;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.baidu.cms.common.persistence.DataEntity;

/**
 * 阶段管理Entity
 * @author shiyanjun
 * @version 2018-10-18
 */
public class PsMatchProcess extends DataEntity<PsMatchProcess> {
	
	private static final long serialVersionUID = 1L;
	private String processName;		// 阶段名称
	private Long matchId;		// 比赛ID
	private Date startTime;		// 开始时间
	private Date endTime;		// 结束时间
	private Long projectId;		// 关联项目
	private Integer selfSignup;		// 是否可自己报名
	private Integer hasLeaderboard;		// 是否有排行版
	private String evalDockerImage;		// 执行脚本
	private String evalService;		// 处理类
	private String evalDockerCommand;		// Docker命令
	private String columns;		// 列JSON
	private Date tokenStartTime;		// 获取Token开始时间
	private String matchName;	//比赛名称
	private String projectName;	//关联项目名称
	
	public PsMatchProcess() {
		super();
	}

	public PsMatchProcess(String id){
		super(id);
	}

	@Length(min=1, max=255, message="阶段名称长度必须介于 1 和 255 之间")
	public String getProcessName() {
		return processName;
	}

	public void setProcessName(String processName) {
		this.processName = processName;
	}
	
	@NotNull(message="比赛ID不能为空")
	public Long getMatchId() {
		return matchId;
	}

	public void setMatchId(Long matchId) {
		this.matchId = matchId;
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
	
	@NotNull(message="关联项目不能为空")
	public Long getProjectId() {
		return projectId;
	}

	public void setProjectId(Long projectId) {
		this.projectId = projectId;
	}
	
	@NotNull(message="是否可自己报名不能为空")
	public Integer getSelfSignup() {
		return selfSignup;
	}

	public void setSelfSignup(Integer selfSignup) {
		this.selfSignup = selfSignup;
	}
	
	@NotNull(message="是否有排行版不能为空")
	public Integer getHasLeaderboard() {
		return hasLeaderboard;
	}

	public void setHasLeaderboard(Integer hasLeaderboard) {
		this.hasLeaderboard = hasLeaderboard;
	}
	
	@Length(min=1, max=255, message="执行脚本长度必须介于 1 和 255 之间")
	public String getEvalDockerImage() {
		return evalDockerImage;
	}

	public void setEvalDockerImage(String evalDockerImage) {
		this.evalDockerImage = evalDockerImage;
	}
	
	@Length(min=1, max=255, message="处理类长度必须介于 1 和 255 之间")
	public String getEvalService() {
		return evalService;
	}

	public void setEvalService(String evalService) {
		this.evalService = evalService;
	}
	
	@Length(min=1, max=255, message="Docker命令长度必须介于 1 和 255 之间")
	public String getEvalDockerCommand() {
		return evalDockerCommand;
	}

	public void setEvalDockerCommand(String evalDockerCommand) {
		this.evalDockerCommand = evalDockerCommand;
	}
	
	@Length(min=1, max=255, message="列JSON长度必须介于 1 和 255 之间")
	public String getColumns() {
		return columns;
	}

	public void setColumns(String columns) {
		this.columns = columns;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="获取Token开始时间不能为空")
	public Date getTokenStartTime() {
		return tokenStartTime;
	}

	public void setTokenStartTime(Date tokenStartTime) {
		this.tokenStartTime = tokenStartTime;
	}

	public String getMatchName() {
		return matchName;
	}

	public void setMatchName(String matchName) {
		this.matchName = matchName;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
}