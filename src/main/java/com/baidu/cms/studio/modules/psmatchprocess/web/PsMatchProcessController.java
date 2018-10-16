/**
 *
 */
package com.baidu.cms.studio.modules.psmatchprocess.web;

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
import com.baidu.cms.studio.modules.psmatchprocess.entity.PsMatchProcess;
import com.baidu.cms.studio.modules.psmatchprocess.service.PsMatchProcessService;

/**
 * 阶段管理Controller
 * @author shiyanjun
 * @version 2018-10-16
 */
@Controller
@RequestMapping(value = "${adminPath}/psmatchprocess/psMatchProcess")
public class PsMatchProcessController extends BaseController {

	@Autowired
	private PsMatchProcessService psMatchProcessService;
	
	@ModelAttribute
	public PsMatchProcess get(@RequestParam(required=false) String id) {
		PsMatchProcess entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = psMatchProcessService.get(id);
		}
		if (entity == null){
			entity = new PsMatchProcess();
		}
		return entity;
	}
	
	@RequiresPermissions("psmatchprocess:psMatchProcess:view")
	@RequestMapping(value = {"list", ""})
	public String list(PsMatchProcess psMatchProcess, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<PsMatchProcess> page = psMatchProcessService.findPage(new Page<PsMatchProcess>(request, response), psMatchProcess); 
		model.addAttribute("page", page);
		return "studio/modules/psmatchprocess/psMatchProcessList";
	}

	@RequiresPermissions("psmatchprocess:psMatchProcess:view")
	@RequestMapping(value = "form")
	public String form(PsMatchProcess psMatchProcess, Model model) {
		model.addAttribute("psMatchProcess", psMatchProcess);
		return "studio/modules/psmatchprocess/psMatchProcessForm";
	}

	@RequiresPermissions("psmatchprocess:psMatchProcess:edit")
	@RequestMapping(value = "save")
	public String save(PsMatchProcess psMatchProcess, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, psMatchProcess)){
			return form(psMatchProcess, model);
		}
		psMatchProcessService.save(psMatchProcess);
		addMessage(redirectAttributes, "保存阶段管理成功");
		return "redirect:"+Global.getAdminPath()+"/psmatchprocess/psMatchProcess/?repage";
	}
	
	@RequiresPermissions("psmatchprocess:psMatchProcess:edit")
	@RequestMapping(value = "delete")
	public String delete(PsMatchProcess psMatchProcess, RedirectAttributes redirectAttributes) {
		psMatchProcessService.delete(psMatchProcess);
		addMessage(redirectAttributes, "删除阶段管理成功");
		return "redirect:"+Global.getAdminPath()+"/psmatchprocess/psMatchProcess/?repage";
	}

}