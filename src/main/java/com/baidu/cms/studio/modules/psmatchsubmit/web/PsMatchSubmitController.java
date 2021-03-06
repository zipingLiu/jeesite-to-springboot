package com.baidu.cms.studio.modules.psmatchsubmit.web;

import com.baidu.cms.common.config.Global;
import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.utils.StringUtils;
import com.baidu.cms.common.web.BaseController;
import com.baidu.cms.studio.common.PsUserUtil;
import com.baidu.cms.studio.modules.psmatch.entity.PsMatch;
import com.baidu.cms.studio.modules.psmatch.service.PsMatchService;
import com.baidu.cms.studio.modules.psmatchprocess.entity.PsMatchProcess;
import com.baidu.cms.studio.modules.psmatchprocess.service.PsMatchProcessService;
import com.baidu.cms.studio.modules.psmatchsubmit.entity.PsMatchSubmit;
import com.baidu.cms.studio.modules.psmatchsubmit.service.PsMatchSubmitService;
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
import java.util.Collections;
import java.util.List;

/**
 * 提交管理Controller
 *
 * @author shiyanjun
 * @version 2018-10-18
 */
@Controller
@RequestMapping(value = "${adminPath}/psmatchsubmit/psMatchSubmit")
public class PsMatchSubmitController extends BaseController {

    @Autowired
    private PsMatchService psMatchService;

    @Autowired
    private PsMatchProcessService psMatchProcessService;

    @Autowired
    private PsMatchSubmitService psMatchSubmitService;

    @ModelAttribute
    public PsMatchSubmit get(@RequestParam(required = false) String id) {
        PsMatchSubmit entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = psMatchSubmitService.get(id);
        }
        if (entity == null) {
            entity = new PsMatchSubmit();
        } else {
            PsUserUtil.decrypt(entity);
        }
        return entity;
    }

    @RequiresPermissions("psmatchsubmit:psMatchSubmit:view")
    @RequestMapping(value = {"list", ""})
    public String list(PsMatchSubmit psMatchSubmit, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<PsMatchSubmit> page = psMatchSubmitService.findPage(new Page<>(request, response), psMatchSubmit);

        // 读取排行榜配置
        String submitTopNum = request.getParameter("submitTopNum");
        if (StringUtils.isNotBlank(submitTopNum)) {
            Page<PsMatchSubmit> topPage = psMatchSubmitService.findSubmitTopPage(new Page<>(request, response), psMatchSubmit);
            List<PsMatchSubmit> topList = topPage.getList();
            Collections.sort(topList);
            page.setCount(topList.size());
            page.setList(topList);
        }
        model.addAttribute("page", page);
        List<PsMatch> matchList = psMatchService.findList(new PsMatch());
        model.addAttribute("matchList", matchList);
        return "studio/modules/psmatchsubmit/psMatchSubmitList";
    }

    @RequiresPermissions("psmatchsubmit:psMatchSubmit:view")
    @RequestMapping(value = "form")
    public String form(PsMatchSubmit psMatchSubmit, Model model) {
        model.addAttribute("psMatchSubmit", psMatchSubmit);
        List<PsMatch> matchList = psMatchService.findList(new PsMatch());
        model.addAttribute("matchList", matchList);
        if (psMatchSubmit != null && psMatchSubmit.getMatchId() != null) {
            PsMatchProcess process = new PsMatchProcess();
            process.setMatchId(psMatchSubmit.getMatchId());
            List<PsMatchProcess> processList = psMatchProcessService.findList(process);
            model.addAttribute("processList", processList);
        }
        return "studio/modules/psmatchsubmit/psMatchSubmitForm";
    }

    @RequiresPermissions("psmatchsubmit:psMatchSubmit:edit")
    @RequestMapping(value = "save")
    public String save(PsMatchSubmit psMatchSubmit, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, psMatchSubmit)) {
            return form(psMatchSubmit, model);
        }
        psMatchSubmitService.save(psMatchSubmit);
        addMessage(redirectAttributes, "保存提交成功");
        return "redirect:" + Global.getAdminPath() + "/psmatchsubmit/psMatchSubmit/?repage";
    }

    @RequiresPermissions("psmatchsubmit:psMatchSubmit:edit")
    @RequestMapping(value = "delete")
    public String delete(PsMatchSubmit psMatchSubmit, RedirectAttributes redirectAttributes) {
        psMatchSubmitService.delete(psMatchSubmit);
        addMessage(redirectAttributes, "删除提交成功");
        return "redirect:" + Global.getAdminPath() + "/psmatchsubmit/psMatchSubmit/?repage";
    }

}