package com.fit.dao;

import com.fit.base.BaseCrudDao;
import com.fit.entity.MemberRank;
import org.apache.ibatis.annotations.Mapper;

/**
 * @AUTO 会员等级接口
 * @Author AIM
 * @DATE 2025-02-21 18:34:10
 */
@Mapper
public interface MemberRankDao extends BaseCrudDao<MemberRank> {
}