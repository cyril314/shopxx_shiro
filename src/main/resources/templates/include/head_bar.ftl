<header>
    <div class="container">
        <div class="row">
            <div class="col-xs-5">
                <div class="logo">
                    <h1><a href="#"><img alt="" src="${base!}/static/img/logo.png"></a></h1>
                </div>
            </div>
            <div class="col-xs-7" id="login-info">
                <#if current??>
                <div id="login-info-user">
                    <a href="user-detail" id="system-info-account" target="_blank">${current.username}</a>
                    <span>|</span>
                    <a href="${base!}/logout"><i class="fa fa-sign-out"></i> 退出</a>
                </div>
                <#else>
                <a class="btn btn-primary" href="user-register">用户注册</a>
                <a class="btn btn-success" href="${base!}/login">登录</a>
                </#if>
            </div>
        </div>
    </div>
</header>
<!-- Navigation bar starts -->
<div class="navbar bs-docs-nav" role="banner">
    <div class="container">
        <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
            <ul class="nav navbar-nav">
                <li <#if current_index == 1>class="active"</#if>>
                    <a href="${base!}/index"><i class="fa fa-home"></i>主页</a>
                </li>
                <#if current??>
                    <li <#if current_index == 2> class="active" </#if>>
                        <a href="${base!}/book/practice/index"><i class="fa fa-edit"></i>试题练习</a>
                    </li>
                    <li <#if current_index == 3> class="active" </#if>>
                        <a href="${base!}/book/exam/index"><i class="fa  fa-paper-plane-o"></i>在线考试</a>
                    </li>
                    <li <#if current_index == 4> class="active" </#if>>
                        <a href="${base!}/book/member/index"><i class="fa fa-dashboard"></i>会员中心</a>
                    </li>
                    <li <#if current_index == 5> class="active" </#if>>
                        <a href="${base!}/book/member/index"><i class="fa fa-cogs"></i>个人设置</a>
                    </li>
                </#if>
            </ul>
        </nav>
    </div>
</div>
<!-- Navigation bar ends -->