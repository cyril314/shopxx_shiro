package com.fit.config.shiro;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.util.StringUtils;

/**
 * 权限工具类
 */
public class ShiroKit {

    public static final String SESSION_USERNAME = "SESSION_USERNAME";                       //用户名
    public static final String SESSION_U_NAME = "SESSION_U_NAME";                   //用户姓名
    public static final String SESSION_ROLE = "SESSION_ROLE";                       //主职角色信息
    public static final String SESSION_R_NUMBERS = "R_NUMBERS";                     //角色编码数组
    public static final String SHIRO_SET = "_SHIRO_SET";                     //角色编码数组

    /**
     * 获取当前 Subject
     */
    public static Subject getSubject() {
        return SecurityUtils.getSubject();
    }

    public static Boolean hasRole(String role) {
        return getSubject().hasRole(role);
    }

    /**
     * 判断用户是否已登录
     */
    public static Boolean isLogin() {
        try {
            return getSubject().isAuthenticated();
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * shiro管理的session
     */
    public static Session getSession() {
        return SecurityUtils.getSubject().getSession();
    }

    public static void delUsername() {
        getSession().removeAttribute(SESSION_USERNAME);
    }

    public static void setUsername(String username) {
        Object obj = getSession().getAttribute(SESSION_USERNAME);
        if (StringUtils.isEmpty(obj)) {
            getSession().setAttribute(SESSION_USERNAME, username);
        }
    }

    /**
     * 获取当前登录的用户名
     */
    public static String getUsername() {
        Object obj = getSession().getAttribute(SESSION_USERNAME);
        if (StringUtils.isEmpty(obj)) {
            return null;
        } else {
            return obj.toString();
        }
    }

    /**
     * 获取当前登录的姓名
     */
    public static String getName() {
        return getSession().getAttribute(SESSION_U_NAME).toString();
    }

    /**
     * 获取当前登录用户的角色编码
     */
    public static String getRNumbers() {
        Object obj = getSession().getAttribute(SESSION_R_NUMBERS);
        if (StringUtils.isEmpty(obj)) {
            return null;
        } else {
            return obj.toString();
        }
    }
}
