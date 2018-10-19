package com.baidu.cms.studio.modules.psproject.web;

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
import com.baidu.cms.studio.modules.psproject.entity.PsProject;
import com.baidu.cms.studio.modules.psproject.service.PsProjectService;

/**
 * 项目管理Controller
 * @author shiyanjun
 * @version 2018-10-18
 */
@Controller
@RequestMapping(value = "${adminPath}/psproject/psProject")
public class PsProjectController extends BaseController {

	@Autowired
	private PsProjectService psProjectService;
	
	@ModelAttribute
	public PsProject get(@RequestParam(required=false) String id) {
		PsProject entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = psProjectService.get(id);
		}
		if (entity == null){
			entity = new PsProject();
		}
		return entity;
	}
	
	@RequiresPermissions("psproject:psProject:view")
	@RequestMapping(value = {"list", ""})
	public String list(PsProject psProject, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<PsProject> page = psProjectService.findPage(new Page<PsProject>(request, response), psProject); 
		model.addAttribute("page", page);
		return "studio/modules/psproject/psProjectList";
	}

	@RequiresPermissions("psproject:psProject:view")
	@RequestMapping(value = "form")
	public String form(PsProject psProject, Model model) {
		model.addAttribute("psProject", psProject);
		return "studio/modules/psproject/psProjectForm";
	}

	@RequiresPermissions("psproject:psProject:edit")
	@RequestMapping(value = "save")
	public String save(PsProject psProject, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, psProject)){
			return form(psProject, model);
		}
		psProjectService.save(psProject);
		addMessage(redirectAttributes, "保存项目成功");
		return "redirect:"+Global.getAdminPath()+"/psproject/psProject/?repage";
	}
	
	@RequiresPermissions("psproject:psProject:edit")
	@RequestMapping(value = "delete")
	public String delete(PsProject psProject, RedirectAttributes redirectAttributes) {
		psProjectService.delete(psProject);
		addMessage(redirectAttributes, "删除项目成功");
		return "redirect:"+Global.getAdminPath()+"/psproject/psProject/?repage";
	}

}