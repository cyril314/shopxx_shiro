package com.fit.entity;

import com.fit.base.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @AUTO 考试管理
 * @Author AIM
 * @DATE 2025-02-21 18:34:10
 */
@Data
@Builder
@NoArgsConstructor //无参数的构造方法
@AllArgsConstructor //包含所有变量构造方法
public class Exam extends BaseEntity<Exam> {
    /** 创建时间 (无默认值) */
    private Date createDate;

    /** 修改日期 (无默认值) */
    private Date modifyDate;

    /** 考试名称 (无默认值) */
    private String name;

    /** 开始时间 (无默认值) */
    private Date startDate;

    /** 结束时间 (无默认值) */
    private Date endDate;

    /** 使用试卷 (无默认值) */
    private Long paper;

    /** 状态 (无默认值) */
    private Integer status;
}