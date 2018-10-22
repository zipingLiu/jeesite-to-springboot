package com.baidu.cms.base.modules.column.web;

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
import com.baidu.cms.base.modules.column.entity.SysColumnHide;
import com.baidu.cms.base.modules.column.service.SysColumnHideService;

/**
 * 列隐藏配置Controller
 * @author shiyanjun
 * @version 2018-10-22
 */
@Controller
@RequestMapping(value = "${adminPath}/column/sysColumnHide")
public class SysColumnHideController extends BaseController {

	@Autowired
	private SysColumnHideService sysColumnHideService;
	
	@ModelAttribute
	public SysColumnHide get(@RequestParam(required=false) String id) {
		SysColumnHide entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = sysColumnHideService.get(id);
		}
		if (entity == null){
			entity = new SysColumnHide();
		}
		return entity;
	}
	
	@RequiresPermissions("column:sysColumnHide:view")
	@RequestMapping(value = {"list", ""})
	public String list(SysColumnHide sysColumnHide, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SysColumnHide> page = sysColumnHideService.findPage(new Page<SysColumnHide>(request, response), sysColumnHide); 
		model.addAttribute("page", page);
		return "base/modules/column/sysColumnHideList";
	}

	@RequiresPermissions("column:sysColumnHide:view")
	@RequestMapping(value = "form")
	public String form(SysColumnHide sysColumnHide, Model model) {
		model.addAttribute("sysColumnHide", sysColumnHide);
		return "base/modules/column/sysColumnHideForm";
	}

	@RequiresPermissions("column:sysColumnHide:edit")
	@RequestMapping(value = "save")
	public String save(SysColumnHide sysColumnHide, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, sysColumnHide)){
			return form(sysColumnHide, model);
		}
		sysColumnHideService.save(sysColumnHide);
		addMessage(redirectAttributes, "保存列隐藏配置成功");
		return "redirect:"+Global.getAdminPath()+"/column/sysColumnHide/?repage";
	}
	
	@RequiresPermissions("column:sysColumnHide:edit")
	@RequestMapping(value = "delete")
	public String delete(SysColumnHide sysColumnHide, RedirectAttributes redirectAttributes) {
		sysColumnHideService.delete(sysColumnHide);
		addMessage(redirectAttributes, "删除列隐藏配置成功");
		return "redirect:"+Global.getAdminPath()+"/column/sysColumnHide/?repage";
	}

}