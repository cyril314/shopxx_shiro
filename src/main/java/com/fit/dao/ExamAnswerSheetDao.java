package com.fit.dao;

import com.fit.base.BaseCrudDao;
import com.fit.entity.ExamAnswerSheet;
import org.apache.ibatis.annotations.Mapper;

/**
 * @AUTO 答题卡接口
 * @Author AIM
 * @DATE 2025-02-21 18:34:11
 */
@Mapper
public interface ExamAnswerSheetDao extends BaseCrudDao<ExamAnswerSheet> {
}