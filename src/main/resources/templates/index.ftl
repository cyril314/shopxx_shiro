<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
    <meta charset="utf-8">
    <title>${seo_title}</title>
    <meta http-equiv="keywords" content="${seo_title}"/>
    <meta http-equiv="description" content="${seo_title}"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="shortcut icon" href="${base!}/favicon.ico"/>
    <link rel="stylesheet" href="${base!}/static/plugins/bootstrap/css/bootstrap-huan.css">
    <link rel="stylesheet" href="${base!}/static/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${base!}/static/css/style.css">
    <style>
        .content ul.question-list-knowledge {
            padding: 8px 20px;
        }

        .col-xs-3 {
            width: 22%;
        }
    </style>
</head>
<body>
<#include "./include/head_bar.ftl" encoding="utf8"/>
<!-- Slider starts -->
<div class="full-slider">
    <!-- Slider (Flex Slider) -->
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="flexslider">
                    <div class="flex-caption">
                        <!-- Left column -->
                        <div class="col-l">
                            <p style="text-indent:2em;">
                                ExamStack是国内首款一款基于JAVA与MYSQL开发的网络考试系统。它可以稳定、顺畅的运行在Windows与Linux平台上。您可以通过它快捷方便的创建试题和题库，发布试卷，组织考试，系统自动批改。高度的可配置性和灵活性使得它可以被应用于很多领域。
                            </p>
                            <p style="text-indent:2em;"> 软件采用GPL协议，完全开放且免费，并且有固定的开发团队提供技术支持 </p>
                        </div>
                        <!-- Right column -->
                        <div class="col-r">
                            <!-- Use the class "flex-back" to add background inside flex slider -->
                            <!-- <img alt="" src="../static/images/ad.png"> -->
                            <p> 如果您对软件有任何反馈和建议，加入我们的QQ群152258375一起讨论吧 </p>
                            <!-- Button -->
                            <a class="btn btn-default btn-cta" href="user-register">
                                <i class="fa fa-arrow-circle-down"></i> 马上加入我们吧
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="content" style="padding:30px 0 0 0;">
    <div class="container">
        <div class="row">
            <a class="select-test col-xs-4 home-link-anchor" href="student/practice-list">
                <div class="select-test-icon">
                    <i class="fa fa-book"></i>
                </div>
                <h3> 试题练习 </h3>
                <p> 您可以免费获取对应专业的培训视频或者文档资料，通过在线练习可以考察您的知识掌握程度。 </p>
            </a>
            <a class="select-test col-xs-4 home-link-anchor" href="exam-list">
                <div class="select-test-icon">
                    <i class="fa fa-trophy"></i>
                </div>
                <h3> 在线考试 </h3>
                <p> 参加正式或者模拟考试，您的教师可以发布正式的考试，您也可以主动申请这些考试 </p>
            </a>
            <div class="select-test col-xs-4">
                <div>
                    <h3> 快速考试入口 </h3>
                    <p> 通过已有的准考证快速参加考试，具体的准考证请从相关教师处获取，或者在个人中心的考试信息中查找 </p>
                </div>
                <div style="text-align: center;margin-top:20px;">
                    <a class="btn btn-info quick-start-btn" href="quick-start">快速考试入口 <i class="fa fa-arrow-circle-o-right"></i> </a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="content" style="padding:30px 0 100px 0;background-color: rgb(246, 249, 250);">
    <div class="container">
        <div style="margin-bottom: 10px;">
            <h3>专业领域</h3>
            <p> 我们提供多种专业课程供你学习 </p>
        </div>
        <div class="row">
            <a class="field-category-div col-xs-3 home-link-anchor">
                <div class="field-category-title" style="background-color: #E97051;">
                    <div class="field-category-inner">
                        <i class="fa fa-medkit"></i>
                    </div>
                    <div class="field-category-text ">
                        <p> 医药行业考试 </p>
                    </div>
                </div>
                <div class="field-category-footer">
                    <div class="field-category-footer-sub">
                        <p class="field-student-subtitle"> 医药行业考试 </p>
                    </div>
                    <div class="field-category-footer-sub">
                        <i class="fa fa-users"></i>
                        <span class="field-student-num">412</span> 名学员
                    </div>
                </div>
            </a>
            <a class="field-category-div col-xs-3 home-link-anchor">
                <div class="field-category-title" style="background-color: #5C78B9;">
                    <div class="field-category-inner">
                        <i class="fa fa-trophy"></i>
                    </div>
                    <div class="field-category-text ">
                        <p> 公务员申论 </p>
                    </div>
                </div>
                <div class="field-category-footer">
                    <div class="field-category-footer-sub">
                        <p class="field-student-subtitle"> 公务员申论 </p>
                    </div>
                    <div class="field-category-footer-sub">
                        <i class="fa fa-users"></i>
                        <span class="field-student-num">2143</span> 名学员
                    </div>
                </div>
            </a>
            <a class="field-category-div col-xs-3 home-link-anchor">
                <div class="field-category-title" style="background-color: #5BA276;">
                    <div class="field-category-inner">
                        <i class="fa fa-car"></i>
                    </div>
                    <div class="field-category-text ">
                        <p> 驾校考试科目一 </p>
                    </div>
                </div>
                <div class="field-category-footer">
                    <div class="field-category-footer-sub">
                        <p class="field-student-subtitle"> 驾校考试科目一 </p>
                    </div>
                    <div class="field-category-footer-sub">
                        <i class="fa fa-users"></i>
                        <span class="field-student-num">1213</span> 名学员
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>
<div class="content" style="padding:30px 0 100px 0;">
</div>
<#include "./include/bottom_bar.ftl" encoding="utf8"/>
<!-- Slider Ends -->
<!-- Javascript files -->
<!-- jQuery -->
<script type="text/javascript" src="${base!}/static/js/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script type="text/javascript" src="${base!}/static/plugins/bootstrap/js/bootstrap.min.js"></script>
<script>
    $(function () {
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
        } else {
            return true;
        }
    }

    function bindQuestionKnowledage() {
        $(".knowledge-title").click(function () {
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
