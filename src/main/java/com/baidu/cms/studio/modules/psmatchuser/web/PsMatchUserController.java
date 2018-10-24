package com.baidu.cms.studio.modules.psmatchuser.web;

import com.baidu.cms.common.config.Global;
import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.utils.StringUtils;
import com.baidu.cms.common.web.BaseController;
import com.baidu.cms.studio.common.PsUserUtil;
import com.baidu.cms.studio.modules.psmatch.entity.PsMatch;
import com.baidu.cms.studio.modules.psmatch.service.PsMatchService;
import com.baidu.cms.studio.modules.psmatchuser.entity.PsMatchUser;
import com.baidu.cms.studio.modules.psmatchuser.service.PsMatchUserService;
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
 * 报名用户Controller
 *
 * @author shiyanjun
 * @version 2018-10-18
 */
@Controller
@RequestMapping(value = "${adminPath}/psmatchuser/psMatchUser")
public class PsMatchUserController extends BaseController {

    @Autowired
    private PsMatchService psMatchService;

    @Autowired
    private PsMatchUserService psMatchUserService;

    @ModelAttribute
    public PsMatchUser get(@RequestParam(required = false) String id) {
        PsMatchUser entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = psMatchUserService.get(id);
        }
        if (entity == null) {
            entity = new PsMatchUser();
        } else {
            PsUserUtil.decrypt(entity);
        }
        return entity;
    }

    @RequiresPermissions("psmatchuser:psMatchUser:view")
    @RequestMapping(value = {"list", ""})
    public String list(PsMatchUser psMatchUser, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<PsMatchUser> page = psMatchUserService.findPage(new Page<>(request, response), psMatchUser);
        model.addAttribute("page", page);
        List<PsMatch> matchList = psMatchService.findList(new PsMatch());
        model.addAttribute("matchList", matchList);
        return "studio/modules/psmatchuser/psMatchUserList";
    }

    @RequiresPermissions("psmatchuser:psMatchUser:view")
    @RequestMapping(value = "form")
    public String form(PsMatchUser psMatchUser, Model model) {
        model.addAttribute("psMatchUser", psMatchUser);
        return "studio/modules/psmatchuser/psMatchUserForm";
    }

    @RequiresPermissions("psmatchuser:psMatchUser:edit")
    @RequestMapping(value = "save")
    public String save(PsMatchUser psMatchUser, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, psMatchUser)) {
            return form(psMatchUser, model);
        }
        psMatchUserService.save(psMatchUser);
        addMessage(redirectAttributes, "保存报名用户成功");
        return "redirect:" + Global.getAdminPath() + "/psmatchuser/psMatchUser/?repage";
    }

    @RequiresPermissions("psmatchuser:psMatchUser:edit")
    @RequestMapping(value = "delete")
    public String delete(PsMatchUser psMatchUser, RedirectAttributes redirectAttributes) {
        psMatchUserService.delete(psMatchUser);
        addMessage(redirectAttributes, "删除报名用户成功");
        return "redirect:" + Global.getAdminPath() + "/psmatchuser/psMatchUser/?repage";
    }

}