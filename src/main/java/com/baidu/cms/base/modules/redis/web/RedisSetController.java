package com.baidu.cms.base.modules.redis.web;

import com.baidu.cms.base.modules.redis.entity.SysRedis;
import com.baidu.cms.base.modules.redis.service.RedisSetService;
import com.baidu.cms.common.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Set;

@Controller
@RequestMapping(value = "${adminPath}/redis/sysRedis")
public class RedisSetController extends BaseController {

    @Autowired
    private RedisSetService setService;

    @RequestMapping("getSET")
    public String getSET(SysRedis sysRedis, Model model) {
        Set<Object> set = setService.getSET(sysRedis.getRedisKey());
        sysRedis.setValSet(set);
        model.addAttribute("sysRedis", sysRedis);
        return "base/modules/redis/sysRedisForm";
    }

    @RequestMapping("addSET")
    public String addSET(SysRedis sysRedis) {
        setService.addSET(sysRedis.getRedisKey(), sysRedis.getRedisValue());
        return "base/modules/redis/sysRedisForm";
    }

    /**
     * 删除set元素
     */
    @RequestMapping("delSET")
    public String delSET(SysRedis sysRedis, RedirectAttributes redirectAttributes) {
        setService.delSET(sysRedis.getRedisKey(), sysRedis.getRedisValue());
        addMessage(redirectAttributes, "删除set元素成功");
        return "redirect:" + adminPath + "/redis/set/?repage";
    }
}
