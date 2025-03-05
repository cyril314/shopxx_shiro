package com.fit.web.book;

import java.security.Principal;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.fit.base.BaseController;
import com.fit.base.R;
import com.fit.config.shiro.ShiroKit;
import com.fit.entity.Member;
import com.fit.entity.MemberQuestion;
import com.fit.entity.ProductCategory;
import com.fit.entity.ProductQuestion;
import com.fit.service.MemberQuestionService;
import com.fit.service.MemberService;
import com.fit.service.ProductCategoryService;
import com.fit.service.ProductQuestionService;
import com.fit.service.mark.MarkingService;
import com.fit.util.BeanUtils;
import com.fit.util.SpringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 练习Controller
 */
@Controller("bookPracticeController")
@RequestMapping("/book/practice")
public class PracticeController extends BaseController {

    @Autowired
    private ProductCategoryService productCategoryService;
    @Autowired
    private MemberService memberService;
    @Autowired
    private ProductQuestionService questionService;
    @Autowired
    private MemberQuestionService myQuestionService;
    @Autowired
    private JdbcTemplate jdbcTemplate;
    private String mq = "SELECT COUNT(*) FROM `member_question` m LEFT JOIN `product_question` q ON m.`question`=q.`id` WHERE m.`member`=?";
    private String wq = "SELECT COUNT(0) FROM `product_question` q LEFT JOIN `member_question` m ON q.`id`=m.`question` WHERE m.`member`=?";
    private static Map<Type, String> markingServiceMap = new HashMap<Type, String>();

    static {
        markingServiceMap.put(Type.judge, "judgeMarkingServiceImpl");
        markingServiceMap.put(Type.multiChoice, "multiChoiceMarkingServiceImpl");
        markingServiceMap.put(Type.singleChoice, "singleChoiceMarkingServiceImpl");
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Long cateId, HttpServletRequest request) {
        Long memberId = init(request);
        Map<String, Object> param = new HashMap<>();
        param.put("parent", 0);
        List<ProductCategory> rootCategorys = productCategoryService.findList(param);
        request.setAttribute("navs", rootCategorys);
        if (rootCategorys != null && !rootCategorys.isEmpty()) {
            ProductCategory currentNav = null;
            if (cateId == null) {
                currentNav = rootCategorys.get(0);
            } else {
                currentNav = productCategoryService.get(cateId);
            }

            request.setAttribute("currentNav", currentNav);
            List<Map<String, Object>> categorys = new ArrayList<>();
            if (memberId != null) {
                param.clear();
                param.put("treePath", currentNav.getTreePath());
                List<ProductCategory> childrenCategorys = productCategoryService.findList(param);
                for (ProductCategory category : childrenCategorys) {
                    Map<String, Object> map = BeanUtils.bean2Map(category);
                    Integer count = jdbcTemplate.queryForObject(mq, Integer.class);
                    map.put("myQuestion", count);
                    Integer wcount = jdbcTemplate.queryForObject(wq, Integer.class);
                    map.put("wrongQuestion", wcount);
                    categorys.add(map);
                }
            }
            request.setAttribute("childrenCategorys", categorys);
        }

        return "/book/practice/index";
    }

    @RequestMapping(value = "/improve", method = RequestMethod.GET)
    public String improve(Long cateId, HttpServletRequest request) {
        init(request);

        ProductCategory category = productCategoryService.get(cateId);
        Map<String, Object> param = new HashMap<>();
        param.put("productCategory", category.getId());
        List<ProductQuestion> questions = questionService.findList(param);
        request.setAttribute("questions", questions);
        request.setAttribute("category", category);

        return "/book/practice/improve";
    }

    private int[] choice(int m, int n) {
        int[] arr = new int[m];

        for (int i = 0; i < arr.length; i++) {
            arr[i] = i;
        }

        int[] result = new int[n];

        for (int i = 0; i < result.length; i++) {
            int r = (int) (Math.random() * m);
            result[i] = arr[r];
            arr[r] = arr[m - 1];
            m--;
        }

        Arrays.sort(result);

        return result;
    }

    @RequestMapping(value = "/random", method = RequestMethod.GET)
    public String random(Long cateId, HttpServletRequest request) {
        init(request);

        ProductCategory category = productCategoryService.get(cateId);
        List<ProductQuestion> questions = questionService.findList();
        if (questions.size() > 20) {
            List<ProductQuestion> result = new ArrayList<ProductQuestion>();
            int[] numbers = this.choice(questions.size(), 20);
            for (int i : numbers) {
                result.add(questions.get(i));
            }
            questions.clear();
            questions.addAll(result);
        }
        request.setAttribute("questions", questions);
        request.setAttribute("category", category);

        return "/book/practice/random";
    }

    @RequestMapping(value = "/wrong", method = RequestMethod.GET)
    public String wrong(Long cateId, HttpServletRequest request) {
        Long memberId = init(request);
        ProductCategory category = productCategoryService.get(cateId);
        List<ProductQuestion> questions = null;
        if (memberId != null) {
            String qs = "SELECT q.* FROM `product_question` q LEFT JOIN `member_question` m ON q.`id`=m.`question` WHERE m.`member`=? AND m.`flag`=0";
            questions = jdbcTemplate.query(qs, new BeanPropertyRowMapper<>(ProductQuestion.class), memberId);
        }
        request.setAttribute("questions", questions);
        request.setAttribute("category", category);

        return "/book/practice/improve";
    }

    @RequestMapping(value = "/answer", method = RequestMethod.POST)
    @ResponseBody
    public R answer(String myAnswer, String answer, Long questionId, HttpServletRequest request) {
        Long memberId = init(request);
        ProductQuestion question = questionService.get(questionId);
        MarkingService markingService = (MarkingService) SpringUtils.getBean(markingServiceMap.get(question.getType()));
        boolean isAnswer = markingService.isAnswerRight(myAnswer, question);

        MemberQuestion wq = new MemberQuestion();
        wq.setQuestion(questionId);
        wq.setMember(memberId);
        wq.setFlag(isAnswer);
        myQuestionService.save(wq);

        return R.success();
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
        request.setAttribute("current_index", 2);
        return member == null ? null : member.getId();
    }
}