package com.baidu.cms.base.modules.config.web;

import com.baidu.cms.base.modules.column.service.SysColumnHideService;
import com.baidu.cms.base.modules.config.entity.SysConfig;
import com.baidu.cms.base.modules.config.service.SysConfigService;
import com.baidu.cms.common.config.Global;
import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.utils.RedisUtils;
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

/**
 * 配置参数管理Controller
 *
 * @author shiyanjun
 * @version 2018-10-23
 */
@Controller
@RequestMapping(value = "${adminPath}/config/sysConfig")
public class SysConfigController extends BaseController {

    @Autowired
    private RedisUtils redisUtils;

    @Autowired
    private SysColumnHideService sysColumnHideService;

    @Autowired
    private SysConfigService sysConfigService;

    @ModelAttribute
    public SysConfig get(@RequestParam(required = false) String id) {
        SysConfig entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = sysConfigService.get(id);
        }
        if (entity == null) {
            entity = new SysConfig();
        }
        return entity;
    }

    @RequiresPermissions("config:sysConfig:view")
    @RequestMapping(value = {"list", ""})
    public String list(SysConfig sysConfig, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<SysConfig> page = sysConfigService.findPage(new Page<>(request, response), sysConfig);
        model.addAttribute("page", page);
        return "base/modules/config/sysConfigList";
    }

    @RequiresPermissions("config:sysConfig:view")
    @RequestMapping(value = "form")
    public String form(SysConfig sysConfig, Model model) {
        model.addAttribute("sysConfig", sysConfig);
        return "base/modules/config/sysConfigForm";
    }

    @RequiresPermissions("config:sysConfig:edit")
    @RequestMapping(value = "save")
    public String save(SysConfig sysConfig, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, sysConfig)) {
            return form(sysConfig, model);
        }
        sysConfigService.save(sysConfig);
        addMessage(redirectAttributes, "保存配置项成功");
        // 写入缓存
        redisUtils.set(sysConfig.getConfigKey(), sysConfig.getConfigValue());
        return "redirect:" + Global.getAdminPath() + "/config/sysConfig/?repage";
    }

    @RequiresPermissions("config:sysConfig:edit")
    @RequestMapping(value = "delete")
    public String delete(SysConfig sysConfig, RedirectAttributes redirectAttributes) {
        sysConfigService.delete(sysConfig);
        addMessage(redirectAttributes, "删除配置项成功");
        return "redirect:" + Global.getAdminPath() + "/config/sysConfig/?repage";
    }

}