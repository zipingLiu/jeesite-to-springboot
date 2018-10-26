package com.baidu.cms.base.modules.syspagecol.web;

import com.baidu.cms.base.modules.syspagecol.entity.ColLabVal;
import com.baidu.cms.base.modules.syspagecol.entity.SysPageCol;
import com.baidu.cms.base.modules.syspagecol.service.SysPageColService;
import com.baidu.cms.common.config.Global;
import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.utils.StringUtils;
import com.baidu.cms.common.web.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * 视图展示列管理Controller
 * @author shiyanjun
 * @version 2018-10-25
 */
@Controller
@RequestMapping(value = "${adminPath}/syspagecol/sysPageCol")
public class SysPageColController extends BaseController {

	@Autowired
	private SysPageColService sysPageColService;

	@ModelAttribute
	public SysPageCol get(@RequestParam(required=false) String id) {
		SysPageCol entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = sysPageColService.get(id);
		}
		if (entity == null){
			entity = new SysPageCol();
		}
		return entity;
	}

	@RequiresPermissions("syspagecol:sysPageCol:view")
	@RequestMapping(value = {"list", ""})
	public String list(SysPageCol sysPageCol, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SysPageCol> page = sysPageColService.findPage(new Page<>(request, response), sysPageCol);
		model.addAttribute("page", page);
		return "base/modules/syspagecol/sysPageColList";
	}

	@RequiresPermissions("syspagecol:sysPageCol:view")
	@RequestMapping(value = "form")
	public String form(SysPageCol sysPageCol, Model model) {
		model.addAttribute("sysPageCol", sysPageCol);

		// 所有列
		List<ColLabVal> allList = new ArrayList<>();
		String colAll = sysPageCol.getColAll();
		if (colAll != null) {
			String[] split = colAll.split(",");
			for (int i = 0; i < split.length; i++) {
				allList.add(new ColLabVal(split[i], String.valueOf(i)));
			}
		}
		model.addAttribute("allList", allList);
		return "base/modules/syspagecol/sysPageColForm";
	}

	@RequiresPermissions("syspagecol:sysPageCol:edit")
	@RequestMapping(value = "save")
	public String save(SysPageCol sysPageCol, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, sysPageCol)){
			return form(sysPageCol, model);
		}
		sysPageColService.save(sysPageCol);
		addMessage(redirectAttributes, "保存视图展示列成功");
		return "redirect:"+ Global.getAdminPath()+"/syspagecol/sysPageCol/?repage";
	}

	@RequiresPermissions("syspagecol:sysPageCol:edit")
	@RequestMapping(value = "delete")
	public String delete(SysPageCol sysPageCol, RedirectAttributes redirectAttributes) {
		sysPageColService.delete(sysPageCol);
		addMessage(redirectAttributes, "删除视图展示列成功");
		return "redirect:"+ Global.getAdminPath()+"/syspagecol/sysPageCol/?repage";
	}

}