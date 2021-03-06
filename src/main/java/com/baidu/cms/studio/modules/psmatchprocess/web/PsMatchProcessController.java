package com.baidu.cms.studio.modules.psmatchprocess.web;

import com.baidu.cms.base.modules.config.entity.SysConfig;
import com.baidu.cms.base.modules.config.service.SysConfigService;
import com.baidu.cms.common.config.Global;
import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.utils.Collections3;
import com.baidu.cms.common.utils.RedisUtils;
import com.baidu.cms.common.utils.StringUtils;
import com.baidu.cms.common.web.BaseController;
import com.baidu.cms.studio.modules.psmatch.entity.PsMatch;
import com.baidu.cms.studio.modules.psmatch.service.PsMatchService;
import com.baidu.cms.studio.modules.psmatchprocess.entity.PsMatchProcess;
import com.baidu.cms.studio.modules.psmatchprocess.service.PsMatchProcessService;
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
import java.util.List;

/**
 * 阶段管理Controller
 *
 * @author shiyanjun
 * @version 2018-10-18
 */
@Controller
@RequestMapping(value = "${adminPath}/psmatchprocess/psMatchProcess")
public class PsMatchProcessController extends BaseController {

    @Autowired
    private RedisUtils redisUtils;

    @Autowired
    private PsMatchService psMatchService;

    @Autowired
    private PsMatchProcessService psMatchProcessService;

    @Autowired
    private SysConfigService sysConfigService;

    @ModelAttribute
    public PsMatchProcess get(@RequestParam(required = false) String id) {
        PsMatchProcess entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = psMatchProcessService.get(id);
        }
        if (entity == null) {
            entity = new PsMatchProcess();
        }
        return entity;
    }

    @RequiresPermissions("psmatchprocess:psMatchProcess:view")
    @RequestMapping(value = {"list", ""})
    public String list(PsMatchProcess psMatchProcess, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<PsMatchProcess> page = psMatchProcessService.findPage(new Page<>(request, response), psMatchProcess);
        model.addAttribute("page", page);
        List<PsMatch> matchList = psMatchService.findList(new PsMatch());
        model.addAttribute("matchList", matchList);
        // 排行榜
        model.addAttribute("submitTopNum", getSubmitTopNum());
        return "studio/modules/psmatchprocess/psMatchProcessList";
    }

    /**
     * 查询排行榜展示数量
     */
    private int getSubmitTopNum() {
        SysConfig sysConfig = new SysConfig();
        sysConfig.setConfigEnv(Global.getActiveEnv());
        sysConfig.setConfigKey("submitTopNum");
        // 查询缓存
        String configValue = redisUtils.get(sysConfig.getConfigKey());
        if (StringUtils.isNotBlank(configValue)) {
            return StringUtils.toInteger(configValue, 1);
        }
        // 查询DB
        List<SysConfig> configList = sysConfigService.findList(sysConfig);
        if (!Collections3.isEmpty(configList)) {
            configValue = configList.get(0).getConfigValue();
        }
        return StringUtils.toInteger(configValue, 1);
    }

    @RequiresPermissions("psmatchprocess:psMatchProcess:view")
    @RequestMapping(value = "form")
    public String form(PsMatchProcess psMatchProcess, Model model) {
        model.addAttribute("psMatchProcess", psMatchProcess);
        List<PsMatch> matchList = psMatchService.findList(new PsMatch());
        model.addAttribute("matchList", matchList);
        return "studio/modules/psmatchprocess/psMatchProcessForm";
    }

    @RequiresPermissions("psmatchprocess:psMatchProcess:edit")
    @RequestMapping(value = "save")
    public String save(PsMatchProcess psMatchProcess, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, psMatchProcess)) {
            return form(psMatchProcess, model);
        }
        psMatchProcessService.save(psMatchProcess);
        addMessage(redirectAttributes, "保存比赛阶段成功");
        return "redirect:" + Global.getAdminPath() + "/psmatchprocess/psMatchProcess/?repage";
    }

    @RequiresPermissions("psmatchprocess:psMatchProcess:edit")
    @RequestMapping(value = "delete")
    public String delete(PsMatchProcess psMatchProcess, RedirectAttributes redirectAttributes) {
        psMatchProcessService.delete(psMatchProcess);
        addMessage(redirectAttributes, "删除比赛阶段成功");
        return "redirect:" + Global.getAdminPath() + "/psmatchprocess/psMatchProcess/?repage";
    }

}