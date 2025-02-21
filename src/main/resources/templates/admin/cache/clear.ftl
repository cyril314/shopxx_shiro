<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>${message("shop.cache.clear")} - Powered By JIUJIANG</title>
    <meta name="author" content="JIUJIANG Team"/>
    <meta name="copyright" content="JIUJIANG"/>
    <link rel="stylesheet" href="${base!}/static/css/common.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${base!}/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="${base!}/static/js/jquery.validate.js"></script>
    <script type="text/javascript" src="${base!}/static/js/common.js"></script>
    <script type="text/javascript" src="${base!}/static/js/input.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            [@flash_message /]
        });
    </script>
</head>
<body>
<div class="path">
    <a href="${base!}/admin/common/index">${message("shop.path.index")}</a> &raquo; ${message("shop.cache.clear")}
</div>
<form id="inputForm" action="clear" method="post">
    <table class="input">
        <tr>
            <th>                ${message("shop.cache.cacheSize")}:</th>
            <td>                ${cacheSize}            </td>
        </tr>
        <tr>
            <th>                ${message("shop.cache.freeMemory")}:</th>
            <td>
                [#if maxMemory?? && totalMemory?? && freeMemory??]
                    ${(maxMemory - totalMemory + freeMemory)?string("0.##")}MB
                [#else]
                    -
                [/#if]
            </td>
        </tr>
        <tr>
            <th>                ${message("shop.cache.diskStorePath")}:</th>
            <td>                ${diskStorePath}            </td>
        </tr>
        <tr>
            <th> &nbsp;</th>
            <td>
                <input type="submit" class="button" value="${message("shop.common.submit")}"/>
                <input type="button" class="button" value="${message("shop.common.back")}" onclick="location.href='../common/index'"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>