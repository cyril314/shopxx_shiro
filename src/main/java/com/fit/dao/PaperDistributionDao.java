package com.fit.dao;

import com.fit.base.BaseCrudDao;
import com.fit.entity.PaperDistribution;
import org.apache.ibatis.annotations.Mapper;

/**
 * @AUTO 分配接口
 * @Author AIM
 * @DATE 2025-02-21 18:34:11
 */
@Mapper
public interface PaperDistributionDao extends BaseCrudDao<PaperDistribution> {
}