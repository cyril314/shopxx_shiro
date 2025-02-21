package com.fit.web.admin;

import com.fit.base.BaseController;
import com.fit.base.R;
import com.fit.config.shiro.ShiroKit;
import com.fit.entity.SysSetting;
import com.fit.service.MemberService;
import com.fit.service.MessageService;
import com.fit.service.SysSettingService;
import com.fit.util.RSAUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.logging.log4j.util.Strings;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.Assert;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.security.KeyPair;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.util.HashMap;
import java.util.Map;

/**
 * @AUTO
 * @Author AIM
 * @DATE 2025/1/14
 */
@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController extends BaseController {

    private static final String PRIVATE_KEY_ATTRIBUTE_NAME = "privateKey";

    @Autowired
    private SysSettingService sysSettingService;
    @Autowired
    private MemberService memberService;
    @Autowired
    private MessageService messageService;

    @RequestMapping(value = "/logout")
    public String logout() {
        SecurityUtils.getSubject().logout();
        ShiroKit.delUsername();
        return toAdmin("login");
    }

    @RequestMapping(value = {"/login", "/login.do"}, method = RequestMethod.GET)
    public String login(HttpServletRequest request, String redirectUrl) {
        if (Strings.isEmpty(redirectUrl)) {
            redirectUrl = toAdmin("index");
        }
        request.setAttribute("redirectUrl", redirectUrl);
        return toAdmin("login");
    }

    @RequestMapping(value = {"/login_submit", "/login_submit.do"}, method = RequestMethod.POST)
    @ResponseBody
    public void login_submit(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        R data = R.error("登录失败");
        Map<String, Object> map = getRequestParamsMap(request);
        String username = map.get("username").toString().trim();
        String text = map.get("password").toString().trim();
        RSAPrivateKey privateKey = (RSAPrivateKey) session.getAttribute(PRIVATE_KEY_ATTRIBUTE_NAME);
        String password = RSAUtils.decrypt(privateKey, text);
        session.removeAttribute(PRIVATE_KEY_ATTRIBUTE_NAME);
        // 获取shiro中用户信息
        Subject currentUser = ShiroKit.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username, password.toCharArray());
        try {
            // 执行shiro登录操作
            currentUser.login(token);
            if (currentUser.isAuthenticated()) {
                ShiroKit.setUsername(username);
                data = R.success("登录成功");
            } else {
                token.clear();
            }
        } catch (UnknownAccountException e) {
            data = R.error("用户名不存在");
        } catch (IncorrectCredentialsException e) {
            data = R.error("密码错误");
        } catch (LockedAccountException e) {
            data = R.error("账户已锁定");
        } catch (AuthenticationException e) {
            data = R.error("认证失败,请检查用户密码!");
        } catch (Exception e) {
            data = R.error("登录失败,未知错误");
        } finally {
            writeJson(response, data);
        }
    }

    /**
     * 公钥
     */
    @RequestMapping(value = "/login_key", method = RequestMethod.GET)
    @ResponseBody
    public void publicKey(HttpServletRequest request, HttpServletResponse response) {
        Assert.notNull(request);
        KeyPair keyPair = RSAUtils.generateKeyPair();
        RSAPublicKey publicKey = (RSAPublicKey) keyPair.getPublic();
        RSAPrivateKey privateKey = (RSAPrivateKey) keyPair.getPrivate();
        request.getSession().setAttribute(PRIVATE_KEY_ATTRIBUTE_NAME, privateKey);
        Map<String, String> data = new HashMap<String, String>();
        data.put("modulus", Base64.encodeBase64String(publicKey.getModulus().toByteArray()));
        data.put("exponent", Base64.encodeBase64String(publicKey.getPublicExponent().toByteArray()));
        writeJson(response, data);
    }

    @RequestMapping({"", "/", "/index", "/index.do"})
    public String index() {
        if (ShiroKit.isLogin()) {
            log.debug(ShiroKit.getUsername());
        }
        return toAdmin("admin");
    }

    @RequestMapping("/home")
    public String home(HttpServletRequest req) {
        ServletContext servletContext = req.getServletContext();
        SysSetting site = sysSettingService.get(Long.parseLong("2"));
        req.setAttribute("systemName", site.getCode());
        Map<String, Object> params = new HashMap<>();
        params.put("isEnabled", 1);
        req.setAttribute("memberCount", memberService.findCount(params));
        params.clear();
        params.put("senderRead", 0);
        params.put("receiverRead", 0);
        req.setAttribute("unreadMessageCount", messageService.findCount(params));
        req.setAttribute("osName", System.getProperty("os.name"));
        req.setAttribute("javaVersion", System.getProperty("java.version"));
        req.setAttribute("javaHome", System.getProperty("java.home"));
        req.setAttribute("serverInfo", servletContext.getServerInfo());
        req.setAttribute("servletVersion", servletContext.getMajorVersion() + "." + servletContext.getMinorVersion());
        return toAdmin("home");
    }
}
