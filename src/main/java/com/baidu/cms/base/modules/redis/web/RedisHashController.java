package com.baidu.cms.base.modules.redis.web;

import com.baidu.cms.base.modules.redis.entity.SysRedis;
import com.baidu.cms.base.modules.redis.service.RedisHashService;
import com.baidu.cms.common.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

@Controller
@RequestMapping(value = "${adminPath}/redis/sysRedis")
public class RedisHashController extends BaseController {

    @Autowired
    private RedisHashService hashService;

    @RequestMapping("getHASH")
    public String getHASH(SysRedis sysRedis, Model model) {
        Map<String, Object> hash = hashService.getHASH(sysRedis.getRedisKey());
        sysRedis.setValMap(hash);
        model.addAttribute("sysRedis", sysRedis);
        return "base/modules/redis/sysRedisForm";
    }

    @RequestMapping("addHASH")
    public String addHASH(SysRedis sysRedis) {
        hashService.addHASH(sysRedis.getRedisKey(), sysRedis.getHashKey(), sysRedis.getRedisValue());
        return "base/modules/redis/sysRedisForm";
    }

    @RequestMapping("delHASH")
    public String delHASH(SysRedis sysRedis, RedirectAttributes redirectAttributes) {
        hashService.delHASH(sysRedis.getRedisKey(), sysRedis.getHashKey());
        addMessage(redirectAttributes, "删除hash元素成功");
        return "redirect:" + adminPath + "/redis/hash/?repage";
    }

}
