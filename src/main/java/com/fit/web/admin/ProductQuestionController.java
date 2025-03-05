package com.fit.web.admin;

import javax.servlet.http.HttpServletRequest;

import com.fit.base.BaseController;
import com.fit.base.R;
import com.fit.config.freemarker.Page;
import com.fit.config.shiro.ShiroMessage;
import com.fit.entity.ProductQuestion;
import com.fit.service.ProductCategoryService;
import com.fit.service.ProductQuestionOptionService;
import com.fit.service.ProductQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;


@Controller("adminQuestionContorller")
@RequestMapping("/admin/question")
public class ProductQuestionController extends BaseController {

    @Autowired
    private ShiroMessage shiroMessage;
    @Autowired
    private ProductQuestionService questionService;
    @Autowired
    private ProductCategoryService productCategoryService;
    @Autowired
    private ProductQuestionOptionService optionService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(HttpServletRequest request) {
        Map<String, Object> params = getRequestParamsMap(request);
        request.setAttribute("page", new Page(questionService.findList(params)));
        return "/admin/question/list";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(HttpServletRequest request) {
        request.setAttribute("productCategoryTree", productCategoryService.findList());
        request.setAttribute("questionTypes", Type.values());
        return "/admin/question/add";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(Long id, HttpServletRequest request) {
        request.setAttribute("productCategoryTree", productCategoryService.findList());
        request.setAttribute("questionTypes", Type.values());

        ProductQuestion question = questionService.get(id);
        request.setAttribute("question", question);
        return "/admin/question/edit";
    }

    @RequestMapping(value = "/deleteOption", method = RequestMethod.POST)
    @ResponseBody
    public R deleteOption(Long id) {
        optionService.delete(id);
        return R.success();
    }

    /**
     * 删除
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public R delete(Long[] ids) {
        if (ids.length >= questionService.findCount()) {
            return R.error(shiroMessage.getMessage("admin.common.deleteAllNotAllowed"));
        }
        questionService.batchDelete(ids);
        return R.success();
    }
}