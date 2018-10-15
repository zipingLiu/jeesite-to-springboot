/**
 *
 */
package com.baidu.cms.studio.modules.pscode.web;

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
import com.baidu.cms.studio.modules.pscode.entity.PsCode;
import com.baidu.cms.studio.modules.pscode.service.PsCodeService;

/**
 * code测试Controller
 * @author shiyanjun
 * @version 2018-10-15
 */
@Controller
@RequestMapping(value = "${adminPath}/pscode/psCode")
public class PsCodeController extends BaseController {

	@Autowired
	private PsCodeService psCodeService;
	
	@ModelAttribute
	public PsCode get(@RequestParam(required=false) String id) {
		PsCode entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = psCodeService.get(id);
		}
		if (entity == null){
			entity = new PsCode();
		}
		return entity;
	}
	
	@RequiresPermissions("pscode:psCode:view")
	@RequestMapping(value = {"list", ""})
	public String list(PsCode psCode, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<PsCode> page = psCodeService.findPage(new Page<PsCode>(request, response), psCode); 
		model.addAttribute("page", page);
		return "studio/modules/pscode/psCodeList";
	}

	@RequiresPermissions("pscode:psCode:view")
	@RequestMapping(value = "form")
	public String form(PsCode psCode, Model model) {
		model.addAttribute("psCode", psCode);
		return "studio/modules/pscode/psCodeForm";
	}

	@RequiresPermissions("pscode:psCode:edit")
	@RequestMapping(value = "save")
	public String save(PsCode psCode, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, psCode)){
			return form(psCode, model);
		}
		psCodeService.save(psCode);
		addMessage(redirectAttributes, "保存code测试成功");
		return "redirect:"+Global.getAdminPath()+"/pscode/psCode/?repage";
	}
	
	@RequiresPermissions("pscode:psCode:edit")
	@RequestMapping(value = "delete")
	public String delete(PsCode psCode, RedirectAttributes redirectAttributes) {
		psCodeService.delete(psCode);
		addMessage(redirectAttributes, "删除code测试成功");
		return "redirect:"+Global.getAdminPath()+"/pscode/psCode/?repage";
	}

}