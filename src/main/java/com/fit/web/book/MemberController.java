package com.fit.web.book;

import com.fit.base.BaseController;
import com.fit.config.shiro.ShiroKit;
import com.fit.entity.Member;
import com.fit.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;

@Controller("bookMemberController")
@RequestMapping("/book/member")
public class MemberController extends BaseController {
    @Autowired
    private MemberService memberService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(HttpServletRequest request) {
        Member member = null;
        Principal principal = (Principal) request.getSession().getAttribute(PRINCIPAL_ATTRIBUTE_NAME);
        if (principal != null) {
            member = new Member();
            member.setUsername(ShiroKit.getUsername());
            member = memberService.get(member);
        }
        request.setAttribute("current", member);
        request.setAttribute("current_index", 4);
        return "/book/member/index";
    }
}
