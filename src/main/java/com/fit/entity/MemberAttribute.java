package com.fit.entity;

import com.fit.base.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @AUTO 用户属性
 * @Author AIM
 * @DATE 2025-02-21 18:34:10
 */
@Data
@Builder
@NoArgsConstructor //无参数的构造方法
@AllArgsConstructor //包含所有变量构造方法
public class MemberAttribute extends BaseEntity<MemberAttribute> {
    /** 创建时间 (无默认值) */
    private Date createDate;

    /** 修改日期 (无默认值) */
    private Date modifyDate;

    /** 名称 (无默认值) */
    private String name;

    /** 类型 (无默认值) */
    private Integer type;

    /** 排序 (无默认值) */
    private Integer sort;

    /** 属性序号 (无默认值) */
    private Integer propertyIndex;

    /** 是否启用 (无默认值) */
    private Boolean isEnabled;

    /** 是否必填 (无默认值) */
    private Boolean isRequired;
}