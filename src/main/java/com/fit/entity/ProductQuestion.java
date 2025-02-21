package com.fit.entity;

import com.fit.base.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @AUTO 章节练习
 * @Author AIM
 * @DATE 2025-02-21 18:34:11
 */
@Data
@Builder
@NoArgsConstructor //无参数的构造方法
@AllArgsConstructor //包含所有变量构造方法
public class ProductQuestion extends BaseEntity<ProductQuestion> {
    /** 创建时间 (无默认值) */
    private Date createDate;

    /** 修改日期 (无默认值) */
    private Date modifyDate;

    /** 解析 (无默认值) */
    private String anisys;

    /** 题干 (无默认值) */
    private String stem;

    /** 类型 (无默认值) */
    private Integer type;

    /** 商品分类ID (无默认值) */
    private Long productCategory;
}