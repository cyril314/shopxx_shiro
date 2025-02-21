package com.fit.entity;

import com.fit.base.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @AUTO 会员等级
 * @Author AIM
 * @DATE 2025-02-21 18:34:10
 */
@Data
@Builder
@NoArgsConstructor //无参数的构造方法
@AllArgsConstructor //包含所有变量构造方法
public class MemberRank extends BaseEntity<MemberRank> {
    /** 创建时间 (无默认值) */
    private Date createDate;

    /** 修改日期 (无默认值) */
    private Date modifyDate;

    /** 名称 (无默认值) */
    private String name;

    /** 消费金额 (无默认值) */
    private BigDecimal amount;

    /** 优惠比例 (无默认值) */
    private Double scale;

    /** 是否默认 (无默认值) */
    private Boolean isDefault;

    /** 是否特殊 (无默认值) */
    private Boolean isSpecial;
}