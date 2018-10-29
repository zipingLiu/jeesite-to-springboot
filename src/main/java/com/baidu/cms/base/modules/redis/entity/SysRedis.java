package com.baidu.cms.base.modules.redis.entity;

import com.baidu.cms.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;
import org.springframework.data.redis.connection.DataType;

/**
 * 缓存管理Entity
 *
 * @author shiyanjun
 * @version 2018-10-20
 */
public class SysRedis extends DataEntity<SysRedis> implements Comparable<SysRedis> {

    private static final long serialVersionUID = 1L;
    private String dataType;    // 数据类型
    private String redisKey;    // 缓存键
    private String redisValue;  // 缓存值

    public SysRedis() {
        super();
    }

    public SysRedis(String redisKey, String redisValue) {
        // 默认string类型
        this.dataType = DataType.STRING.code();
        this.redisKey = redisKey;
        this.redisValue = redisValue;
    }

    public SysRedis(String dataType, String redisKey, String redisValue) {
        this.dataType = dataType;
        this.redisKey = redisKey;
        this.redisValue = redisValue;
    }

    @Length(min = 1, max = 200, message = "缓存键长度必须介于 1 和 200 之间")
    public String getRedisKey() {
        return redisKey;
    }

    public void setRedisKey(String redisKey) {
        this.redisKey = redisKey;
    }

    public String getRedisValue() {
        return redisValue;
    }

    public void setRedisValue(String redisValue) {
        this.redisValue = redisValue;
    }

    public String getDataType() {
        return dataType;
    }

    public void setDataType(String dataType) {
        this.dataType = dataType;
    }

    /**
     * 按key排序
     */
    @Override
    public int compareTo(SysRedis sysRedis) {
        return this.redisKey.compareTo(sysRedis.getRedisKey());
    }
}