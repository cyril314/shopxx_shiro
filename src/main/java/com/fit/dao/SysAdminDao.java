package com.fit.dao;

import com.fit.base.BaseCrudDao;
import com.fit.entity.SysAdmin;
import org.apache.ibatis.annotations.Mapper;

/**
 * @AUTO 接口
 * @Author AIM
 * @DATE 2025-02-21 18:34:10
 */
@Mapper
public interface SysAdminDao extends BaseCrudDao<SysAdmin> {
}