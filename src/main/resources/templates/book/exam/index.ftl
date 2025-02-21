<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <title>ExamStack</title>
    <meta name="keywords" content="">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="${base!}/static/plugins/bootstrap/css/bootstrap-huan.css">
    <link rel="stylesheet" href="${base!}/static/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${base!}/static/css/style.css">
    <style>
        .table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td {
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
    <div class="container" style="margin-top: 40px;">
        <div class="row">
            <div class="col-xs-6">
                <div style="border-bottom: 1px solid #ddd;">
                    <h3 class="title"><i class="fa fa-cloud-upload"></i> 最近发布的考试</h3>
                </div>
                <div class="question-list">
                    <table class="table-striped table">
                        <thead>
                        <tr>
                            <td>考试名称</td>
                            <td>开始日期</td>
                            <td>截止日期</td>
                            <td></td>
                        </tr>
                        </thead>
                        <tbody>
                        [#list recentExams as exam]
                            <tr>
                                <td>${exam.name}</td>
                                <td><span class="span-info question-number">${exam.startDate}</span></td>
                                <td><span class="span-success question-number-2">${exam.endDate}</span></td>
                                <td>
                                    <button class="btn btn-success btn-sm join-practice-btn apply-exam-btn" data-id="${exam.id}">参加
                                    </button>
                                </td>
                            </tr>
                        [/#list]
                        </tbody>
                        <tfoot></tfoot>
                    </table>
                </div>
            </div>
            <div class="col-xs-6">
                <div style="border-bottom: 1px solid #ddd;">
                    <h3 class="title"><i class="fa fa-paper-plane-o"></i> 我的考试</h3>
                </div>
                <div class="question-list">
                    <table class="table-striped table">
                        <thead>
                        <tr>
                            <td>考试名称</td>
                            <td>开始日期</td>
                            <td>截止日期</td>
                            <td></td>
                        </tr>
                        </thead>
                        <tbody></tbody>
                        <tfoot></tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
[#include "../../include/bottom_bar.ftl"]
<!-- Javascript files -->
<!-- jQuery -->
<script type="text/javascript" src="${base!}/static/js/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script type="text/javascript" src="${base!}/static/plugins/bootstrap/js/bootstrap.min.js"></script>
<script>
    $(function () {
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
        } else {
            return true;
        }
    }

    $(document).ready(function () {
        var $button = $(".apply-exam-btn");
        $button.each(function () {
            $(this).click(function () {
                location.href = "examing?id=" + $(this).attr("data-id");
            });
        });
    });
</script>
</body>
</html>