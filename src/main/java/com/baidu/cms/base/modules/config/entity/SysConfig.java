package com.baidu.cms.base.modules.config.entity;

import org.hibernate.validator.constraints.Length;

import com.baidu.cms.common.persistence.DataEntity;

/**
 * 配置参数管理Entity
 * @author shiyanjun
 * @version 2018-10-23
 */
public class SysConfig extends DataEntity<SysConfig> {
	
	private static final long serialVersionUID = 1L;
	private String configEnv;		// 环境
	private String configKey;		// 配置项名称
	private String configValue;		// 配置项的值
	
	public SysConfig() {
		super();
	}

	public SysConfig(String id){
		super(id);
	}

	@Length(min=1, max=20, message="环境长度必须介于 1 和 20 之间")
	public String getConfigEnv() {
		return configEnv;
	}

	public void setConfigEnv(String configEnv) {
		this.configEnv = configEnv;
	}
	
	@Length(min=1, max=50, message="配置项名称长度必须介于 1 和 50 之间")
	public String getConfigKey() {
		return configKey;
	}

	public void setConfigKey(String configKey) {
		this.configKey = configKey;
	}
	
	@Length(min=0, max=1000, message="配置项的值长度必须介于 0 和 1000 之间")
	public String getConfigValue() {
		return configValue;
	}

	public void setConfigValue(String configValue) {
		this.configValue = configValue;
	}
	
}