<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>${message("shop.member.list")}</title>
    <meta http-equiv="keywords" content="${seo_title}"/>
    <meta http-equiv="description" content="${seo_title}"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${base!}/static/css/common.css"/>
    <script type="text/javascript" src="${base!}/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="${base!}/static/js/common.js"></script>
    <script type="text/javascript" src="${base!}/static/js/list.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            [@flash_message /]
        });
    </script>
</head>
<body>
<div class="path">
    <a href="${base!}/admin/common/index">${message("shop.path.index")}</a> &raquo; ${message("shop.member.list")}
    <span>(${message("shop.page.total", page.total!)})</span>
</div>
<form id="listForm" action="list" method="get">
    <div class="bar">
        <a href="add" class="iconButton">
            <span class="addIcon">&nbsp;</span>${message("shop.common.add")}
        </a>
        <div class="buttonWrap">
            <a href="javascript:;" id="deleteButton" class="iconButton disabled">
                <span class="deleteIcon">&nbsp;</span>${message("shop.common.delete")}
            </a>
            <a href="javascript:;" id="refreshButton" class="iconButton">
                <span class="refreshIcon">&nbsp;</span>${message("shop.common.refresh")}
            </a>
            <div class="menuWrap">
                <a href="javascript:;" id="pageSizeSelect" class="button">
                    ${message("shop.page.pageSize")}<span class="arrow">&nbsp;</span>
                </a>
                <div class="popupMenu">
                    <ul id="pageSizeOption">
                        <li><a href="javascript:;"[#if page.pageSize! == 10] class="current"[/#if] val="10">10</a></li>
                        <li><a href="javascript:;"[#if page.pageSize! == 20] class="current"[/#if] val="20">20</a></li>
                        <li><a href="javascript:;"[#if page.pageSize! == 50] class="current"[/#if] val="50">50</a></li>
                        <li><a href="javascript:;"[#if page.pageSize! == 100] class="current"[/#if] val="100">100</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="menuWrap">
            <div class="search">
                <span id="searchPropertySelect" class="arrow">&nbsp;</span>
                <input type="text" id="searchValue" name="searchValue" value="${page.searchValue!}" maxlength="200"/>
                <button type="submit">&nbsp;</button>
            </div>
            <div class="popupMenu">
                <ul id="searchPropertyOption">
                    <li>
                        <a href="javascript:;"[#if page.searchProperty! == "username"] class="current"[/#if] val="username">${message("Member.username")}</a>
                    </li>
                    <li>
                        <a href="javascript:;"[#if page.searchProperty! == "email"] class="current"[/#if] val="email">${message("Member.email")}</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</form>
<table id="listTable" class="list">
    <tr>
        <th class="check"><input type="checkbox" id="selectAll"/></th>
        <th><a href="javascript:;" class="sort" name="username">${message("Member.username")}</a></th>
        <th><a href="javascript:;" class="sort" name="memberRank">${message("Member.memberRank")}</a></th>
        <th><a href="javascript:;" class="sort" name="email">${message("Member.email")}</a></th>
        <th><a href="javascript:;" class="sort" name="createDate">${message("shop.common.createDate")}</a></th>
        <th><span>${message("shop.member.status")}</span></th>
        <th><span>${message("shop.common.handle")}</span></th>
    </tr>
    [#list page.content as member]
        <tr>
            <td><input type="checkbox" name="ids" value="${member.id}"/></td>
            <td>${member.username}</td>
            <td>${member.memberRank.name}</td>
            <td>${member.email}</td>
            <td><span title="${member.createDate?string("yyyy-MM-dd HH:mm:ss")}">${member.createDate}</span></td>
            <td>
                [#if !member.isEnabled]
                    <span class="red">${message("admin.member.disabled")}</span>
                [#elseif member.isLocked]
                    <span class="red"> ${message("admin.member.locked")} </span>
                [#else]
                    <span class="green">${message("admin.member.normal")}</span>
                [/#if]
            </td>
            <td>
                <a href="view?id=${member.id}">[${message("admin.common.view")}]</a>
                <a href="edit?id=${member.id}">[${message("admin.common.edit")}]</a>
            </td>
        </tr>
    [/#list]
</table>
[@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
    [#include "../../include/pagination.ftl"]
[/@pagination]
</body>
</html>