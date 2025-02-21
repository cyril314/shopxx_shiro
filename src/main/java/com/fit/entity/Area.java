package com.fit.entity;

import com.fit.base.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @AUTO 地区
 * @Author AIM
 * @DATE 2025-02-21 18:34:10
 */
@Data
@Builder
@NoArgsConstructor //无参数的构造方法
@AllArgsConstructor //包含所有变量构造方法
public class Area extends BaseEntity<Area> {
    /** 创建时间 (无默认值) */
    private Date createDate;

    /** 修改日期 (无默认值) */
    private Date modifyDate;

    /** 名称 (无默认值) */
    private String name;

    /** 树路径 (无默认值) */
    private String path;

    /** 排序 (无默认值) */
    private Integer sort;

    /** 上级ID (无默认值) */
    private Long parentId;
}