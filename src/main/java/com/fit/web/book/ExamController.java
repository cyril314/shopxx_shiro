package com.fit.web.book;

import com.fit.base.BaseController;
import com.fit.config.shiro.ShiroKit;
import com.fit.entity.Exam;
import com.fit.entity.ExamAnswerSheet;
import com.fit.entity.Member;
import com.fit.service.ExamAnswerSheetService;
import com.fit.service.ExamService;
import com.fit.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.Date;
import java.util.Map;

@Controller("bookExamController")
@RequestMapping("/book/exam")
public class ExamController extends BaseController {
    @Autowired
    private MemberService memberService;
    @Autowired
    private ExamService examService;
    @Autowired
    private ExamAnswerSheetService answerSheetService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(HttpServletRequest request) {
        init(request);
        request.setAttribute("recentExams", examService.findList());
        return "/book/exam/index";
    }

    @RequestMapping(value = "/examing", method = RequestMethod.GET)
    public String examing(Long id, HttpServletRequest request) {
        Map<String, Object> params = getRequestParamsMap(request);
        Long memberId = init(request);
        Exam exam = examService.get(id);
        request.setAttribute("exam", exam);

        /**
         * 获取答题卡对象
         * 需要先判断是否已在考试中，即已存在答题卡对象
         * 如果不存在，新增
         * 如果存在，把答题卡读取出来
         */
        ExamAnswerSheet answerSheet = new ExamAnswerSheet();
        params.put("member", memberId);
        int count = this.answerSheetService.findCount(params);
        if (count == 0) {
            answerSheet.setExam(id);
            answerSheet.setMember(memberId);
            answerSheet.setStartDate(new Date());

            this.answerSheetService.save(answerSheet);
        } else {

        }
        request.setAttribute("answerSheet", answerSheet);

        return "/book/exam/examing";
    }

    /**
     * 初始化基本信息
     *
     * @param @param model    设定文件
     * @return void    返回类型
     * @throws
     * @Title: init
     */
    private Long init(HttpServletRequest request) {
        Member member = null;
        Principal principal = (Principal) request.getSession().getAttribute(PRINCIPAL_ATTRIBUTE_NAME);
        if (principal != null) {
            member = new Member();
            member.setUsername(ShiroKit.getUsername());
            member = memberService.get(member);
        }
        request.setAttribute("current", member);
        request.setAttribute("current_index", 3);
        return member == null ? null : member.getId();
    }
}
