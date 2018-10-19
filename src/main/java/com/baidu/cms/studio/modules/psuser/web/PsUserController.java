/**
 *
 */
package com.baidu.cms.studio.modules.psuser.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.baidu.cms.common.config.Global;
import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.web.BaseController;
import com.baidu.cms.common.utils.StringUtils;
import com.baidu.cms.studio.modules.psuser.entity.PsUser;
import com.baidu.cms.studio.modules.psuser.service.PsUserService;

/**
 * 用户管理Controller
 * @author shiyanjun
 * @version 2018-10-18
 */
@Controller
@RequestMapping(value = "${adminPath}/psuser/psUser")
public class PsUserController extends BaseController {

	@Autowired
	private PsUserService psUserService;
	
	@ModelAttribute
	public PsUser get(@RequestParam(required=false) String id) {
		PsUser entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = psUserService.get(id);
		}
		if (entity == null){
			entity = new PsUser();
		} else {
			// 用户敏感信息解密
			decrypt(entity);
		}
		return entity;
	}
	
	@RequiresPermissions("psuser:psUser:view")
	@RequestMapping(value = {"list", ""})
	public String list(PsUser psUser, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<PsUser> page = psUserService.findPage(new Page<PsUser>(request, response), psUser); 
		model.addAttribute("page", page);
		return "studio/modules/psuser/psUserList";
	}

	@RequiresPermissions("psuser:psUser:view")
	@RequestMapping(value = "form")
	public String form(PsUser psUser, Model model) {
		model.addAttribute("psUser", psUser);
		return "studio/modules/psuser/psUserForm";
	}

	@RequiresPermissions("psuser:psUser:edit")
	@RequestMapping(value = "save")
	public String save(PsUser psUser, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, psUser)){
			return form(psUser, model);
		}
		psUserService.save(psUser);
		addMessage(redirectAttributes, "保存用户管理成功");
		return "redirect:"+Global.getAdminPath()+"/psuser/psUser/?repage";
	}
	
	@RequiresPermissions("psuser:psUser:edit")
	@RequestMapping(value = "delete")
	public String delete(PsUser psUser, RedirectAttributes redirectAttributes) {
		psUserService.delete(psUser);
		addMessage(redirectAttributes, "删除用户管理成功");
		return "redirect:"+Global.getAdminPath()+"/psuser/psUser/?repage";
	}

}