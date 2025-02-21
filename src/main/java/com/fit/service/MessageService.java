package com.fit.service;

import com.fit.base.BaseCrudService;
import com.fit.dao.MessageDao;
import com.fit.entity.Message;
import org.springframework.stereotype.Service;

/**
 * @AUTO 服务实现类
 * @Author AIM
 * @DATE 2025-02-21 18:34:10
 */
@Service
public class MessageService extends BaseCrudService<MessageDao, Message> {
}