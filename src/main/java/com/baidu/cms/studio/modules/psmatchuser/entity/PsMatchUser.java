/**
 *
 */
package com.baidu.cms.studio.modules.psmatchuser.entity;

import javax.validation.constraints.NotNull;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.baidu.cms.common.persistence.DataEntity;

/**
 * 报名用户Entity
 * @author shiyanjun
 * @version 2018-10-16
 */
public class PsMatchUser extends DataEntity<PsMatchUser> {
	
	private static final long serialVersionUID = 1L;
	private Long matchId;		// 比赛ID
	private Long userId;		// 用户ID
	private Long processId;		// 阶段ID
	private Date createTime;		// 创建时间
	private Date updateTime;		// 更新时间
	private Integer routinePass;		// 常规赛是否通过
	
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
	
}