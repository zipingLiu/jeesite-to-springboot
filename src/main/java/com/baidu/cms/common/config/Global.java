package com.baidu.cms.common.config;

import com.baidu.cms.common.utils.PropertiesLoader;
import com.baidu.cms.common.utils.StringUtils;
import com.ckfinder.connector.ServletContextFactory;
import com.google.common.collect.Maps;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.bind.RelaxedPropertyResolver;
import org.springframework.core.io.DefaultResourceLoader;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 全局配置类
 *
 * @author Idea
 * @version 2014-06-25
 */
public class Global {

    private static Logger logger = LoggerFactory.getLogger(Global.class);

    public static String SPRING_DATASOURCE_URL = "spring.datasource.druid.base.url";
    public static String SPRING_DATASOURCE_KEY_PREFIX = "spring.datasource.";
    public static String SPRING_DATASOURCE_DRUID_KEY_PREFIX = "spring.datasource.druid.";

    static RelaxedPropertyResolver resolver;
    /**
     * 当前对象实例
     */
    private static Global global = new Global();

    /**
     * 保存全局属性值
     */
    private static Map<String, String> map = Maps.newHashMap();

    /**
     * 属性文件加载对象
     */
    private static PropertiesLoader loader = new PropertiesLoader("bootstrap.yml");

    /**
     * 是/否
     */
    public static final String YES = "1";
    public static final String NO = "0";

    /**
     * 对/错
     */
    public static final String TRUE = "true";
    public static final String FALSE = "false";

    /**
     * 上传文件基础虚拟路径
     */
    public static final String USERFILES_BASE_URL = "/userfiles/";

    public static final String SYS_COLUMN_HIDE_KEY = "SYS-COLUMN-HIDE:";

    /**
     * 获取当前对象实例
     */
    public static Global getInstance() {
        return global;
    }

    /**
     * 获取配置
     * ${fns:getConfig('adminPath')}
     */
    public static String getConfig(String key) {
        String value = map.get(key);
        if (value == null) {
            try {
                value = resolver.getProperty(key);
                if (StringUtils.isBlank(value))
                    throw new RuntimeException("value null");
                map.put(key, value);
            } catch (Exception e) {
                value = loader.getProperty(key);
                map.put(key, value != null ? value : StringUtils.EMPTY);
            }
        }
        return value;
    }

    /**
     *  当前激活环境
     *  @author: shiyanjun
     *  @Date: 2018/10/23 下午3:10
     */
    public static String getActiveEnv() {
        return Global.getConfig("spring.profiles.active");
    }

    /**
     *  获取配置中的所有key
     *
     *  @author: shiyanjun
     *  @Date: 2018/10/11 上午10:23
     */
    public static List<String> getPropKeys () {
        List<String> list = new ArrayList<String>();
        Enumeration<?> names = loader.getProperties().propertyNames();
        if (names != null) {
            while (names.hasMoreElements()) {
                list.add(names.nextElement().toString());
            }
        }
        return list;
    }

    public static String getSysColumnHideKey(String name) {
        return SYS_COLUMN_HIDE_KEY + name;
    }

    /**
     * 获取管理端根路径
     */
    public static String getAdminPath() {
        return getConfig("adminPath");
    }

    /**
     * 是否是演示模式，演示模式下不能修改用户、角色、密码、菜单、授权
     */
    public static Boolean isDemoMode() {
        String dm = getConfig("demoMode");
        return "true".equals(dm) || "1".equals(dm);
    }

    /**
     * 获取上传文件的根目录
     *
     * @return
     */
    public static String getUserfilesBaseDir() {
        String dir = getConfig("userfiles.basedir");
        if (StringUtils.isBlank(dir)) {
            try {
                dir = ServletContextFactory.getServletContext().getRealPath("/");
            } catch (Exception e) {
                return "";
            }
        }
        if (!dir.endsWith("/")) {
            dir += "/";
        }
        return dir;
    }

    public static String getJdbcType() {
        if (map.containsKey(Global.SPRING_DATASOURCE_URL))
            return map.get(Global.SPRING_DATASOURCE_URL);
        try {
            String url = resolver.getProperty(Global.SPRING_DATASOURCE_URL);
            String type = getDbType(url);
            map.put(Global.SPRING_DATASOURCE_URL, type);
            return type;
        } catch (Exception e) {
            logger.error("get jdbcType error", e);
        }
        logger.error("return the defaut jdbc type is mysql");
        return "mysql";
    }

