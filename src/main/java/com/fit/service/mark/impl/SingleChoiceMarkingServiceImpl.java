package com.fit.service.mark.impl;

import com.fit.entity.ProductQuestion;
import com.fit.entity.ProductQuestionOption;
import com.fit.service.ProductQuestionOptionService;
import com.fit.service.mark.MarkingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("singleChoiceMarkingServiceImpl")
public class SingleChoiceMarkingServiceImpl implements MarkingService {

    @Autowired
    private ProductQuestionOptionService productQuestionOptionService;

    @Override
    public boolean isAnswerRight(String myAnswer, ProductQuestion question) {
        Long answerId = Long.parseLong(myAnswer);
        Map<String, Object> param = new HashMap<>();
        param.put("question", question.getId());
        List<ProductQuestionOption> list = productQuestionOptionService.findList(param);
        for (ProductQuestionOption option : list) {
            if (option.getIsCorrect() && option.getId().equals(answerId)) {
                return true;
            }
        }
        return false;
    }
}
