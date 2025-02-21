/*
 * Copyright 2005-2013 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package com.fit.config.freemarker.directive;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.fit.entity.MemberAttribute;
import com.fit.service.MemberAttributeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

/**
 * 模板指令 - 会员注册项列表
 */
@Component("memberAttributeListDirective")
public class MemberAttributeListDirective extends BaseDirective {

    /**
     * 变量名称
     */
    private static final String VARIABLE_NAME = "memberAttributes";

    @Autowired
    private MemberAttributeService memberAttributeService;

    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
        List<MemberAttribute> memberAttributes;
        boolean useCache = useCache(env, params);
        String cacheRegion = getCacheRegion(env, params);
        memberAttributes = memberAttributeService.findAll();
        setLocalVariable(VARIABLE_NAME, memberAttributes, env, body);
    }
}