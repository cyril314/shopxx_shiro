package com.fit.entity;

import com.fit.base.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @AUTO 
 * @Author AIM
 * @DATE 2025-02-21 18:34:10
 */
@Data
@Builder
@NoArgsConstructor //无参数的构造方法
@AllArgsConstructor //包含所有变量构造方法
public class SysRole extends BaseEntity<SysRole> {
    /**  (无默认值) */
    private Date createDate;

    /**  (无默认值) */
    private Date modifyDate;

    /** 角色名 (无默认值) */
    private String name;

    /** 角色标识 (无默认值) */
    private String value;

    /** 描述 (无默认值) */
    private String description;

    /** 是否为系统内置资源 (无默认值) */
    private Boolean iSys;
}