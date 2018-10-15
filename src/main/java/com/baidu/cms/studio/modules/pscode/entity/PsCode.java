/**
 *
 */
package com.baidu.cms.studio.modules.pscode.entity;

import org.hibernate.validator.constraints.Length;
import javax.validation.constraints.NotNull;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.baidu.cms.common.persistence.DataEntity;

/**
 * code测试Entity
 * @author shiyanjun
 * @version 2018-10-15
 */
public class PsCode extends DataEntity<PsCode> {
	
	private static final long serialVersionUID = 1L;
	private String codeName;		// code名称
	private String codeContent;		// code内容
	private Long user;		// 用户ID
	private Long codeCategory;		// code分类
	private String statusCode;		// 状态码
	private Date createTime;		// 创建时间
	private String codeType;		// code类型
	
	public PsCode() {
		super();
	}

	public PsCode(String id){
		super(id);
	}

	@Length(min=1, max=100, message="code名称长度必须介于 1 和 100 之间")
	public String getCodeName() {
		return codeName;
	}

	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	
	public String getCodeContent() {
		return codeContent;
	}

	public void setCodeContent(String codeContent) {
		this.codeContent = codeContent;
	}
	
	@NotNull(message="用户ID不能为空")
	public Long getUser() {
		return user;
	}

	public void setUser(Long user) {
		this.user = user;
	}
	
	@NotNull(message="code分类不能为空")
	public Long getCodeCategory() {
		return codeCategory;
	}

	public void setCodeCategory(Long codeCategory) {
		this.codeCategory = codeCategory;
	}
	
	@Length(min=1, max=2, message="状态码长度必须介于 1 和 2 之间")
	public String getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(String statusCode) {
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
	
	@Length(min=1, max=2, message="code类型长度必须介于 1 和 2 之间")
	public String getCodeType() {
		return codeType;
	}

	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}
	
}