package com.baidu.cms.studio.common;

import com.baidu.cms.common.utils.CryptUtils;
import com.baidu.cms.studio.modules.psmatchsubmit.entity.PsMatchSubmit;
import com.baidu.cms.studio.modules.psuser.entity.PsUser;

/**
 *  用户公共工具类
 *  @author: shiyanjun
 *  @Date: 2018/10/19 下午3:03
 */
public class PsUserUtil {

    /**
     * 用户敏感信息解密
     */
    public static PsUser decrypt(PsUser psUser) {
        if (psUser != null) {
            psUser.setTrueName(CryptUtils.decrypt(psUser.getTrueName()));
            psUser.setMobile(CryptUtils.decrypt(psUser.getMobile()));
            psUser.setEmail(CryptUtils.decrypt(psUser.getEmail()));
        }
        return psUser;
    }

    /**
     * 用户敏感信息解密
     */
    public static PsMatchSubmit decrypt(PsMatchSubmit submit) {
        if (submit != null) {
            submit.setTrueName(CryptUtils.decrypt(submit.getTrueName()));
            submit.setMobile(CryptUtils.decrypt(submit.getMobile()));
            submit.setEmail(CryptUtils.decrypt(submit.getEmail()));
        }
        return submit;
    }
}
