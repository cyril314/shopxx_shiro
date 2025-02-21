package com.fit.base;

import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @AUTO 控制层基类
 * @FILE BaseController.java
 * @DATE 2018-3-23 下午2:38:18
 * @Author AIM
 */
@Slf4j
public class BaseController extends BaseCommon {

    public static final String PRINCIPAL_ATTRIBUTE_NAME = "MEMBER.PRINCIPAL";

    /**
     * 将json数据写到客户端
     */
    protected void writeJson(HttpServletResponse response, Object obj) {
        try {
            response.setContentType("text/html;charset=UTF-8");
            response.setHeader("Cache-Control", "no-cache");
            response.getWriter().write(toJSONString(obj));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected String toJSONString(Object obj) {
        return JSONObject.toJSONString(obj);
    }

    /**
     * 将数据保存到session
     *
     * @param key   存入session键名
     * @param value 存入session值
     */
    protected void setValue2Session(HttpServletRequest res, String key, Object value) {
        res.getSession().setAttribute(key, value);
    }

    /**
     * 从session中获取数据
     *
     * @param key 取出session键名
     */
    protected Object getValueFromSession(HttpServletRequest res, String key) {
        return res.getSession().getAttribute(key);
    }

    /**
     * 将数据从session中删除
     *
     * @param key 删除session键名
     */
    protected void removeValueFromSession(HttpServletRequest res, String key) {
        res.getSession().removeAttribute(key);
    }

    /**
     * 获取请求的所有参数,返回值Map
     */
    protected Map<String, Object> getRequestParamsMap(HttpServletRequest request) {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        try {
            // 参数Map
            Map<String, String[]> properties = request.getParameterMap();
            String value = "";
            for (String strKey : properties.keySet()) {
                Object strObj = properties.get(strKey);
                if (null == strObj) {
                    value = "";
                } else if (strObj instanceof String[]) {
                    String[] values = (String[]) strObj;
                    for (int i = 0; i < values.length; i++) { // 用于请求参数中有多个相同名称
                        value = values[i] + ",";
                    }
                    value = value.substring(0, value.length() - 1);
                } else {
                    value = strObj.toString();// 用于请求参数中请求参数名唯一
                }
                returnMap.put(strKey.toString(), value);
            }
        } catch (Exception e) {
            log.error("getRequestParamsMap错误信息：{}", e);
        }
        return returnMap;
    }

    protected boolean isMobileDevice(HttpServletRequest request) {
        String userAgent = request.getHeader("User-Agent");
        return userAgent != null && (userAgent.contains("Mobi") || userAgent.contains("Android") || userAgent.contains("iPhone"));
    }

    public static String getBaseUrl(HttpServletRequest request) {
        return ServletUriComponentsBuilder.fromRequestUri(request).replacePath(null) // 去掉路径部分
                .build().toUriString(); // 构建完整主机地址
    }

    public String toFront(String url) {
        return String.format("/front/%s", url);
    }

    public String toAdmin(String url) {
        return String.format("/admin/%s", url);
    }

    public enum Method {
        /**自动组卷 auto,*/
        /**
         * 手动组卷
         */
        manual;
    }

    public enum Type {
        /**
         * 单选
         **/
        singleChoice,
        /**
         * 多选
         **/
        multiChoice,
        /**
         * 判断
         **/
        judge;
    }

    /**
     * 性别
     */
    public enum Gender {

        /**
         * 男
         */
        male,

        /**
         * 女
         */
        female
    }
}
