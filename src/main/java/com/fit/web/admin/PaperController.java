package com.fit.web.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fit.base.BaseController;
import com.fit.base.R;
import com.fit.config.freemarker.Page;
import com.fit.config.freemarker.util.FreemarkerUtils;
import com.fit.entity.Paper;
import com.fit.entity.PaperQuestion;
import com.fit.entity.ProductCategory;
import com.fit.entity.ProductQuestion;
import com.fit.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import freemarker.template.TemplateException;

import javax.servlet.http.HttpServletRequest;

@Controller("paperController")
@RequestMapping("/admin/paper")
public class PaperController extends BaseController {

    @Autowired
    private PaperService paperService;
    @Autowired
    private ProductCategoryService productCategoryService;
    @Autowired
    private ProductQuestionService questionService;
    @Autowired
    private PaperDistributionService distributionService;

    @Autowired
    private PaperQuestionService paperQuestionService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(HttpServletRequest request) {
        Map<String, Object> params = getRequestParamsMap(request);
        request.setAttribute("page", new Page(paperService.findList(params)));
        return "/admin/paper/list";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(HttpServletRequest request) {
        request.setAttribute("methods", Method.values());
        request.setAttribute("types", Type.values());
        Map<String, Object> params = getRequestParamsMap(request);
        params.put("parent", 0);
        request.setAttribute("rootCategorys", productCategoryService.findList(params));
        return "/admin/paper/add";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(Long id, HttpServletRequest request) {
        request.setAttribute("methods", Method.values());
        request.setAttribute("types", Type.values());
        Map<String, Object> params = new HashMap<>();
        params.put("parent", 0);
        request.setAttribute("rootCategorys", productCategoryService.findList(params));
        request.setAttribute("paper", paperService.get(id));
        return "/admin/paper/edit";
    }

    @RequestMapping(value = "/question", method = RequestMethod.GET)
    public String question(Long id, HttpServletRequest request) {
        request.setAttribute("paper", paperService.get(id));
        return "/admin/paper/question";
    }

    @RequestMapping(value = "/choice", method = RequestMethod.GET)
    public String choice(HttpServletRequest request) {
        Map<String, Object> param = getRequestParamsMap(request);
        //pageable.setPageSize(2);
        ProductCategory rootCategory = productCategoryService.get(Long.parseLong(param.get("rootCateId").toString()));
        ProductCategory category = productCategoryService.get(Long.parseLong(param.get("categoryId").toString()));
        Map<String, Object> params = new HashMap<>();
        params.put("parent", 0);
        List<ProductCategory> rootCategorys = productCategoryService.findList(params);
        List<ProductCategory> categorys = new ArrayList<ProductCategory>();

        if (rootCategory == null) {
            for (ProductCategory cate : rootCategorys) {
                params.clear();
                params.put("parent", cate.getId());
                categorys.addAll(productCategoryService.findList(params));
            }
        } else {
            params.clear();
            params.put("parent", rootCategory.getId());
            categorys.addAll(productCategoryService.findList(params));
        }

        request.setAttribute("rootCategory", rootCategory);
        request.setAttribute("category", category);
        request.setAttribute("categorys", categorys);
        request.setAttribute("type", param.get("type"));
        request.setAttribute("rootCategorys", rootCategorys);
        request.setAttribute("questionTypes", Type.values());

        request.setAttribute("page", new Page(questionService.findList(param)));

        return "/admin/paper/dialog";
    }

    @RequestMapping(value = "/addQuestions", method = RequestMethod.POST)
    @ResponseBody
    public R addQuestions(String idStr) {
        List<ProductQuestion> questions = new ArrayList<ProductQuestion>();
        if (idStr != null) {
            if (idStr.endsWith("|")) {
                idStr = idStr.substring(0, idStr.length() - 1);
            }
            String[] ids = idStr.split("\\|");
            for (String id : ids) {
                questions.add(questionService.get(Long.parseLong(id)));
            }
        }

        String html = "";
        Map<String, ProductQuestion> map = new HashMap<String, ProductQuestion>();
        for (ProductQuestion question : questions) {
            map.put("question", question);
            try {
                html += FreemarkerUtils.processFtl("/admin/include/add_question.ftl", map);
            } catch (IOException e) {
                e.printStackTrace();
            } catch (TemplateException e) {
                e.printStackTrace();
            }
        }

        return R.success(html);
    }

    @RequestMapping(value = "/savePaperQuestion", method = RequestMethod.POST)
    @ResponseBody
    public R savePaperQuestion(@RequestBody Map<String, String> map) {
        if (map == null || !map.containsKey("paperId")) {
            return R.error("data error");
        }

        Long paperId = Long.parseLong(map.get("paperId"));
        Paper paper = paperService.get(paperId);
        paperQuestionService.delete(paper.getId());

        for (String str : map.keySet()) {
            if (!str.equals("paperId")) {
                PaperQuestion paperQuestion = new PaperQuestion();
                paperQuestion.setPaper(paper.getId());
                paperQuestion.setQuestion(Long.parseLong(str));
                paperQuestion.setMark(Integer.parseInt(map.get(str)));

                paperQuestionService.save(paperQuestion);
            }
        }

        return R.success("success");
    }
}
