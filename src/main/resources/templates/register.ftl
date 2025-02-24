<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
    <meta charset="utf-8">
    <title>ExamStack 登录系统</title>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta http-equiv="keywords" content="${seo_title}"/>
    <meta http-equiv="description" content="${seo_title}"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" href="${base!}/favicon.ico"/>
    <link rel="stylesheet" href="${base!}/static/plugins/bootstrap/css/bootstrap-huan.css">
    <link rel="stylesheet" href="${base!}/static/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${base!}/static/css/style.css">
    <link rel="stylesheet" href="${base!}/static/css/common.css">
    <script type="text/javascript" src="${base!}/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="${base!}/static/js/jquery.validate.js"></script>
    <script type="text/javascript" src="${base!}/static/js/rsa.js"></script>
    <script type="text/javascript" src="${base!}/static/js/base64.js"></script>
    <script type="text/javascript" src="${base!}/static/js/common.js"></script>
    <style type="text/css">
        .form-group {
            margin-bottom: 5px;
            height: 59px;
        }

        .form-horizontal .control-label {
            padding-top: 0px;
        }
    </style>
    <script>
        $(document).ready(function () {
            if (window != top) {
                top.location.href = location.href;
            }
            var $loginForm = $("#regForm");
            var $username = $("#username");
            var $password = $("#password");
            var $submit = $(":submit");
            // 表单验证、记住用户名
            $loginForm.validate({
                submitHandler: function (form) {
                    $.ajax({
                        url: "${base!}/login_key",
                        type: "GET",
                        dataType: "json",
                        cache: false,
                        beforeSend: function () {
                            $submit.prop("disabled", true);
                        },
                        success: function (data) {
                            var rsaKey = new RSAKey();
                            rsaKey.setPublic(b64tohex(data.modulus), b64tohex(data.exponent));
                            var enPassword = hex2b64(rsaKey.encrypt($password.val()));
                            $.ajax({
                                url: $loginForm.attr("action"),
                                type: "POST",
                                data: {
                                    username: $username.val(),
                                    password: enPassword
                                },
                                dataType: "json",
                                cache: false,
                                success: function (message) {
                                    $submit.prop("disabled", false);
                                    if (message.code == 0) {
                                        <#if redirectUrl??>
                                        location.href = "${redirectUrl}";
                                        <#else>
                                        location.href = "${base!}../../index";
                                        </#if>
                                    } else {
                                        $.message("error", message.msg);
                                    }
                                }
                            });
                        }
                    });
                }
            });
        });
    </script>
</head>
<body>
<#include "./include/head_bar.ftl" encoding="utf8"/>
<div class="content">
    <div class="container" style="margin: 10% 0;">
        <div class="row">
            <div class="col-md-12">
                <div class="lrform">
                    <h5>注册ExamStack</h5>
                    <div class="form">
                        <!-- Login form (not working)-->
                        <form id="regForm" class="form-horizontal" action="/reg_submit" method="post">
                            <!-- Username -->
                            <div class="form-group">
                                <label class="control-label col-md-3" for="username">用户名</label>
                                <div class="col-md-9">
                                    <input id="username" type="text" class="form-control" name="j_username"/>
                                </div>
                            </div>
                            <!-- Password -->
                            <div class="form-group">
                                <label class="control-label col-md-3" for="password">密码</label>
                                <div class="col-md-9">
                                    <input id="password" type="password" class="form-control" name="j_password"/>
                                </div>
                            </div>
                            <!-- Buttons -->
                            <div class="form-group">
                                <!-- Buttons -->
                                <div class="col-md-9 col-md-offset-3">
                                    <button type="submit" class="btn btn-default"> 注册</button>
                                    <button type="reset" class="btn btn-default"> 取消</button>
                                    <span class="form-message"></span>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="copy">
                    <p>
                        ExamStack Copyright © <a href="http://www.examstack.com/" target="_blank">ExamStack</a> -
                        <a href="login" target="_blank">主页</a>|
                        <a href="http://www.examstack.com/" target="_blank">关于我们</a> |
                        <a href="http://www.examstack.com/" target="_blank">FAQ</a> |
                        <a href="http://www.examstack.com/" target="_blank">联系我们</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Slider Ends -->
<!-- Javascript files -->
<!-- Bootstrap JS -->
<script type="text/javascript" src="${base!}/static/plugins/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>