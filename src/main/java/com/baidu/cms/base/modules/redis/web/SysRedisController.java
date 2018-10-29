package com.baidu.cms.base.modules.redis.web;

import com.baidu.cms.base.modules.redis.entity.SysRedis;
import com.baidu.cms.base.modules.redis.service.SysRedisService;
import com.baidu.cms.common.config.Global;
import com.baidu.cms.common.persistence.Page;
import com.baidu.cms.common.utils.RedisUtils;
import com.baidu.cms.common.utils.StringUtils;
import com.baidu.cms.common.web.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.DataType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 缓存管理Controller
 *
 * @author shiyanjun
 * @version 2018-10-20
 */
@Controller
@RequestMapping(value = "${adminPath}/redis/sysRedis")
public class SysRedisController extends BaseController {

    @Autowired
    private SysRedisService sysRedisService;

    @ModelAttribute
    public SysRedis get(@RequestParam(required = false) String redisKey) {
        SysRedis entity = null;
        if (StringUtils.isNotBlank(redisKey)) {
            entity = sysRedisService.get(redisKey);
        }
        if (entity == null) {
            entity = new SysRedis();
        }
        return entity;
    }

    @RequiresPermissions("redis:sysRedis:view")
    @RequestMapping(value = {"list", ""})
    public String list(SysRedis sysRedis, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<SysRedis> page = sysRedisService.findPage(new Page<>(request, response), sysRedis);
        model.addAttribute("page", page);
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
        // 目前仅支持string类型
        sysRedis.setDataType(DataType.STRING.code());
        if (!beanValidator(model, sysRedis)) {
            return form(sysRedis, model);
        }
        // 数据类型校验
        if (!checkKey(model, sysRedis)) {
            return form(sysRedis, model);
        }
        sysRedisService.save(sysRedis);
        addMessage(redirectAttributes, "保存缓存管理成功");
        return "redirect:" + Global.getAdminPath() + "/redis/sysRedis/?repage";
    }

    /**
     * redis数据类型校验
     */
    private boolean checkKey(Model model, SysRedis sysRedis) {
        if (!DataType.STRING.code().equals(sysRedis.getDataType())) {
            addMessage(model, "目前仅支持String类型!");
            return false;
        }
        String redisKey = sysRedis.getRedisKey();
        if (StringUtils.isNotBlank(redisKey) && redisKey.startsWith(RedisUtils.DEFAULT_CACHE_PREFIX)) {
            addMessage(model, "非法的key名称!");
            return false;
        }
        return true;
    }

    @RequiresPermissions("redis:sysRedis:edit")
    @RequestMapping(value = "delete")
    public String delete(SysRedis sysRedis, RedirectAttributes redirectAttributes) {
        sysRedisService.delete(sysRedis);
        addMessage(redirectAttributes, "删除缓存管理成功");
        return "redirect:" + Global.getAdminPath() + "/redis/sysRedis/?repage";
    }

}