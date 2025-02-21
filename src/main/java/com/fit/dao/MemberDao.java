package com.fit.dao;

import com.fit.base.BaseCrudDao;
import com.fit.entity.Member;
import org.apache.ibatis.annotations.Mapper;

/**
 * @AUTO 会员表接口
 * @Author AIM
 * @DATE 2025-02-21 18:34:10
 */
@Mapper
public interface MemberDao extends BaseCrudDao<Member> {
}