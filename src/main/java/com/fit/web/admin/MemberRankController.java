package com.fit.web.admin;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import com.fit.base.BaseController;
import com.fit.base.R;
import com.fit.config.freemarker.Page;
import com.fit.config.shiro.I18nMessage;
import com.fit.entity.MemberRank;
import com.fit.service.MemberRankService;
import com.fit.service.MemberService;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Controller - 会员等级
 */
@Controller("adminMemberRankController")
@RequestMapping("/admin/member_rank")
public class MemberRankController extends BaseController {

    @Autowired
    private I18nMessage shiroMessage;
    @Autowired
    private MemberService memberService;
    @Autowired
    private MemberRankService memberRankService;

    /**
     * 检查名称是否唯一
     */
    @RequestMapping(value = "/check_name", method = RequestMethod.GET)
    @ResponseBody
    public boolean checkName(String previousName, String name) {
        if (Strings.isEmpty(name)) {
            return false;
        }

        if (equalsIgnoreCase(previousName, name)) {
            return true;
        } else {
            Map<String, Object> param = new HashMap<>();
            param.put("name", name);
            int count = memberRankService.findCount(param);
            if (count > 0) {
                return false;
            } else {
                return true;
            }
        }
    }

    /**
     * 检查消费金额是否唯一
     */
    @RequestMapping(value = "/check_amount", method = RequestMethod.GET)
    @ResponseBody
    public boolean checkAmount(BigDecimal previousAmount, BigDecimal amount) {
        if (amount == null) {
            return false;
        }
        if (previousAmount != null && previousAmount.compareTo(amount) == 0) {
            return true;
        } else {
            Map<String, Object> param = new HashMap<>();
            param.put("amount", amount);
            int count = memberRankService.findCount(param);
            if (count > 0) {
                return false;
            } else {
                return true;
            }
        }
    }

    /**
     * 添加
     */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(ModelMap model) {
        return "/admin/member_rank/add";
    }


    /**
     * 编辑
     */
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(HttpServletRequest request, Long id) {
        request.setAttribute("memberRank", memberRankService.get(id));
        return "/admin/member_rank/edit";
    }

    /**
     * 列表
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(HttpServletRequest request) {
        Map<String, Object> params = getRequestParamsMap(request);
        request.setAttribute("page", new Page(memberRankService.findList(params)));
        return "/admin/member_rank/list";
    }

    /**
     * 删除
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public R delete(Long[] ids) {
        if (ids != null) {
            for (Long id : ids) {
                Map<String, Object> param = new HashMap<>();
                param.put("memberRank", id);
                int count = memberService.findCount(param);
                if (count > 0) {
                    MemberRank memberRank = memberRankService.get(id);
                    return R.error(shiroMessage.getMessage("admin.memberRank.deleteExistNotAllowed", memberRank.getName()));
                }
            }
            long totalCount = memberRankService.findCount();
            if (ids.length >= totalCount) {
                return R.error(shiroMessage.getMessage("admin.common.deleteAllNotAllowed"));
            }
            memberRankService.batchDelete(ids);
        }
        return R.success();
    }

}