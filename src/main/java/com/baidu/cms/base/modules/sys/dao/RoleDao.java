package com.baidu.cms.base.modules.sys.dao;

import com.baidu.cms.base.modules.sys.entity.Role;
import com.baidu.cms.common.persistence.CrudDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * 角色DAO接口
 *
 * @author ThinkGem
 * @version 2013-12-05
 */
@Mapper
public interface RoleDao extends CrudDao<Role> {

    Role getByName(Role role);

    Role getByEnname(Role role);

    /**
     * 维护角色与菜单权限关系
     *
     * @param role
     * @return
     */
    int deleteRoleMenu(Role role);

    int insertRoleMenu(Role role);

    /**
     * 维护角色与公司部门关系
     *
     * @param role
     * @return
     */
    int deleteRoleOffice(Role role);

    int insertRoleOffice(Role role);

}
