package com.fit.web.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import com.fit.base.BaseController;
import com.fit.config.freemarker.Page;
import com.fit.service.ExamService;
import com.fit.service.PaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

@Controller("adminExamController")
@RequestMapping("/admin/exam")
public class ExamController extends BaseController {

    @Autowired
    private ExamService examService;
    @Autowired
    private PaperService paperService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(HttpServletRequest request) {
        Map<String, Object> params = getRequestParamsMap(request);
        request.setAttribute("page", new Page(examService.findList(params)));
        return "/admin/exam/list";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(HttpServletRequest request) {
        request.setAttribute("papers", paperService.findList());
        return "/admin/exam/add";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(Long id, ModelMap model) {
        model.addAttribute("papers", paperService.findList());
        model.addAttribute("exam", examService.get(id));
        return "/admin/exam/edit";
    }
}
