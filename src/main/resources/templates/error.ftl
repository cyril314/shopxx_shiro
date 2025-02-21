<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>${message("shop.error.title")}</title>
    <meta http-equiv="keywords" content="${seo_title}"/>
    <meta http-equiv="description" content="${seo_title}"/>
    <script type="text/javascript" src="${base!}/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="${base!}/static/js/common.js"></script>
    <link rel="stylesheet" type="text/css" href="${base!}/static/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${base!}/static/css/error.css"/>
</head>
<body>
<div class="wrap">
    <div class="error">
        <dl>
            <dt>${message("shop.error.message")}</dt>
            [#if content??]
                <dd>${content}</dd>
            [/#if]
            [#if constraintViolations?has_content]
                [#list constraintViolations as constraintViolation]
                    <dd>[${constraintViolation.propertyPath}] ${constraintViolation.message}</dd>
                [/#list]
            [/#if]
            <dd>
                <a href="javascript:;" onclick="window.history.back(); return false;">${message("shop.error.back")}</a>
            </dd>
        </dl>
    </div>
</div>
</body>
</html>