    /**
     * 根据数据库名获取数据库路由键
     * @Author shiyanjun
     * @Date 2018/10/18 上午11:34
     * @Param
     * @Return
     * @Exception
     */
    public static String getDatasourceKeyByDbName(String dbName) {
        return Global.getDatasourceKeyAndName().get(dbName);
    }

    /**
     * 根据数据库路由键获取数据库名称
     * @Author shiyanjun
     * @Date 2018/10/18 上午11:36
     * @Param
     * @Return
     * @Exception
     */
    public static String getDbNameByDatasourceKey(String datasourceKey) {
        return Global.getDatasourceKeyAndName().get(datasourceKey);
    }

    /**
     * 获取所有数据库名称
     * @Author shiyanjun
     * @Date 2018/10/18 上午11:18
     * @Param
     * @Return
     * @Exception
     */
    public static Map<String, String> getDatasourceKeyAndName() {
        Map<String, String> map = Global.getJdbcUrlConfig();
        Iterator<String> it = map.keySet().iterator();
        Map<String, String> newMap = new HashMap<>();
        while (it.hasNext()) {
            String key = it.next();
            newMap.put(Global.getDatasourceKeyByJdbcUrlKey(key), Global.getDbName(map.get(key)));
        }
        return newMap;
    }

    /**
     * 获取数据库的路由键
     * @Author shiyanjun
     * @Date 2018/10/18 上午11:24
     * @Param
     * @Return
     * @Exception
     */
    private static String getDatasourceKeyByJdbcUrlKey(String jdbcUrlKey) {
        if (jdbcUrlKey.startsWith(Global.SPRING_DATASOURCE_DRUID_KEY_PREFIX) && jdbcUrlKey.endsWith(".url")) {
            String[] split = jdbcUrlKey.split("\\.");
            if (split != null && split.length > 3) {
                return split[3];
            }
        }
        return null;
    }

    /**
     *  从jdbcUrl中解析出数据库名
     *  @author: shiyanjun
     *  @Date: 2018/10/11 上午10:35
     */
    private static String getDbName(String jdbcUrl) {
        if (StringUtils.isNotBlank(jdbcUrl) && jdbcUrl.startsWith("jdbc:mysql:")) {
            String[] split = jdbcUrl.split(":");
            String len = split[split.length - 1];
            int last = len.lastIndexOf("?") == -1 ? len.length() : len.lastIndexOf("?");
            String dbName = len.substring(len.indexOf("/") + 1, last);
            return dbName;
        }
        return null;
    }

    /**
     * 获取所有jdbcUrl配置
     * @Author shiyanjun
     * @Date 2018/10/18 上午11:12
     * @Param
     * @Return
     * @Exception
     */
    private static Map<String, String> getJdbcUrlConfig() {
        Map<String, Object> map = Global.getSpringDatasourceConfig();
        Iterator<String> it = map.keySet().iterator();
        Map<String, String> jdbcUrlMap = new HashMap<>();
        while (it.hasNext()) {
            String next = it.next();
            if (next.startsWith(Global.SPRING_DATASOURCE_KEY_PREFIX) && next.endsWith(".url")) {
                String value = (String) map.get(next);
                if (StringUtils.isNotBlank(value) && value.startsWith("jdbc:mysql:")) {
                    jdbcUrlMap.put(next, value);
                }
            }
        }
        return jdbcUrlMap;
    }

    /**
     * 获取所有spring数据源配置
     * @Author shiyanjun
     * @Date 2018/10/18 上午10:59
     * @Param
     * @Return
     * @Exception
     */
    private static Map<String, Object> getSpringDatasourceConfig() {
        Map<String, Object> newMap = new HashMap<>();
        Map<String, Object> map = Global.resolver.getSubProperties(SPRING_DATASOURCE_KEY_PREFIX);
        Iterator<String> it = map.keySet().iterator();
        while (it.hasNext()) {
            String next = it.next();
            newMap.put(Global.SPRING_DATASOURCE_KEY_PREFIX + next, map.get(next));
        }
        return newMap;
    }

