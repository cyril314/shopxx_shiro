package com.fit.config.freemarker.directive;

import java.io.IOException;
import java.io.Writer;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.fit.base.BaseController;
import com.fit.entity.Member;
import com.fit.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * 模板指令 - 当前会员
 *
 * @author JIUJIANG Team
 * @version 3.0
 */
@Component("currentMemberDirective")
public class CurrentMemberDirective extends BaseDirective {

    /**
     * 变量名称
     */
    private static final String VARIABLE_NAME = "currentMember";

    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
        RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
        if (requestAttributes != null) {
            HttpServletRequest request = ((ServletRequestAttributes) requestAttributes).getRequest();
            Member currentMember = (Member) request.getSession().getAttribute(BaseController.PRINCIPAL_ATTRIBUTE_NAME);
            if (currentMember != null) {
                if (body != null) {
                    setLocalVariable(VARIABLE_NAME, currentMember, env, body);
                } else {
                    if (currentMember != null) {
                        Writer out = env.getOut();
                        out.write(currentMember.getUsername());
                    }
                }
            }
        }
    }
}