<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<title>ExamStack</title>
<meta name="keywords" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<link rel="stylesheet" href="${base!}/static/plugins/bootstrap/css/bootstrap-huan.css">
<link rel="stylesheet" href="${base!}/static/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${base!}/static/css/style.css">
<style>
.table>thead>tr>th, .table>tbody>tr>th, .table>tfoot>tr>th, .table>thead>tr>td,
	.table>tbody>tr>td, .table>tfoot>tr>td {
	padding: 8px 0;
	line-height: 1.42857143;
	vertical-align: middle;
	border-top: 1px solid #ddd;
}

a.join-practice-btn {
	margin-top: 0;
}
</style>
</head>
<body>
[#include "../../include/head_bar.ftl"]
<!-- Slider starts -->
<div class="content" style="margin-bottom: 100px;">
    <div class="container">
        <ul class="nav nav-pills " style="margin: 20px 0;">
            [#list navs as nav]
                <li role="presentation" [#if nav.id == currentNav.id] class="active" [/#if]><a href="index?cateId=${nav.id}">${nav.name }</a></li>
            [/#list]
        </ul>
        <div class="row">
            <div class="col-xs-6">
                <div style="border-bottom: 1px solid #ddd;">
                    <h3 class="title">
                        <i class="fa fa-cloud-upload"></i> 强化练习
                    </h3>
                    <p>自主选择具体章节，各个击破</p>
                </div>
                <div class="question-list">
                    <table class="table-striped table">
                        <thead>
                            <tr>
                                <td colspan="4"><span style="color: #428bca;">学习进度：<fmt:formatNumber	value="0" type="percent" /></span></td>
                            </tr>
                            <tr>
                                <td>章节</td>
                                <td>全部</td>
                                <td>已做题目</td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>
                            [#list childrenCategorys as category]
                                <tr>
                                    <td>${category.name }</td>
                                    <td><span class="span-info question-number">${category.questions?size }</span></td>
                                    <td><span class="span-success question-number-2">${category.C}</span></td>
                                    <td><a href="improve?cateId=${category.id}" class="btn btn-success btn-sm join-practice-btn">参加练习</a></td>
                                </tr>
                            [/#list]
                        </tbody>
                        <tfoot></tfoot>
                    </table>
                </div>
            </div>
            <div class="col-xs-6">
                <div style="border-bottom: 1px solid #ddd;">
                    <h3 class="title">
                        <i class="fa fa-eraser"></i> 错题练习
                    </h3>
                    <p>收录做过的所有错题</p>
                </div>
                <div class="question-list">
                    <table class="table-striped table">
                        <thead>
                            <tr>
                                <td>章节</td>
                                <td>题目数量</td>
                                <td></td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>
                            [#list childrenCategorys as category]
                            <tr>
                                <td>${category.name }</td>
                                <td><span class="span-info question-number">${category.wrongQuestion?size }</span></td>
                                <td><a href="wrong?cateId=${category.id}" class="btn btn-success btn-sm join-practice-btn">参加练习</a></td>
                            </tr>
                            [/#list]
                        </tbody>
                        <tfoot></tfoot>
                    </table>
                </div>
                <div style="border-bottom: 1px solid #ddd; margin-bottom: 20px;">
                    <h3 class="title">
                        <i class="fa fa-superscript"></i> 随机练习
                    </h3>
                    <p>从题库中随机取出试题练习</p>
                </div>
                <a class="btn btn-success " href="random?cateId=${currentNav.id}">随机来20道 </i></a>
            </div>
        </div>
    </div>
</div>
[#include "../../include/bottom_bar.ftl"]
<!-- Slider Ends -->
<!-- Javascript files -->
<!-- jQuery -->
<script type="text/javascript" src="${base!}/static/js/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script type="text/javascript" src="${base!}/static/plugins/bootstrap/js/bootstrap.min.js"></script>
<script>
    $(function() {
        bindQuestionKnowledage();
        var result = checkBrowser();
        if (!result) {
            alert("请至少更新浏览器版本至IE8或以上版本");
        }
    });

    function checkBrowser() {
        var browser = navigator.appName;
        var b_version = navigator.appVersion;
        var version = b_version.split(";");
        var trim_Version = version[1].replace(/[ ]/g, "");
        if (browser == "Microsoft Internet Explorer" && trim_Version == "MSIE7.0") {
            return false;
        } else if (browser == "Microsoft Internet Explorer" && trim_Version == "MSIE6.0") {
            return false;
        } else{
            return true;
        }
    }

    function bindQuestionKnowledage() {
        $(".knowledge-title").click(function() {
            var ul = $(this).parent().find(".question-list-knowledge");
            if (ul.is(":visible")) {
                $(this).find(".fa-chevron-down").hide();
                $(this).find(".fa-chevron-up").show();
                $(".question-list-knowledge").slideUp();
            } else {
                $(".fa-chevron-down").hide();
                $(".fa-chevron-up").show();

                $(this).find(".fa-chevron-up").hide();
                $(this).find(".fa-chevron-down").show();

                $(".question-list-knowledge").slideUp();
                ul.slideDown();
            }
        });
    }
</script>
</body>
</html>