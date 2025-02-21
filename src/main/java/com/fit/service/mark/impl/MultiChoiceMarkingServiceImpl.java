package com.fit.service.mark.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fit.entity.ProductQuestion;
import com.fit.entity.ProductQuestionOption;
import com.fit.service.ProductQuestionOptionService;
import com.fit.service.mark.MarkingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("multiChoiceMarkingServiceImpl")
public class MultiChoiceMarkingServiceImpl implements MarkingService {

    @Autowired
    private ProductQuestionOptionService productQuestionOptionService;

    @Override
    public boolean isAnswerRight(String myAnswer, ProductQuestion question) {
        List<Long> answerIds = this.getOptionIds(myAnswer);
        Map<String, Object> param = new HashMap<>();
        param.put("question", question.getId());
        List<ProductQuestionOption> list = productQuestionOptionService.findList(param);
        for (ProductQuestionOption option : list) {
            if (option.getIsCorrect() && answerIds.contains(option.getId())) {
                answerIds.remove(option.getId());
            }
        }
        if (answerIds.isEmpty()) {
            return true;
        }

        return false;
    }

    /**
     * 获得选项ID列表
     *
     * @param @param  myAnswer
     * @param @return 设定文件
     * @return List<Long>    返回类型
     */
    private List<Long> getOptionIds(String myAnswer) {
        List<Long> optionIds = new ArrayList<Long>();
        String[] arr = myAnswer.split("\\|");
        for (String tmp : arr) {
            optionIds.add(Long.parseLong(tmp));
        }
        return optionIds;
    }
}
