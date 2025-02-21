package com.fit.entity;

import com.fit.base.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @AUTO 资源
 * @Author AIM
 * @DATE 2025-02-21 18:34:10
 */
@Data
@Builder
@NoArgsConstructor //无参数的构造方法
@AllArgsConstructor //包含所有变量构造方法
public class SysResource extends BaseEntity<SysResource> {
    /** 创建时间 (无默认值) */
    private Date createTime;

    /** 修改日期 (无默认值) */
    private Date modifyTime;

    /** 资源名称 (无默认值) */
    private String name;

    /** 资源标识 (无默认值) */
    private String value;

    /** 描述 (无默认值) */
    private String description;

    /** 排序 (无默认值) */
    private Integer sort;

    /** 是否为系统内置资源  (默认值为: b'0') */
    private Boolean iSys;
}