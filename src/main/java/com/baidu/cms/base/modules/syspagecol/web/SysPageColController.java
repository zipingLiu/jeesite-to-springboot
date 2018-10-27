package com.baidu.cms.base.modules.syspagecol.web;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.baidu.cms.base.modules.syspagecol.entity.PageColumn;
import com.baidu.cms.base.modules.syspagecol.entity.SysPageCol;
import com.baidu.cms.base.modules.syspagecol.service.SysPageColService;
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
import java.util.List;

/**
 * 视图展示列管理Controller
 *
 * @author shiyanjun
 * @version 2018-10-25
 */
@Controller
@RequestMapping(value = "${adminPath}/syspagecol/sysPageCol")
public class SysPageColController extends BaseController {

    @Autowired
    private RedisUtils redisUtils;

    @Autowired
    private SysPageColService sysPageColService;

    @ModelAttribute
    public SysPageCol get(@RequestParam(required = false) String id) {
        SysPageCol entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = sysPageColService.get(id);
        }
        if (entity == null) {
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
        if (sysPageCol.getIsNewRecord()) {
            // 加载视图列表
            List<SysPageCol> colList = getColListFromCache();
            model.addAttribute("colList", colList);
            // 验证视图是否存在
            if (!sysPageColService.checkTableName(sysPageCol.getViewName())) {
                addMessage(model, "下一步失败！" + sysPageCol.getViewName() + " 视图已经添加！");
                sysPageCol.setViewName("");
            }
        }
        PageColumn pageColumn = Global.viewColumnMap.get(sysPageCol.getViewName());
        SysPageCol pageCol = new SysPageCol(pageColumn, sysPageCol.getId(), sysPageCol.getColHide());
        model.addAttribute("sysPageCol", pageColumn == null ? sysPageCol : pageCol);
        if (pageColumn != null) {
            model.addAttribute("allList", sysPageCol.getColLabValList(pageColumn.getThList()));
        }
        return "base/modules/syspagecol/sysPageColForm";
    }

    /**
     * 从缓存加载所有视图信息
     */
    private List<SysPageCol> getColListFromCache() {
        String jsonContent = redisUtils.get(RedisUtils.prefix("ALL-VIEW-COLUMN-LIST:"));
        return JSON.parseObject(jsonContent, new TypeReference<List<SysPageCol>>() {
        });
    }

    @RequiresPermissions("syspagecol:sysPageCol:edit")
    @RequestMapping(value = "save")
    public String save(SysPageCol sysPageCol, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, sysPageCol)) {
            return form(sysPageCol, model);
        }
        sysPageColService.save(sysPageCol);
        addMessage(redirectAttributes, "保存视图展示列成功");
        return "redirect:" + Global.getAdminPath() + "/syspagecol/sysPageCol/?repage";
    }

    @RequiresPermissions("syspagecol:sysPageCol:edit")
    @RequestMapping(value = "delete")
    public String delete(SysPageCol sysPageCol, RedirectAttributes redirectAttributes) {
        sysPageColService.delete(sysPageCol);
        addMessage(redirectAttributes, "删除视图展示列成功");
        return "redirect:" + Global.getAdminPath() + "/syspagecol/sysPageCol/?repage";
    }

}