package com.fit.dao;

import com.fit.base.BaseCrudDao;
import com.fit.entity.ProductQuestion;
import org.apache.ibatis.annotations.Mapper;

/**
 * @AUTO 章节练习接口
 * @Author AIM
 * @DATE 2025-02-21 18:34:11
 */
@Mapper
public interface ProductQuestionDao extends BaseCrudDao<ProductQuestion> {
}