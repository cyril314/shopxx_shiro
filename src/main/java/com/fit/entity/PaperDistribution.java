package com.fit.entity;

import com.fit.base.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @AUTO 分配
 * @Author AIM
 * @DATE 2025-02-21 18:34:11
 */
@Data
@Builder
@NoArgsConstructor //无参数的构造方法
@AllArgsConstructor //包含所有变量构造方法
public class PaperDistribution extends BaseEntity<PaperDistribution> {
    /** 创建时间 (无默认值) */
    private Date createDate;

    /** 修改日期 (无默认值) */
    private Date modifyDate;

    /** 题目数量 (无默认值) */
    private Integer count;

    /** 题型分值 (无默认值) */
    private Integer mark;

    /** 试题类型 (无默认值) */
    private Integer type;

    /** 试卷ID (无默认值) */
    private Long paper;
}