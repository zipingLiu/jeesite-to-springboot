/**
 *
 */
package com.baidu.cms.studio.modules.psuser.service;

import java.util.List;

import com.baidu.cms.common.utils.CryptUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.service.CrudService;
import com.baidu.cms.studio.modules.psuser.entity.PsUser;
import com.baidu.cms.studio.modules.psuser.dao.PsUserDao;
import org.springframework.util.CollectionUtils;

/**
 * 用户管理Service
 * @author shiyanjun
 * @version 2018-10-18
 */
@Service
@Transactional(readOnly = true)
public class PsUserService extends CrudService<PsUserDao, PsUser> {

	public PsUser get(String id) {
		return super.get(id);
	}
	
	public List<PsUser> findList(PsUser psUser) {
		return super.findList(psUser);
	}
	
	public Page<PsUser> findPage(Page<PsUser> page, PsUser psUser) {
		Page<PsUser> pageResult = super.findPage(page, psUser);
		if (!CollectionUtils.isEmpty(pageResult.getList())) {
			for (PsUser user : pageResult.getList()) {
				decrypt(user);
			}
		}
		return pageResult;
	}
	
	@Transactional(readOnly = false)
	public void save(PsUser psUser) {
		super.save(psUser);
	}
	
	@Transactional(readOnly = false)
	public void delete(PsUser psUser) {
		super.delete(psUser);
	}

	/**
	 * 用户敏感信息解密
	 * @Author shiyanjun
	 * @Date 2018/10/19 下午2:12
	 */
	public PsUser decrypt(PsUser psUser) {
		psUser.setTrueName(CryptUtils.decrypt(psUser.getTrueName()));
		psUser.setMobile(CryptUtils.decrypt(psUser.getMobile()));
		psUser.setEmail(CryptUtils.decrypt(psUser.getEmail()));
		return psUser;
	}
}