package com.fit.entity;

import com.fit.base.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @AUTO 选项
 * @Author AIM
 * @DATE 2025-02-21 18:34:11
 */
@Data
@Builder
@NoArgsConstructor //无参数的构造方法
@AllArgsConstructor //包含所有变量构造方法
public class ProductQuestionOption extends BaseEntity<ProductQuestionOption> {
    /** 创建时间 (无默认值) */
    private Date createDate;

    /** 修改日期 (无默认值) */
    private Date modifyDate;

    /** 内容 (无默认值) */
    private String content;

    /** 是否答案 (无默认值) */
    private Boolean isCorrect;

    /** 问题 (无默认值) */
    private Long question;
}