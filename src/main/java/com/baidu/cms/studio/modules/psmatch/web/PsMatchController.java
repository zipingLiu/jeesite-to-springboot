/**
 *
 */
package com.baidu.cms.studio.modules.psmatch.web;

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
import com.baidu.cms.studio.modules.psmatch.entity.PsMatch;
import com.baidu.cms.studio.modules.psmatch.service.PsMatchService;

/**
 * 比赛管理Controller
 * @author shiyanjun
 * @version 2018-10-17
 */
@Controller
@RequestMapping(value = "${adminPath}/psmatch/psMatch")
public class PsMatchController extends BaseController {

	@Autowired
	private PsMatchService psMatchService;
	
	@ModelAttribute
	public PsMatch get(@RequestParam(required=false) String id) {
		PsMatch entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = psMatchService.get(id);
		}
		if (entity == null){
			entity = new PsMatch();
		}
		return entity;
	}
	
	@RequiresPermissions("psmatch:psMatch:view")
	@RequestMapping(value = {"list", ""})
	public String list(PsMatch psMatch, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<PsMatch> page = psMatchService.findPage(new Page<PsMatch>(request, response), psMatch); 
		model.addAttribute("page", page);
		return "studio/modules/psmatch/psMatchList";
	}

	@RequiresPermissions("psmatch:psMatch:view")
	@RequestMapping(value = "form")
	public String form(PsMatch psMatch, Model model) {
		model.addAttribute("psMatch", psMatch);
		return "studio/modules/psmatch/psMatchForm";
	}

	@RequiresPermissions("psmatch:psMatch:edit")
	@RequestMapping(value = "save")
	public String save(PsMatch psMatch, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, psMatch)){
			return form(psMatch, model);
		}
		psMatchService.save(psMatch);
		addMessage(redirectAttributes, "保存比赛成功");
		return "redirect:"+Global.getAdminPath()+"/psmatch/psMatch/?repage";
	}
	
	@RequiresPermissions("psmatch:psMatch:edit")
	@RequestMapping(value = "delete")
	public String delete(PsMatch psMatch, RedirectAttributes redirectAttributes) {
		psMatchService.delete(psMatch);
		addMessage(redirectAttributes, "删除比赛成功");
		return "redirect:"+Global.getAdminPath()+"/psmatch/psMatch/?repage";
	}

}