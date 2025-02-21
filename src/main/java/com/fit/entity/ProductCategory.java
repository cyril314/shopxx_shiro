package com.fit.entity;

import com.fit.base.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @AUTO 章节管理
 * @Author AIM
 * @DATE 2025-02-21 18:34:11
 */
@Data
@Builder
@NoArgsConstructor //无参数的构造方法
@AllArgsConstructor //包含所有变量构造方法
public class ProductCategory extends BaseEntity<ProductCategory> {
    /** 创建时间 (无默认值) */
    private Date createDate;

    /** 修改日期 (无默认值) */
    private Date modifyDate;

    /** 排序 (无默认值) */
    private Integer orders;

    /** 层级  (默认值为: 1) */
    private Integer grade;

    /** 名称 (无默认值) */
    private String name;

    /** 树路径 (无默认值) */
    private String treePath;

    /** 上级分类  (默认值为: 0) */
    private Long parent;
}