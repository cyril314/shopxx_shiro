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
public class Oplog extends BaseEntity<Oplog> {
    /**  (无默认值) */
    private Date createDate;

    /**  (无默认值) */
    private Date modifyDate;

    /**  (无默认值) */
    private String ip;

    /** 日志信息 (无默认值) */
    private String info;

    /** 操作名称 (无默认值) */
    private String operation;

    /** 操作员 (无默认值) */
    private String operator;

    /**  (无默认值) */
    private String parameter;
}