package com.baidu.cms.base.modules.redis.web;

import com.baidu.cms.base.modules.redis.entity.SysRedis;
import com.baidu.cms.base.modules.redis.service.RedisZSetService;
import com.baidu.cms.common.utils.StringUtils;
import com.baidu.cms.common.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping(value = "${adminPath}/redis/sysRedis")
public class RedisZSetController extends BaseController {

    @Autowired
    private RedisZSetService zSetService;


    @RequestMapping("getZSET")
    public String getZSET(SysRedis sysRedis, Model model) {
        List<SysRedis.ScoreVal> zset = zSetService.getZSET(sysRedis.getRedisKey());
        sysRedis.setZsetList(zset);
        model.addAttribute("sysRedis", sysRedis);
        return "base/modules/redis/sysRedisForm";
    }

    @RequestMapping("addZSET")
    public String addZSET(SysRedis sysRedis) {
        zSetService.addZSET(sysRedis.getRedisKey(), sysRedis.getRedisValue(), StringUtils.toDouble(sysRedis.getScore()));
        return "base/modules/redis/sysRedisForm";
    }

    /**
     * 删除zset元素
     */
    @RequestMapping("delZSET")
    public String delZSET(SysRedis sysRedis, RedirectAttributes redirectAttributes) {
        zSetService.delZSET(sysRedis.getRedisKey(), sysRedis.getRedisValue());
        addMessage(redirectAttributes, "删除zset元素成功");
        return "redirect:" + adminPath + "/redis/zset/?repage";
    }

}
