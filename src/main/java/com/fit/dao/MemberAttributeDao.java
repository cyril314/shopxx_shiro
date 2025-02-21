package com.fit.dao;

import com.fit.base.BaseCrudDao;
import com.fit.entity.MemberAttribute;
import org.apache.ibatis.annotations.Mapper;

/**
 * @AUTO 用户属性接口
 * @Author AIM
 * @DATE 2025-02-21 18:34:10
 */
@Mapper
public interface MemberAttributeDao extends BaseCrudDao<MemberAttribute> {
}