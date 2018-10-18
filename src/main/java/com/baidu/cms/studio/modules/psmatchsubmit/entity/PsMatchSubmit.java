/**
 *
 */
package com.baidu.cms.studio.modules.psmatchsubmit.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.NotNull;

import com.baidu.cms.common.persistence.DataEntity;

/**
 * 提交管理Entity
 * @author shiyanjun
 * @version 2018-10-18
 */
public class PsMatchSubmit extends DataEntity<PsMatchSubmit> {
	
	private static final long serialVersionUID = 1L;
	private String submitName;		// 提交名称
	private String version;		// 版本
	private Date createTime;		// 创建时间
	private Integer statusCode;		// 提交状态
	private Date lastUpdateTime;		// 最后更新时间
	private Long userId;		// 提交人
	private Double score;		// 分数
	private String resultContent;		// 结果json
	private String bosKey;		// bos的key值
	private String bosFileUrl;		// bos的url
	private Long startTime;		// 任务开始时间
	private Long endTime;		// 任务结束时间
	private Long processId;		// 阶段ID
	private Integer anonymous;		// 是否匿名
	private String reference;		// 参考文献
	private String introduction;		// 简介
	private Long projectId;		// 项目ID
	private Long matchId;		// 比赛ID
	private String errorMsg;		// 对比结果
	
	public PsMatchSubmit() {
		super();
	}

	public PsMatchSubmit(String id){
		super(id);
	}

	@Length(min=1, max=200, message="提交名称长度必须介于 1 和 200 之间")
	public String getSubmitName() {
		return submitName;
	}

	public void setSubmitName(String submitName) {
		this.submitName = submitName;
	}
	
	@Length(min=1, max=20, message="版本长度必须介于 1 和 20 之间")
	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="创建时间不能为空")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@NotNull(message="提交状态不能为空")
	public Integer getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(Integer statusCode) {
		this.statusCode = statusCode;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="最后更新时间不能为空")
	public Date getLastUpdateTime() {
		return lastUpdateTime;
	}

	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}
	
	@NotNull(message="提交人不能为空")
	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}
	
	@NotNull(message="分数不能为空")
	public Double getScore() {
		return score;
	}

	public void setScore(Double score) {
		this.score = score;
	}
	
	@Length(min=1, max=2000, message="结果json长度必须介于 1 和 2000 之间")
	public String getResultContent() {
		return resultContent;
	}

	public void setResultContent(String resultContent) {
		this.resultContent = resultContent;
	}
	
	@Length(min=1, max=500, message="bos的key值长度必须介于 1 和 500 之间")
	public String getBosKey() {
		return bosKey;
	}

	public void setBosKey(String bosKey) {
		this.bosKey = bosKey;
	}
	
	@Length(min=1, max=1000, message="bos的url长度必须介于 1 和 1000 之间")
	public String getBosFileUrl() {
		return bosFileUrl;
	}

	public void setBosFileUrl(String bosFileUrl) {
		this.bosFileUrl = bosFileUrl;
	}
	
	@NotNull(message="任务开始时间不能为空")
	public Long getStartTime() {
		return startTime;
	}

	public void setStartTime(Long startTime) {
		this.startTime = startTime;
	}
	
	@NotNull(message="任务结束时间不能为空")
	public Long getEndTime() {
		return endTime;
	}

	public void setEndTime(Long endTime) {
		this.endTime = endTime;
	}
	
	@NotNull(message="阶段ID不能为空")
	public Long getProcessId() {
		return processId;
	}

	public void setProcessId(Long processId) {
		this.processId = processId;
	}
	
	@NotNull(message="是否匿名不能为空")
	public Integer getAnonymous() {
		return anonymous;
	}

	public void setAnonymous(Integer anonymous) {
		this.anonymous = anonymous;
	}
	
	@Length(min=1, max=500, message="参考文献长度必须介于 1 和 500 之间")
	public String getReference() {
		return reference;
	}

	public void setReference(String reference) {
		this.reference = reference;
	}
	
	@Length(min=1, max=500, message="简介长度必须介于 1 和 500 之间")
	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	
	@NotNull(message="项目ID不能为空")
	public Long getProjectId() {
		return projectId;
	}

	public void setProjectId(Long projectId) {
		this.projectId = projectId;
	}
	
	@NotNull(message="比赛ID不能为空")
	public Long getMatchId() {
		return matchId;
	}

	public void setMatchId(Long matchId) {
		this.matchId = matchId;
	}
	
	@Length(min=1, max=255, message="对比结果长度必须介于 1 和 255 之间")
	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
	
}