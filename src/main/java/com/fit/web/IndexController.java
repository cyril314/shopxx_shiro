package com.fit.web;

import com.fit.base.BaseController;
import com.fit.config.shiro.ShiroKit;
import com.fit.entity.Member;
import com.fit.entity.SysAdmin;
import com.fit.service.MemberService;
import com.fit.service.SysAdminService;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;

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
}
