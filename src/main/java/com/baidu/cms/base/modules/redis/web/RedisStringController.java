package com.baidu.cms.base.modules.redis.web;

import com.baidu.cms.base.modules.redis.entity.SysRedis;
import com.baidu.cms.base.modules.redis.service.RedisStringService;
import com.baidu.cms.common.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "${adminPath}/redis/sysRedis")
public class RedisStringController extends BaseController {

    @Autowired
    private RedisStringService stringService;

    @RequestMapping("getSTRING")
    public String getSTRING(SysRedis sysRedis, Model model) {
        Object redisValue = stringService.getSTRING(sysRedis.getRedisKey());
        sysRedis.setRedisValue(String.valueOf(redisValue));
        model.addAttribute("sysRedis", sysRedis);
        return "base/modules/redis/sysRedisForm";
    }

    @RequestMapping("addSTRING")
    public String addSTRING(SysRedis sysRedis, Model model) {
        stringService.addSTRING(sysRedis.getRedisKey(), sysRedis.getRedisValue());
        model.addAttribute("sysRedis", sysRedis);
        return "base/modules/redis/sysRedisForm";
    }

    @RequestMapping("delSTRING")
    public String delSTRING(SysRedis sysRedis, RedirectAttributes redirectAttributes) {
        stringService.delSTRING(sysRedis.getRedisKey());
        addMessage(redirectAttributes, "删除元素成功");
        return "redirect:" + adminPath + "/redis/string/?repage";
    }
}
