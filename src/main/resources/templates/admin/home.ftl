<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>${message("shop.index.title")} - Powered By JIUJIANG</title>
    <link rel="stylesheet" type="text/css" href="${base!}/static/css/common.css"/>
    <style type="text/css">
        .input .powered {
            font-size: 11px;
            text-align: right;
            color: #cccccc;
        }
    </style>
</head>
<body>
<div class="path">${message("shop.index.title")}</div>
<table class="input">
    <tr>
        <th>${message("shop.index.systemName")}:</th>
        <td>${systemName}</td>
        <th>${message("shop.index.osName")}:</th>
        <td>${osName}</td>
    </tr>
    <tr>
        <th>${message("shop.index.official")}:</th>
        <td><a href="" target="_blank"></a></td>
        <th>${message("shop.index.bbs")}:</th>
        <td><a href="" target="_blank"></a></td>
    </tr>
    <tr>
        <td colspan="4">&nbsp;</td>
    </tr>
    <tr>
        <th>${message("shop.index.javaVersion")}:</th>
        <td>${javaVersion}</td>
        <th>${message("shop.index.javaHome")}:</th>
        <td>${javaHome}</td>
    </tr>
    <tr>
        <th>${message("shop.index.serverInfo")}:</th>
        <td>${serverInfo}</td>
        <th>${message("shop.index.servletVersion")}:</th>
        <td>${servletVersion}</td>
    </tr>
    <tr>
        <td colspan="4">&nbsp;</td>
    </tr>
    <tr>
        <th>${message("shop.index.memberCount")}:</th>
        <td>${memberCount}</td>
        <th>${message("shop.index.unreadMessageCount")}:</th>
        <td>${unreadMessageCount}</td>
    </tr>
    <tr>
        <td class="powered" colspan="4"> COPYRIGHT © 2015-2025 ALL RIGHTS RESERVED.</td>
    </tr>
</table>
</body>
</html>