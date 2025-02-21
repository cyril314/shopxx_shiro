<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>${seo_title}</title>
    <meta http-equiv="keywords" content="${seo_title}"/>
    <meta http-equiv="description" content="${seo_title}"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${base!}/static/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${base!}/static/css/main.css"/>
    <script type="text/javascript" src="${base!}/static/js/jquery.min.js"></script>
    <style type="text/css">
        * {
            font: 12px tahoma, Arial, Verdana, sans-serif;
        }

        html, body {
            width: 100%;
            height: 100%;
            overflow: hidden;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            if (self != top) {
                top.location = self.location;
            }
            var $nav = $("#nav a:not(:last)");
            var $menu = $("#menu dl");
            var $menuItem = $("#menu a");

            $nav.click(function () {
                var $this = $(this);
                $nav.removeClass("current");
                $this.addClass("current");
                var $currentMenu = $($this.attr("href"));
                $menu.hide();
                $currentMenu.show();
                return false;
            });

            $menuItem.click(function () {
                var $this = $(this);
                $menuItem.removeClass("current");
                $this.addClass("current");
            });
        });
    </script>
</head>
<body>
<table class="main">
    <tr>
        <th class="logo">
            <a href="/admin/index">
                <img src="${base!}/static/img/header_logo.png" alt="shop"/>
            </a>
        </th>
        <th>
            <div id="nav" class="nav">
                <ul>
                    <#list ["admin:product_category","admin:category_paper"] as permission>
                        <#if shiro.hasPermission(permission)>
                            <li>
                                <a href="#product">章节练习</a>
                            </li>
                            <#break />
                        </#if>
                    </#list>
                    <#list ["admin:paper","admin:exam"] as permission>
                        <#if shiro.hasPermission(permission)>
                            <li>
                                <a href="#paper">试卷考试</a>
                            </li>
                            <#break />
                        </#if>
                    </#list>
                    <#list ["admin:member", "admin:memberRank"] as permission>
                        <#if shiro.hasPermission(permission)>
                            <li>
                                <a href="#member">${message("shop.main.memberNav")}</a>
                            </li>
                            <#break />
                        </#if>
                    </#list>
                    <#list ["admin:setting", "admin:area", "admin:admin", "admin:role", "admin:message", "admin:log"] as permission>
                        <#if shiro.hasPermission(permission)>
                            <li>
                                <a href="#system">${message("shop.main.systemNav")}</a>
                            </li>
                            <#break />
                        </#if>
                    </#list>
                    <li>
                        <a href="${base!}/" target="_blank">${message("shop.main.home")}</a>
                    </li>
                </ul>
            </div>
            <div class="link">
                <strong>${shiro.principal()}</strong>
                ${message("shop.main.hello")}!
                <a href="${base!}/admin/profile/edit" target="iframe">[${message("shop.main.profile")}]</a>
                <a href="${base!}/admin/logout" target="_top">[${message("shop.main.logout")}]</a>
            </div>
        </th>
    </tr>
    <tr>
        <td id="menu" class="menu">
            <dl id="product" class="default">
                <dt>章节练习</dt>
                <#if shiro.hasPermission("admin:product_category")>
                    <dd>
                        <a href="${base!}/admin/product_category/list" target="iframe">章节管理</a>
                    </dd>
                </#if>
                <#if shiro.hasPermission("admin:category_paper")>
                    <dd>
                        <a href="${base!}/admin/question/list" target="iframe">章节练习管理</a>
                    </dd>
                </#if>
            </dl>
            <dl id="paper">
                <dt>试卷管理</dt>
                <#if shiro.hasPermission("admin:paper")>
                    <dd>
                        <a href="${base!}/admin/paper/list" target="iframe">试卷管理</a>
                    </dd>
                </#if>
                <#if shiro.hasPermission("admin:exam")>
                    <dd>
                        <a href="${base!}/admin/exam/list" target="iframe">考试管理</a>
                    </dd>
                </#if>
            </dl>
            <dl id="member">
                <dt>${message("shop.main.memberGroup")}</dt>
                <#if shiro.hasPermission("admin:member")>
                    <dd>
                        <a href="${base!}/admin/member/list" target="iframe">${message("shop.main.member")}</a>
                    </dd>
                </#if>
                <#if shiro.hasPermission("admin:memberRank")>
                    <dd>
                        <a href="${base!}/admin/member_rank/list" target="iframe">${message("shop.main.memberRank")}</a>
                    </dd>
                </#if>
            </dl>
            <dl id="system">
                <dt>${message("shop.main.systemGroup")}</dt>
                <#if shiro.hasPermission("admin:setting")>
                    <dd>
                        <a href="${base!}/admin/setting/edit" target="iframe">${message("shop.main.setting")}</a>
                    </dd>
                </#if>
                <#if shiro.hasPermission("admin:area")>
                    <dd>
                        <a href="${base!}/admin/area/list" target="iframe">${message("shop.main.area")}</a>
                    </dd>
                </#if>
                <#if shiro.hasPermission("admin:admin")>
                    <dd>
                        <a href="${base!}/admin/admin/list" target="iframe">${message("shop.main.admin")}</a>
                    </dd>
                </#if>
                <#if shiro.hasPermission("admin:role")>
                    <dd>
                        <a href="${base!}/admin/role/list" target="iframe">${message("shop.main.role")}</a>
                    </dd>
                </#if>
                <#if shiro.hasPermission("admin:log")>
                    <dd>
                        <a href="${base!}/admin/log/list" target="iframe">${message("shop.main.log")}</a>
                    </dd>
                </#if>
            </dl>
        </td>
        <td>
            <iframe id="iframe" name="iframe" src="${base!}/admin/home" frameborder="0"></iframe>
        </td>
    </tr>
</table>
</body>
</html>