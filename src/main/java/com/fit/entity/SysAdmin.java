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
public class SysAdmin extends BaseEntity<SysAdmin> {
    /**  (无默认值) */
    private Date createDate;

    /**  (无默认值) */
    private Date modifyDate;

    /** 登录名 (无默认值) */
    private String username;

    /** 登录密码 (无默认值) */
    private String password;

    /** 部门 (无默认值) */
    private String department;

    /** 角色ID (无默认值) */
    private Long roleId;

    /** 姓名 (无默认值) */
    private String name;

    /** 邮件 (无默认值) */
    private String email;

    /** 最后登录IP (无默认值) */
    private String loginIp;

    /** 最后登录日期 (无默认值) */
    private Date loginDate;

    /** 连续登录失败的次数 (无默认值) */
    private Integer loginFailureCount;

    /** 账号锁定日期 (无默认值) */
    private Date lockedDate;

    /** 账号是否锁定 (无默认值) */
    private Boolean isLocked;

    /** 账号是否启用 (无默认值) */
    private Boolean isEnabled;
}