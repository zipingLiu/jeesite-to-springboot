package com.baidu.cms.studio.modules.psmatchsubmit.entity;

import com.baidu.cms.common.persistence.DataEntity;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * 提交管理Entity
 *
 * @author shiyanjun
 * @version 2018-10-18
 */
public class PsMatchSubmit extends DataEntity<PsMatchSubmit> implements Comparable<PsMatchSubmit> {

    private static final long serialVersionUID = 1L;
    private String submitName;      // 提交名称
    private String version;         // 版本
    private Date createTime;        // 创建时间
    private Integer statusCode;     // 提交状态
    private Date lastUpdateTime;    // 最后更新时间
    private Long userId;            // 提交人
    private Double score;           // 分数
    private String resultContent;   // 结果json
    private String bosKey;          // bos的key值
    private String bosFileUrl;      // bos的url
    private Long startTime;         // 任务开始时间
    private Long endTime;           // 任务结束时间
    private Long processId;         // 阶段ID
    private Integer anonymous;      // 是否匿名
    private String reference;       // 参考文献
    private String introduction;    // 简介
    private Long projectId;         // 关联项目
    private Long matchId;           // 比赛ID
    private String errorMsg;        // 对比结果
    private String matchName;       // 比赛名称
    private String processName;     // 比赛阶段名称
    private String projectName;     // 关联项目名称

    /**
     * ps_user表信息
     */
    private String userName;        // 用户名
    private Integer userType;       // 用户类型
    private String trueName;        // 姓名
    private String idcard;          // 身份证
    private String mobile;          // 手机号
    private String email;           // 邮箱
    private String companyName;     // 公司名称
    private String region;          // 地区
    private Integer capacity;       // 身份
    private String workPlace;       // 工作地点
    private String position;        // 职位
    private String portrait;        // 头像
    private String userAbs;         // 介绍
    private Integer isEmployee;     // 是否为员工
    private String displayName;     // 显示名称

    public PsMatchSubmit() {
        super();
    }

    public PsMatchSubmit(String id) {
        super(id);
    }

    @Length(min = 1, max = 200, message = "提交名称长度必须介于 1 和 200 之间")
    public String getSubmitName() {
        return submitName;
    }

    public void setSubmitName(String submitName) {
        this.submitName = submitName;
    }

    @Length(min = 1, max = 20, message = "版本长度必须介于 1 和 20 之间")
    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @NotNull(message = "创建时间不能为空")
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @NotNull(message = "提交状态不能为空")
    public Integer getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(Integer statusCode) {
        this.statusCode = statusCode;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @NotNull(message = "最后更新时间不能为空")
    public Date getLastUpdateTime() {
        return lastUpdateTime;
    }

    public void setLastUpdateTime(Date lastUpdateTime) {
        this.lastUpdateTime = lastUpdateTime;
    }

    @NotNull(message = "提交人不能为空")
    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    @NotNull(message = "分数不能为空")
    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

    @Length(min = 1, max = 2000, message = "结果json长度必须介于 1 和 2000 之间")
    public String getResultContent() {
        return resultContent;
    }

    public void setResultContent(String resultContent) {
        this.resultContent = resultContent;
    }

    @Length(min = 1, max = 500, message = "bos的key值长度必须介于 1 和 500 之间")
    public String getBosKey() {
        return bosKey;
    }

    public void setBosKey(String bosKey) {
        this.bosKey = bosKey;
    }

    @Length(min = 1, max = 1000, message = "bos的url长度必须介于 1 和 1000 之间")
    public String getBosFileUrl() {
        return bosFileUrl;
    }

    public void setBosFileUrl(String bosFileUrl) {
        this.bosFileUrl = bosFileUrl;
    }

    @NotNull(message = "任务开始时间不能为空")
    public Long getStartTime() {
        return startTime;
    }

    public void setStartTime(Long startTime) {
        this.startTime = startTime;
    }

    @NotNull(message = "任务结束时间不能为空")
    public Long getEndTime() {
        return endTime;
    }

    public void setEndTime(Long endTime) {
        this.endTime = endTime;
    }

    @NotNull(message = "阶段ID不能为空")
    public Long getProcessId() {
        return processId;
    }

    public void setProcessId(Long processId) {
        this.processId = processId;
    }

    @NotNull(message = "是否匿名不能为空")
    public Integer getAnonymous() {
        return anonymous;
    }

    public void setAnonymous(Integer anonymous) {
        this.anonymous = anonymous;
    }

    @Length(min = 1, max = 500, message = "参考文献长度必须介于 1 和 500 之间")
    public String getReference() {
        return reference;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }

    @Length(min = 1, max = 500, message = "简介长度必须介于 1 和 500 之间")
    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    @NotNull(message = "项目ID不能为空")
    public Long getProjectId() {
        return projectId;
    }

    public void setProjectId(Long projectId) {
        this.projectId = projectId;
    }

    @NotNull(message = "比赛ID不能为空")
    public Long getMatchId() {
        return matchId;
    }

    public void setMatchId(Long matchId) {
        this.matchId = matchId;
    }

    @Length(min = 1, max = 255, message = "对比结果长度必须介于 1 和 255 之间")
    public String getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
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

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
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

    @Override
    public int compareTo(PsMatchSubmit o) {
        if (this.score != null && o.getScore() != null) {
            return o.getScore().compareTo(this.score);
        }
        return 0;
    }
}