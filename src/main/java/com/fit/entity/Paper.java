package com.fit.entity;

import com.fit.base.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @AUTO 试卷表
 * @Author AIM
 * @DATE 2025-02-21 18:34:11
 */
@Data
@Builder
@NoArgsConstructor //无参数的构造方法
@AllArgsConstructor //包含所有变量构造方法
public class Paper extends BaseEntity<Paper> {
    /** 创建时间 (无默认值) */
    private Date createDate;

    /** 修改日期 (无默认值) */
    private Date modifyDate;

    /** 试卷名 (无默认值) */
    private String name;

    /** 出卷类型 (无默认值) */
    private Integer method;

    /** 时长 (无默认值) */
    private Integer costTime;

    /** 及格分 (无默认值) */
    private Integer passMark;

    /** 状态 (无默认值) */
    private Integer status;

    /** 组卷范围 (无默认值) */
    private Long productCategory;
}