package com.fit.service.mark;

import com.fit.entity.ProductQuestion;

/**
 * 阅卷服务
 */
public interface MarkingService {
    /**
     * 答案是否正确
     *
     * @param @param  myAnswer
     * @param @param  question
     * @param @return 设定文件
     * @return boolean    返回类型
     * @throws
     * @Title: isAnswerRight
     */
    boolean isAnswerRight(String myAnswer, ProductQuestion question);

}
