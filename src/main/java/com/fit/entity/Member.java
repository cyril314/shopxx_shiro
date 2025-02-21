package com.fit.entity;

import com.fit.base.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @AUTO 会员表
 * @Author AIM
 * @DATE 2025-02-21 18:34:10
 */
@Data
@Builder
@NoArgsConstructor //无参数的构造方法
@AllArgsConstructor //包含所有变量构造方法
public class Member extends BaseEntity<Member> {
    /**  (无默认值) */
    private Date createDate;

    /**  (无默认值) */
    private Date modifyDate;

    /** 用户名 (无默认值) */
    private String username;

    /** 密码 (无默认值) */
    private String password;

    /** 消费金额 (无默认值) */
    private BigDecimal amount;

    /** 余额 (无默认值) */
    private BigDecimal balance;

    /** 积分 (无默认值) */
    private Long point;

    /** 是否启用 (无默认值) */
    private Boolean isEnabled;

    /** 是否锁定 (无默认值) */
    private Boolean isLocked;

    /** 会员等级 (无默认值) */
    private Long memberRank;

    /** 姓名 (无默认值) */
    private String name;

    /** 性别 (无默认值) */
    private Integer gender;

    /** 生日 (无默认值) */
    private Date birth;

    /** 邮箱 (无默认值) */
    private String email;

    /** 地址 (无默认值) */
    private String address;

    /** 地区 (无默认值) */
    private Long area;

    /** 邮编 (无默认值) */
    private String zipCode;

    /** 电话 (无默认值) */
    private String phone;

    /** 手机 (无默认值) */
    private String mobile;

    /** 会员注册项值0 (无默认值) */
    private String attributeValue0;

    /** 会员注册项值1 (无默认值) */
    private String attributeValue1;

    /** 会员注册项值2 (无默认值) */
    private String attributeValue2;

    /** 会员注册项值3 (无默认值) */
    private String attributeValue3;

    /** 会员注册项值4 (无默认值) */
    private String attributeValue4;

    /** 会员注册项值5 (无默认值) */
    private String attributeValue5;

    /** 会员注册项值6 (无默认值) */
    private String attributeValue6;

    /** 会员注册项值7 (无默认值) */
    private String attributeValue7;

    /** 会员注册项值8 (无默认值) */
    private String attributeValue8;

    /** 会员注册项值9 (无默认值) */
    private String attributeValue9;

    /** 连续登录失败次数 (无默认值) */
    private Integer loginFailureCount;

    /** 锁定日期 (无默认值) */
    private Date lockedDate;

    /** 最后登录日期 (无默认值) */
    private Date loginDate;

    /** 最后登录IP (无默认值) */
    private String loginIp;

    /** 员工工号 (无默认值) */
    private String number;

    /** 注册IP (无默认值) */
    private String registerIp;

    /** 安全密钥过期 (无默认值) */
    private Date safeKeyExpire;

    /** 安全密钥值 (无默认值) */
    private String safeKeyValue;
}