package com.baidu.cms.base.modules.redis.web;

import com.baidu.cms.base.modules.redis.entity.SysRedis;
import com.baidu.cms.base.modules.redis.service.SysRedisService;
import com.baidu.cms.common.config.Global;
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

/**
 * 缓存管理Controller
 * @author shiyanjun
 * @version 2018-10-20
 */
@Controller
@RequestMapping(value = "${adminPath}/redis/sysRedis")
public class SysRedisController extends BaseController {

	@Autowired
	private SysRedisService sysRedisService;
	
	@ModelAttribute
	public SysRedis get(@RequestParam(required=false) String redisKey) {
		SysRedis entity = null;
		if (StringUtils.isNotBlank(redisKey)){
			entity = sysRedisService.get(redisKey);
		}
		if (entity == null){
			entity = new SysRedis();
		}
		return entity;
	}
	
	@RequiresPermissions("redis:sysRedis:view")
	@RequestMapping(value = {"list", ""})
	public String list(SysRedis sysRedis, Model model) {
		model.addAttribute("sysRedis", sysRedis);
		return "base/modules/redis/sysRedisList";
	}

	@RequiresPermissions("redis:sysRedis:view")
	@RequestMapping(value = "form")
	public String form(SysRedis sysRedis, Model model) {
		model.addAttribute("sysRedis", sysRedis);
		return "base/modules/redis/sysRedisForm";
	}

	@RequiresPermissions("redis:sysRedis:edit")
	@RequestMapping(value = "save")
	public String save(SysRedis sysRedis, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, sysRedis)){
			return form(sysRedis, model);
		}
		sysRedisService.save(sysRedis);
		addMessage(redirectAttributes, "保存缓存管理成功");
		return "redirect:"+Global.getAdminPath()+"/redis/sysRedis/?repage";
	}
	
	@RequiresPermissions("redis:sysRedis:edit")
	@RequestMapping(value = "delete")
	public String delete(SysRedis sysRedis, RedirectAttributes redirectAttributes) {
		sysRedisService.delete(sysRedis);
		addMessage(redirectAttributes, "删除缓存管理成功");
		return "redirect:"+Global.getAdminPath()+"/redis/sysRedis/?repage";
	}

}