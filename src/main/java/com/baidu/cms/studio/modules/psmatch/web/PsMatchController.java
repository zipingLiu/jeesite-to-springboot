/**
 *
 */
package com.baidu.cms.studio.modules.psmatch.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baidu.cms.studio.modules.psmatchprocess.entity.PsMatchProcess;
import com.baidu.cms.studio.modules.psmatchprocess.service.PsMatchProcessService;
import com.baidu.cms.studio.modules.psproject.entity.PsProject;
import com.baidu.cms.studio.modules.psproject.service.PsProjectService;
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

import java.util.List;

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

	@Autowired
	private PsMatchProcessService psMatchProcessService;

	@Autowired
	private PsProjectService psProjectService;
	
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
		List<PsProject> projectList = psProjectService.findList(new PsProject());
		model.addAttribute("projectList", projectList);
		return "studio/modules/psmatch/psMatchList";
	}

	@RequiresPermissions("psmatch:psMatch:view")
	@RequestMapping(value = "form")
	public String form(PsMatch psMatch, Model model) {
		PsMatchProcess psMatchProcess = new PsMatchProcess();
		if (psMatch != null) {
			if (StringUtils.isNotBlank(psMatch.getId())) {
				psMatchProcess.setMatchId(Long.parseLong(psMatch.getId()));
				List<PsMatchProcess> processList = psMatchProcessService.findList(psMatchProcess);
				model.addAttribute("processList", processList);
			}
			List<PsProject> projectList = psProjectService.findList(new PsProject());
			model.addAttribute("projectList", projectList);
		}
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