    private static String getDbType(String rawUrl) {
        return rawUrl == null ? null : (!rawUrl.startsWith("jdbc:derby:") && !rawUrl.startsWith("jdbc:log4jdbc:derby:") ? (!rawUrl.startsWith("jdbc:mysql:") && !rawUrl.startsWith("jdbc:cobar:") && !rawUrl.startsWith("jdbc:log4jdbc:mysql:") ? (rawUrl.startsWith("jdbc:mariadb:") ? "mariadb" : (!rawUrl.startsWith("jdbc:oracle:") && !rawUrl.startsWith("jdbc:log4jdbc:oracle:") ? (rawUrl.startsWith("jdbc:alibaba:oracle:") ? "AliOracle" : (!rawUrl.startsWith("jdbc:microsoft:") && !rawUrl.startsWith("jdbc:log4jdbc:microsoft:") ? (!rawUrl.startsWith("jdbc:sqlserver:") && !rawUrl.startsWith("jdbc:log4jdbc:sqlserver:") ? (!rawUrl.startsWith("jdbc:sybase:Tds:") && !rawUrl.startsWith("jdbc:log4jdbc:sybase:") ? (!rawUrl.startsWith("jdbc:jtds:") && !rawUrl.startsWith("jdbc:log4jdbc:jtds:") ? (!rawUrl.startsWith("jdbc:fake:") && !rawUrl.startsWith("jdbc:mock:") ? (!rawUrl.startsWith("jdbc:postgresql:") && !rawUrl.startsWith("jdbc:log4jdbc:postgresql:") ? (rawUrl.startsWith("jdbc:edb:") ? "edb" : (!rawUrl.startsWith("jdbc:hsqldb:") && !rawUrl.startsWith("jdbc:log4jdbc:hsqldb:") ? (rawUrl.startsWith("jdbc:odps:") ? "odps" : (rawUrl.startsWith("jdbc:db2:") ? "db2" : (rawUrl.startsWith("jdbc:sqlite:") ? "sqlite" : (rawUrl.startsWith("jdbc:ingres:") ? "ingres" : (!rawUrl.startsWith("jdbc:h2:") && !rawUrl.startsWith("jdbc:log4jdbc:h2:") ? (rawUrl.startsWith("jdbc:mckoi:") ? "mckoi" : (rawUrl.startsWith("jdbc:cloudscape:") ? "cloudscape" : (!rawUrl.startsWith("jdbc:informix-sqli:") && !rawUrl.startsWith("jdbc:log4jdbc:informix-sqli:") ? (rawUrl.startsWith("jdbc:timesten:") ? "timesten" : (rawUrl.startsWith("jdbc:as400:") ? "as400" : (rawUrl.startsWith("jdbc:sapdb:") ? "sapdb" : (rawUrl.startsWith("jdbc:JSQLConnect:") ? "JSQLConnect" : (rawUrl.startsWith("jdbc:JTurbo:") ? "JTurbo" : (rawUrl.startsWith("jdbc:firebirdsql:") ? "firebirdsql" : (rawUrl.startsWith("jdbc:interbase:") ? "interbase" : (rawUrl.startsWith("jdbc:pointbase:") ? "pointbase" : (rawUrl.startsWith("jdbc:edbc:") ? "edbc" : (rawUrl.startsWith("jdbc:mimer:multi1:") ? "mimer" : (rawUrl.startsWith("jdbc:dm:") ? "dm" : (rawUrl.startsWith("jdbc:kingbase:") ? "kingbase" : (rawUrl.startsWith("jdbc:log4jdbc:") ? "log4jdbc" : (rawUrl.startsWith("jdbc:hive:") ? "hive" : (rawUrl.startsWith("jdbc:hive2:") ? "hive" : (rawUrl.startsWith("jdbc:phoenix:") ? "phoenix" : null)))))))))))))))) : "informix"))) : "h2"))))) : "hsql")) : "postgresql") : "mock") : "jtds") : "sybase") : "sqlserver") : "sqlserver")) : "oracle")) : "mysql") : "derby");
    }

    /**
     * 获取工程路径
     * @return
     */
    public static String getProjectPath(){
        // 如果配置了工程路径，则直接返回，否则自动获取。
        String projectPath = Global.getConfig("projectPath");
        if (StringUtils.isNotBlank(projectPath)){
            return projectPath;
        }
        try {
            File file = new DefaultResourceLoader().getResource("").getFile();
            if (file != null){
                while(true){
                    File f = new File(file.getPath() + File.separator + "src" + File.separator + "main");
                    if (f == null || f.exists()){
                        break;
                    }
                    if (file.getParentFile() != null){
                        file = file.getParentFile();
                    }else{
                        break;
                    }
                }
                projectPath = file.toString();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return projectPath;
    }

    public static void main(String[] args) {
        Map<String, String> map = Global.getDatasourceKeyAndName();
        Set<String> keySet = map.keySet();
        Iterator<String> it = keySet.iterator();
        while (it.hasNext()) {
            String key = it.next();
            System.out.println(key + "=" + map.get(key));
        }
    }

}
