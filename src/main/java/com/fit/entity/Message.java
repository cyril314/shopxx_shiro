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
public class Message extends BaseEntity<Message> {
    /**  (无默认值) */
    private Date createDate;

    /**  (无默认值) */
    private Date modifyDate;

    /**  (无默认值) */
    private String ip;

    /**  (无默认值) */
    private Boolean isDraft;

    /**  (无默认值) */
    private String title;

    /**  (无默认值) */
    private String content;

    /**  (无默认值) */
    private Long sender;

    /**  (无默认值) */
    private Boolean senderRead;

    /**  (无默认值) */
    private Boolean senderDelete;

    /**  (无默认值) */
    private Long receiver;

    /**  (无默认值) */
    private Boolean receiverRead;

    /**  (无默认值) */
    private Boolean receiverDelete;

    /**  (无默认值) */
    private Long forMessage;
}