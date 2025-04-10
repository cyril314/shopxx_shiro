package com.fit.web.admin;

import java.math.BigDecimal;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.fit.base.BaseController;
import com.fit.config.freemarker.Page;
import com.fit.base.R;
import com.fit.config.shiro.I18nMessage;
import com.fit.entity.Member;
import com.fit.entity.SysSetting;
import com.fit.service.*;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/member")
public class MemberController extends BaseController {

    @Autowired
    private I18nMessage shiroMessage;
    @Autowired
    private SysSettingService sysSettingService;
    @Autowired
    private MemberService memberService;
    @Autowired
    private MemberRankService memberRankService;
    @Autowired
    private MemberAttributeService memberAttributeService;
    @Autowired
    private AreaService areaService;
    @Autowired
    private SysAdminService adminService;

    private Boolean usernameDisabled(String username) {
        Assert.hasText(username);
        SysSetting setting = new SysSetting();
        setting.setKey("disabledUsername");
        setting = sysSettingService.get(setting);
        String[] split = setting.getCode().split(",");
        for (String s : split) {
            if (s.toLowerCase().contains(username.toLowerCase())) {
                return true;
            }
        }
        return false;
    }

    /**
     * 检查用户名是否被禁用或已存在
     */
    @RequestMapping(value = "/check_username", method = RequestMethod.GET)
    @ResponseBody
    public boolean checkUsername(String username) {
        if (Strings.isEmpty(username)) {
            return false;
        }
        Map<String, Object> param = new HashMap<>();
        param.put("username", username);
        int count = memberService.findCount(param);
        if (usernameDisabled(username) || count < 1) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * 检查E-mail是否唯一
     */
    @RequestMapping(value = "/check_email", method = RequestMethod.GET)
    @ResponseBody
    public boolean checkEmail(String previousEmail, String email) {
        if (Strings.isEmpty(email)) {
            return false;
        }

        if (equalsIgnoreCase(previousEmail, email)) {
            return true;
        } else {
            Map<String, Object> param = new HashMap<>();
            param.put("email", email);
            int count = memberService.findCount(param);
            if (count > 0) {
                return false;
            } else {
                return true;
            }
        }
    }

    /**
     * 查看
     */
    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String view(HttpServletRequest request, Long id) {
        request.setAttribute("genders", Gender.values());
        request.setAttribute("memberAttributes", memberAttributeService.findList());
        request.setAttribute("member", memberService.get(id));
        return "/admin/member/view";
    }

    /**
     * 添加
     */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(HttpServletRequest request) {
        request.setAttribute("genders", Gender.values());
        request.setAttribute("memberRanks", memberRankService.findList());
        request.setAttribute("memberAttributes", memberAttributeService.findList());
        return "/admin/member/add";
    }

    /**
     * 编辑
     */
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(HttpServletRequest request, Long id) {
        request.setAttribute("genders", Gender.values());
        request.setAttribute("memberRanks", memberRankService.findList());
        request.setAttribute("memberAttributes", memberAttributeService.findList());
        request.setAttribute("member", memberService.get(id));
        return "/admin/member/edit";
    }

    /**
     * 列表
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(HttpServletRequest request) {
        Map<String, Object> params = getRequestParamsMap(request);
        request.setAttribute("memberRanks", memberRankService.findList());
        request.setAttribute("memberAttributes", memberAttributeService.findList());
        request.setAttribute("page", new Page(memberService.findList(params)));
        return "/admin/member/list";
    }

    /**
     * 删除
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public R delete(Long[] ids) {
        if (ids != null) {
            for (Long id : ids) {
                Member member = memberService.get(id);
                if (member != null && member.getBalance().compareTo(new BigDecimal(0)) > 0) {
                    return R.error(shiroMessage.getMessage("admin.member.deleteExistDepositNotAllowed", member.getUsername()));
                }
            }
            memberService.batchDelete(ids);
        }
        return R.success();
    }

}