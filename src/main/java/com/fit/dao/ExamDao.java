package com.fit.dao;

import com.fit.base.BaseCrudDao;
import com.fit.entity.Exam;
import org.apache.ibatis.annotations.Mapper;

/**
 * @AUTO 考试管理接口
 * @Author AIM
 * @DATE 2025-02-21 18:34:10
 */
@Mapper
public interface ExamDao extends BaseCrudDao<Exam> {
}