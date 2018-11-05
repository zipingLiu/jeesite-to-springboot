package com.baidu.cms.base.modules.redis.web;

import com.baidu.cms.base.modules.redis.entity.SysRedis;
import com.baidu.cms.base.modules.redis.service.RedisListService;
import com.baidu.cms.common.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping(value = "${adminPath}/redis/sysRedis")
public class RedisListController extends BaseController {

    @Autowired
    private RedisListService listService;

    @RequestMapping("getLIST")
    public String getLIST(SysRedis sysRedis, Model model) {
        List<Object> list = listService.getLIST(sysRedis.getRedisKey());
        sysRedis.setValList(list);
        model.addAttribute("sysRedis", sysRedis);
        return "base/modules/redis/sysRedisForm";
    }

    @RequestMapping("addLIST")
    public String addLIST(@RequestParam("redisKey") String redisKey, @RequestParam("redisValue") String redisValue) {
        listService.addLIST(redisKey, redisValue);
        return "base/modules/redis/sysRedisForm";
    }

    @RequestMapping("/delLIST")
    public String delLIST(@RequestParam("redisKey") String redisKey, RedirectAttributes redirectAttributes) {
        listService.delLIST(redisKey);
        addMessage(redirectAttributes, "删除list元素成功");
        return "redirect:" + adminPath + "/redis/list/?repage";
    }
}
