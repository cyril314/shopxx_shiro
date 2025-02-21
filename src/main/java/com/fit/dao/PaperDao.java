package com.fit.dao;

import com.fit.base.BaseCrudDao;
import com.fit.entity.Paper;
import org.apache.ibatis.annotations.Mapper;

/**
 * @AUTO 试卷表接口
 * @Author AIM
 * @DATE 2025-02-21 18:34:11
 */
@Mapper
public interface PaperDao extends BaseCrudDao<Paper> {
}