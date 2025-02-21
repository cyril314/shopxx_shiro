<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
    <meta charset="utf-8">
    <title>后台系统</title>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta http-equiv="keywords" content="${seo_title}"/>
    <meta http-equiv="description" content="${seo_title}"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" href="${base!}/favicon.ico"/>
    <link rel="stylesheet" href="${base!}/static/css/common.css">
    <link rel="stylesheet" href="${base!}/static/plugins/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="${base!}/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="${base!}/static/js/jquery.validate.js"></script>
    <script type="text/javascript" src="${base!}/static/js/rsa.js"></script>
    <script type="text/javascript" src="${base!}/static/js/base64.js"></script>
    <script type="text/javascript" src="${base!}/static/js/common.js"></script>
    <script>
        $(document).ready(function () {
            if (window != top) {
                top.location.href = location.href;
            }
            var $loginForm = $("#loginForm");
            var $username = $("#username");
            var $password = $("#password");
            var $submit = $(":submit");
            // 表单验证、记住用户名
            $loginForm.validate({
                submitHandler: function (form) {
                    $.ajax({
                        url: "${base!}/admin/login_key",
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
<body class="login_bg">
<div id="large-header" class="large-header login-page" style="height: 920px;">
    <canvas id="demo-canvas" width="1317" height="920"></canvas>
    <div class="login-form">
        <div class="login-content">
            <h2 class="title_name">后台登录管理</h2>
            <form method="post" id="loginForm" action="/admin/login_submit" class="login_padding">
                <div class="form-group clearfix">
                    <div class="input-group">
                        <div class="input-group-addon"><i class="icon_user"></i></div>
                        <input type="text" class="form-control" name="j_username" id="username" autocomplete="off"/>
                    </div>
                </div>
                <div class="form-group clearfix">
                    <div class="input-group">
                        <div class="input-group-addon"><i class="icon_password"></i></div>
                        <input type="password" class="form-control" name="j_password" id="password" autocomplete="off"/>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-danger btn-block btn-login"> 登陆</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="copy">
                    <p>
                        Shop Copyright © <a href="#" target="_blank">SHOP</a> -
                        <a href="/" target="_blank">主页</a>|
                        <a href="#" target="_blank">关于我们</a> |
                    </p>
                </div>
            </div>
        </div>
    </div>
</footer>
</body>
</html>