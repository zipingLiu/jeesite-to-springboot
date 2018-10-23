package com.baidu.cms.base.modules.gen.web;

import com.baidu.cms.base.modules.gen.entity.GenTable;
import com.baidu.cms.base.modules.gen.service.GenTableService;
import com.baidu.cms.base.modules.gen.util.GenUtils;
import com.baidu.cms.base.modules.sys.entity.User;
import com.baidu.cms.base.modules.sys.utils.UserUtils;
import com.baidu.cms.common.config.Global;
import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.utils.StringUtils;
import com.baidu.cms.common.web.BaseController;
import com.baidu.cms.datasources.DataSourceNames;
import com.baidu.cms.datasources.DynamicDataSource;
import com.baidu.cms.datasources.annotation.DataSource;
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
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * 业务表Controller
 * @author Idea
 * @version 2013-10-15
 */
@Controller
@RequestMapping(value = "${adminPath}/gen/genTable")
public class GenTableController extends BaseController {

	@Autowired
	private GenTableService genTableService;

	@DataSource(name = DataSourceNames.BASE)
	@ModelAttribute
	public GenTable get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return genTableService.get(id);
		}else{
			return new GenTable();
		}
	}

	@DataSource(name = DataSourceNames.BASE)
	@RequiresPermissions("gen:genTable:view")
	@RequestMapping(value = {"list", ""})
	public String list(GenTable genTable, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		if (!user.isAdmin()){
			genTable.setCreateBy(user);
		}
        Page<GenTable> page = genTableService.find(new Page<GenTable>(request, response), genTable);
        model.addAttribute("page", page);
		return "base/modules/gen/genTableList";
	}

	@RequiresPermissions("gen:genTable:view")
	@RequestMapping(value = "form")
	public String form(GenTable genTable, Model model) {
		try {
			// 获取物理表列表
			List<GenTable> tableList = new ArrayList<GenTable>();

			// 从配置获取所有的数据库路由键和数据库名称
			Map<String, String> map = Global.getDatasourceKeyAndName();
			Iterator<String> it = map.keySet().iterator();
			while (it.hasNext()) {
				String datasourceKey = it.next();
				DynamicDataSource.setDataSource(datasourceKey);
				// 加载物理表
				List<GenTable> subList = genTableService.findTableListFormDb(new GenTable());
				tableList.addAll(subList);
			}
			model.addAttribute("tableList", tableList);

			// 验证表是否存在
			if (StringUtils.isBlank(genTable.getId()) && !genTableService.checkTableName(genTable.getName())){
				addMessage(model, "下一步失败！" + genTable.getName() + " 表已经添加！");
				genTable.setName("");
			}
			// 获取物理表字段
			else{
				genTable = genTableService.getTableFormDb(genTable);
			}
		} finally {
			DynamicDataSource.clearDataSource();
			logger.debug(">>>>>>>> clean datasource");
		}
		model.addAttribute("genTable", genTable);
		model.addAttribute("config", GenUtils.getConfig());
		return "base/modules/gen/genTableForm";
	}

	@DataSource(name = DataSourceNames.BASE)
	@RequiresPermissions("gen:genTable:edit")
	@RequestMapping(value = "save")
	public String save(GenTable genTable, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, genTable)){
			return form(genTable, model);
		}
		// 验证表是否已经存在
		if (StringUtils.isBlank(genTable.getId()) && !genTableService.checkTableName(genTable.getName())){
			addMessage(model, "保存失败！" + genTable.getName() + " 表已经存在！");
			genTable.setName("");
			return form(genTable, model);
		}
		genTableService.save(genTable);
		addMessage(redirectAttributes, "保存业务表'" + genTable.getName() + "'成功");
		return "redirect:" + adminPath + "/gen/genTable/?repage";
	}

	@DataSource(name = DataSourceNames.BASE)
	@RequiresPermissions("gen:genTable:edit")
	@RequestMapping(value = "delete")
	public String delete(GenTable genTable, RedirectAttributes redirectAttributes) {
		genTableService.delete(genTable);
		addMessage(redirectAttributes, "删除业务表成功");
		return "redirect:" + adminPath + "/gen/genTable/?repage";
	}

}
