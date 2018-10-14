package com.baidu.cms;

import com.baidu.cms.base.modules.sys.service.SystemService;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.AdviceMode;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * springboot的启动类
 */
@EnableCaching
@EnableTransactionManagement(mode = AdviceMode.ASPECTJ)
@SpringBootApplication
@ServletComponentScan("com.baidu.cms")
@ComponentScan(value = "com.baidu.cms",lazyInit = true)
public class App {
    public static void main(String[] args) {
        new SpringApplicationBuilder(App.class).web(true).run(args);
        SystemService.printKeyLoadMessage();
    }
}
