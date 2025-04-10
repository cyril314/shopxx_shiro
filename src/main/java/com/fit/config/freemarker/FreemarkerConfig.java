package com.fit.config.freemarker;

import com.fit.config.freemarker.directive.FlashMessageDirective;
import com.fit.config.freemarker.directive.PaginationDirective;
import com.fit.config.shiro.I18nMessage;
import com.fit.config.shiro.ShiroTags;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;
import org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver;

import java.util.HashMap;
import java.util.Properties;

@Configuration
public class FreemarkerConfig {

    @Bean
    public FreeMarkerViewResolver freeMarkerViewResolver() {
        FreeMarkerViewResolver resolver = new FreeMarkerViewResolver();
        resolver.setSuffix(".ftl"); // 设置文件后缀
        resolver.setContentType("text/html; charset=utf-8"); // 设置内容类型
        resolver.setOrder(0); // 设置视图解析器的优先级
        resolver.setCache(false);
        return resolver;
    }

    @Bean
    public MessageSource messageSource() {
        ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
        messageSource.setBasename("classpath:i18n/messages"); // 设置路径
        messageSource.setDefaultEncoding("UTF-8"); // 设置编码
        messageSource.setCacheSeconds(3600); // 设置缓存时间（秒）
        return messageSource;
    }

    @Bean
    public FlashMessageDirective getFlashMessage() {
        return new FlashMessageDirective();
    }

    @Bean
    public PaginationDirective getPagination() {
        return new PaginationDirective();
    }

    @Bean
    public I18nMessage getMessageMethod() {
        return new I18nMessage();
    }

    @Bean
    public ShiroTags getShiroTags() {
        return new ShiroTags();
    }

    @Bean
    public FreeMarkerConfigurer freeMarkerConfigurer() {
        FreeMarkerConfigurer configurer = new FreeMarkerConfigurer();
        configurer.setDefaultEncoding("UTF-8");
        // 设置模板加载路径（与 application.yml 中的 template-loader-path 相同）
        configurer.setTemplateLoaderPath("classpath:/templates/");
        // 如果需要添加共享变量（例如 messageMethod）：
        HashMap<String, Object> variables = new HashMap<>();
        variables.put("flash_message", getFlashMessage());
        variables.put("pagination", getPagination());
        variables.put("message", getMessageMethod());
        variables.put("shiro", getShiroTags());
        configurer.setFreemarkerVariables(variables);
        // 配置 FreeMarker 的设置
        Properties settings = new Properties();
        settings.put("template_update_delay", "0"); // 缓存延迟，0 表示禁用缓存（与 cache: false 对应）
        settings.put("datetime_format", "yyyy-MM-dd"); // 日期格式
        settings.put("number_format", "0.##");         // 数字格式
        settings.put("tag_syntax", "auto_detect");     // 设置标签类型
        configurer.setFreemarkerSettings(settings);
        return configurer;
    }
}