package com.baidu.cms;

import com.baidu.cms.modules.sys.service.SystemService;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.ComponentScan;

/**
 * springboot的启动类
 */
@EnableCaching
@SpringBootApplication
@ServletComponentScan("com.baidu.cms")
@ComponentScan(value = "com.baidu.cms",lazyInit = true)
public class App {
    public static void main(String[] args) {
        new SpringApplicationBuilder(App.class).web(true).run(args);
        SystemService.printKeyLoadMessage();
    }
}
