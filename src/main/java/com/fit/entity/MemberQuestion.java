package com.fit.entity;

import com.fit.base.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @AUTO 答题表
 * @Author AIM
 * @DATE 2025-02-21 18:34:10
 */
@Data
@Builder
@NoArgsConstructor //无参数的构造方法
@AllArgsConstructor //包含所有变量构造方法
public class MemberQuestion extends BaseEntity<MemberQuestion> {
    /** 创建时间 (无默认值) */
    private Date createDate;

    /** 修改日期 (无默认值) */
    private Date modifyDate;

    /** 是否做对 (无默认值) */
    private Boolean flag;

    /** 答题人 (无默认值) */
    private Long member;

    /** 做错的题目 (无默认值) */
    private Long question;
}