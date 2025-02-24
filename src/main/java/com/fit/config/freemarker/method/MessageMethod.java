package com.fit.config.freemarker.method;

import java.util.List;

import com.fit.util.SpringUtils;
import org.apache.logging.log4j.util.Strings;
import org.springframework.stereotype.Component;

import freemarker.template.SimpleScalar;
import freemarker.template.TemplateMethodModel;
import freemarker.template.TemplateModelException;

/**
 * 模板方法 - 多语言
 */
@Component("messageMethod")
public class MessageMethod implements TemplateMethodModel {

    public Object exec(List arguments) throws TemplateModelException {
        if (arguments != null && !arguments.isEmpty() && arguments.get(0) != null && Strings.isNotEmpty(arguments.get(0).toString())) {
            String message = null;
            String code = arguments.get(0).toString();
            if (arguments.size() > 1) {
                Object[] args = arguments.subList(1, arguments.size()).toArray();
                message = SpringUtils.getMessage(code, args);
            } else {
                message = SpringUtils.getMessage(code);
            }
            return new SimpleScalar(message);
        }
        return null;
    }

}