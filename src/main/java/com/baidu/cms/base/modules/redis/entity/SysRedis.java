package com.baidu.cms.base.modules.redis.entity;

import com.baidu.cms.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;
import org.springframework.data.redis.connection.DataType;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 缓存管理Entity
 *
 * @author shiyanjun
 * @version 2018-10-20
 */
public class SysRedis extends DataEntity<SysRedis> implements Comparable<SysRedis> {

    private static final long serialVersionUID = 1L;
    private String dataType;            // 数据类型
    private String redisKey;            // 缓存键
    private String redisValue;          // 缓存值
    private List<Object> valList;       // list类型的value
    private Set<Object> valSet;         // set/zset类型的value
    private Map<String, Object> valMap; // map类型的value

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

    public List<Object> getValList() {
        return valList;
    }

    public void setValList(List<Object> valList) {
        this.valList = valList;
    }

    public Set<Object> getValSet() {
        return valSet;
    }

    public void setValSet(Set<Object> valSet) {
        this.valSet = valSet;
    }

    public Map<String, Object> getValMap() {
        return valMap;
    }

    public void setValMap(Map<String, Object> valMap) {
        this.valMap = valMap;
    }

    /**
     * 按key排序
     */
    @Override
    public int compareTo(SysRedis sysRedis) {
        return this.redisKey.compareTo(sysRedis.getRedisKey());
    }
}