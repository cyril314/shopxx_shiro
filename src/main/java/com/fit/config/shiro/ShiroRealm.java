package com.fit.config.shiro;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.*;

/**
 * Shiro身份认证
 */
public class ShiroRealm extends AuthorizingRealm {

    public static final String SHIRO_SET = "%s_SHIRO_SET";
    private String ADMIN_SQL = "SELECT `username`,`password` FROM `sys_admin` WHERE `username`=?";
    private String RES_SQL = "SELECT c.`value` FROM `sys_resource` c LEFT JOIN `sys_role_resource` r ON c.`id`=r.`resource_id` LEFT JOIN " + "`sys_admin` a ON r.`role_id`=a.`role_id` WHERE a.`username`=?";

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public ShiroRealm() {
        HashedCredentialsMatcher matcher = new HashedCredentialsMatcher();
        matcher.setHashAlgorithmName("MD5"); // 使用 MD5 加密算法
        matcher.setHashIterations(1); // 设置 MD5 迭代次数，增加加密强度
        this.setCredentialsMatcher(matcher);
    }

    /**
     * 登录认证,登录信息和用户验证信息验证
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) {
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        Map<String, Object> pd = jdbcTemplate.queryForMap(ADMIN_SQL, token.getUsername());
        if (pd == null) {
            return null;
        }
        return new SimpleAuthenticationInfo(pd.get("USERNAME").toString(), pd.get("PASSWORD").toString(), getName());
    }

    /*
     * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用,负责在应用程序中决定用户的访问控制的方法
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String USERNAME = (String) super.getAvailablePrincipal(principals);
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        Session session = ShiroKit.getSession();
        Collection<String> shiroSet = (Collection<String>) session.getAttribute(String.format(SHIRO_SET, USERNAME));
        if (null == shiroSet) {
            shiroSet = jdbcTemplate.queryForList(RES_SQL, String.class, USERNAME);
            session.setAttribute(String.format(SHIRO_SET, USERNAME), shiroSet);
        }
        info.addStringPermissions(shiroSet);
        return info;
    }
}
