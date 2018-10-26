package com.baidu.cms.common;

import com.alibaba.fastjson.JSON;
import com.baidu.cms.base.modules.column.entity.PageColumn;
import com.baidu.cms.common.config.Global;
import com.baidu.cms.common.utils.JsoupUtil;
import com.baidu.cms.common.utils.RedisUtils;
import com.baidu.cms.common.utils.StringUtils;
import org.apache.commons.io.FileUtils;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * 启动时初始化数据
 *
 * @author: shiyanjun
 * @Date: 2018/10/25 下午6:01
 */
@Order(1)
@Component
public class AppStartup implements ApplicationRunner {

    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private ServletContext servletContext;

    @Autowired
    private RedisUtils redisUtils;

    @Override
    public void run(ApplicationArguments args) {
        columnHideCache();
    }

    /**
     * 将所有列表页的列写入缓存
     *
     * @author: shiyanjun
     * @Date: 2018/10/25 下午6:15
     */
    private void columnHideCache() {
        try {
            // 获取视图文件所在路径
            String realPath = servletContext.getRealPath(Global.getViewPrefix());

            // 视图文件扩展名
            String viewExtension = Global.getViewExtension();
            Iterator<File> it = FileUtils.iterateFiles(new File(realPath), new String[]{viewExtension}, true);

            // 存储列信息
            List<PageColumn> columnList = new ArrayList<>();
            while (it.hasNext()) {
                File file = it.next();
                String fileName = file.getName();
                if (fileName.endsWith("List.jsp")) {
                    String viewPath = StringUtils.substringBetween(file.getPath(), "views/", ".jsp");
                    String moduleName = StringUtils.substringBefore(viewPath, "/modules");
                    String entityName = StringUtils.firstToUpper(StringUtils.substringBefore(fileName, "List.jsp"));

                    String fileContent = FileUtils.readFileToString(file, "UTF-8");
                    Document doc = JsoupUtil.parseHtmlToDoc(fileContent);
                    Element table = doc.getElementById("contentTable");
                    if (table != null) {
                        Elements eList = table.getElementsByTag("th");
                        if (!CollectionUtils.isEmpty(eList)) {
                            List<String> thList = new ArrayList<>();
                            for (int i = 0; i < eList.size(); i++) {
                                thList.add(eList.get(i).text());
                            }
                            PageColumn pageColumn = new PageColumn(moduleName, entityName, viewPath, fileName, thList);
                            columnList.add(pageColumn);
                        }
                    }
                }
            }
            String toJSONString = JSON.toJSONString(columnList);
            // 写入缓存
            redisUtils.set("PAGE-COLUMN-LIST:", toJSONString);
            logger.info("将所有列写入缓存:" + toJSONString);
        } catch (IOException e) {
            logger.error("系统启动异常:" + e.toString());
        }
    }
}
