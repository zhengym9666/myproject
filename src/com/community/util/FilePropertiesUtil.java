package com.community.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;


public class FilePropertiesUtil {
    private static final Logger LOG = LoggerFactory.getLogger(FilePropertiesUtil.class);
    private static final HashMap<String, String> dataMap = new HashMap<>();

    static {
        try {
            Properties p = new Properties();
            p.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("admin/admin.properties"));
            if (!p.isEmpty()) {
                for (String key : p.stringPropertyNames()) {
                    dataMap.put(key, p.getProperty(key));
                }
            }
        } catch (Throwable var12) {
            LOG.warn("FilePropertiesUtil init fail ", var12);
        }
    }

    public static Object get(Object key) {
        return dataMap.get(key);
    }


    public static String getString(String key) {
        return (String) get(key);
    }

    public static String getString(String key, String def) {
        return dataMap.containsKey(key) ? dataMap.get(key) : def;
    }


    public static Map<String, String> getMap(String codeType) {
        Map<String, String> rt = new HashMap<>();
        for (Map.Entry<String, String> entry : dataMap.entrySet()) {
            if (entry.getKey().startsWith(codeType)) {
                String subKey = entry.getKey().substring(codeType.length());
                rt.put(subKey, entry.getValue());
            }
        }
        return rt;
    }

    public static void main(String[] args) {
        String project_name = getString("project_name");
        System.out.println(project_name);
    }
}
