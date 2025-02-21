<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>${seo_title}</title>
    <meta http-equiv="keywords" content="${seo_title}"/>
    <meta http-equiv="description" content="${seo_title}"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${base!}/static/css/common.css"/>
    <script type="text/javascript" src="${base!}/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="${base!}/static/js/common.js"></script>
    <script type="text/javascript" src="${base!}/static/js/list.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var $delete = $("#listTable a.delete");
            [@flash_message /]
            // 删除
            $delete.click(function () {
                var $this = $(this);
                $.dialog({
                    type: "warn",
                    content: "${message("shop.dialog.deleteConfirm")}",
                    onOk: function () {
                        $.ajax({
                            url: "delete",
                            type: "POST",
                            data: {id: $this.attr("val")},
                            dataType: "json",
                            cache: false,
                            success: function (message) {
                                $.message(message);
                                if (message.type == "success") {
                                    $this.closest("tr").remove();
                                }
                            }
                        });
                    }
                });
                return false;
            });
        });
    </script>
</head>
<body>
<div class="path">
    <a href="${base!}/admin/common/index">${message("shop.path.index")}</a> &raquo; 章节分类列表
</div>
<div class="bar">
    <a href="add" class="iconButton">
        <span class="addIcon">&nbsp;</span>${message("shop.common.add")}
    </a>
    <a href="javascript:;" id="refreshButton" class="iconButton">
        <span class="refreshIcon">&nbsp;</span>${message("shop.common.refresh")}
    </a>
</div>
<table id="listTable" class="list">
    <tr>
        <th><span>${message("ProductCategory.name")}</span></th>
        <th><span>${message("shop.common.order")}</span></th>
        <th><span>题目数量</span></th>
        <th><span>${message("shop.common.handle")}</span></th>
    </tr>
    <tr>
        <#list productCategoryTree as categoryMap>
            <td>
                <span style="margin-left: ${categoryMap.grade! * 20}px;<#if categoryMap.grade! == 0> color: #000000;
                        </#if>">${categoryMap.name!}</span>
            </td>
            <td>${categoryMap.orders!}</td>
            <td>${categoryMap.questions!}</td>
            <td>
                <a href="${base!}/${categoryMap.path!}" target="_blank"></a>
                <a href="edit?id=${categoryMap.id!}">[${message("shop.common.edit")}]</a>
                <a href="javascript:;" class="delete" val="${categoryMap.id!}">[${message("shop.common.delete")}]</a>
                <#if categoryMap.questions! gt 0 >
                    <a href="${base!}/admin/question/list?categoryId=${categoryMap.id!}">[试题列表]</a>
                </#if>
            </td>
        </#list>
    </tr>
</table>
</body>
</html>