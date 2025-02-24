package com.fit.web;

import com.fit.base.BaseController;
import com.fit.config.shiro.ShiroKit;
import com.fit.entity.Member;
import com.fit.service.MemberService;
import com.fit.util.BeanUtils;
import org.apache.logging.log4j.util.Strings;
import org.apache.shiro.util.Assert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.Map;

/**
 * @AUTO
 * @Author AIM
 * @DATE 2025/1/14
 */
@Controller
public class IndexController extends BaseController {

    @Autowired
    private MemberService memberService;

    @RequestMapping({"", "/index", "/index.do"})
    public String index(HttpServletRequest request) {
        //获取当前登录会员
        Member member = null;
        Principal principal = (Principal) request.getSession().getAttribute(PRINCIPAL_ATTRIBUTE_NAME);
        if (principal != null) {
            member = new Member();
            member.setUsername(ShiroKit.getUsername());
            member = memberService.get(member);
        }
        request.setAttribute("current", member);
        request.setAttribute("current_index", 1);
        request.setAttribute("base", getBaseUrl(request));
        return "/index";
    }

    @RequestMapping("/login")
    public String login(HttpServletRequest request, String redirectUrl) {
        if (Strings.isEmpty(redirectUrl)) {
            redirectUrl = "/index";
        }
        request.setAttribute("redirectUrl", redirectUrl);
        request.setAttribute("current_index", 1);
        request.setAttribute("base", getBaseUrl(request));
        return "/login";
    }

    @RequestMapping({"/register", "/user-register"})
    public String register(HttpServletRequest request, String redirectUrl) {
        if (Strings.isEmpty(redirectUrl)) {
            redirectUrl = "/index";
        }
        request.setAttribute("redirectUrl", redirectUrl);
        request.setAttribute("current_index", 1);
        request.setAttribute("base", getBaseUrl(request));
        return "/register";
    }

    /**
     * 注册
     */
    @RequestMapping(value = "/reg_submit", method = RequestMethod.POST)
    public String reg_submit(HttpServletRequest request) {
        Assert.notNull(request);
        Map<String, Object> param = getRequestParamsMap(request);
        Member member = BeanUtils.map2Bean(Member.class, param);
        param.remove("password");
        int count = this.memberService.findCount(param);
        if (count > 0) {
            request.setAttribute("message", "注册用户已存在!");
            return "/register";
        } else {
            this.memberService.get(member);
        }

        return "/login";
    }
}
