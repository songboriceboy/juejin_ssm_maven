<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/15
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="uk-height-1-1">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,user-scalable=no,initial-scale=1, minimum-scale=1, maximum-scale=1">
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/assets/uikit-2.25.0/css/uikit.almost-flat.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/jquery/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/assets/uikit-2.25.0/js/components/tooltip.js"></script>
    <script src="${pageContext.request.contextPath}/assets/uikit-2.25.0/js/uikit.min.js"></script>
    <style>
        html, h1, h2, h3, h4, h5, h6 {
            font-family: 'Microsoft YaHei',"Helvetica Neue",Helvetica,Arial,sans-serif!important;
        }
        .touch-nav {
            line-height: 40px;
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            z-index: 999999;
            background: #00a8e6 !important;
        }
        a.w1:link, a.w1:visited, a.w1:active, a.w1:hover {
            color: #fff;
            text-decoration: none;
        }

        .uk-navbar
        {
            background: 0;
            border: 0;
            text-shadow: none;
        }

        #top-header {
            background: #fff;
            height: 88px;
            border-bottom: 2px solid green;
            width: 100%

        }

        #top-header .uk-navbar-brand, #top-header .uk-navbar-content{
            height: 88px;
        }

        #top-header .uk-navbar-nav > li > a {
            height: 88px;
            line-height: 88px;
            font-family: "Microsoft Yahei";
            font-size: 16px;
            padding: 0 11px;
        }
        .mb-cover{
            background: #f2f2f2;
        }
        .b20{
            height: 20px;
        }
        .b35{
            height: 35px;
        }
        .uk-panel-box {
            background: #fff !important
        }
        a.b:link, a.b:visited, a.b:active {
            color: #444;
            text-decoration: none
        }

        a.b:hover {
            color: #00a8e6
        }

    </style>
</head>
<body class="uk-height-1-1">
<header class="uk-hidden-small" id="top-header">
    <div class="uk-container uk-container-center">
        <nav class="uk-navbar">
            <a class="uk-navbar-brand" href="http://www.mooban.cn/" title="魔工坊">
                <img src="http://www.mooban.cn/skin/moob/img/logo.png" alt="魔工坊" width="60" height="60">
            </a>
            <ul class="uk-navbar-nav">
                <li><a href="http://www.mooban.cn/">首页</a></li>
                <li class="uk-parent" data-uk-dropdown>
                    <a href="http://www.mooban.cn/down/">模板</a>
                    <div class="uk-dropdown uk-dropdown-width-2 uk-dropdown-navbar" style="width: 200px;">
                        <div class="uk-grid uk-dropdown-grid">
                            <div class="uk-width-1-2">
                                <ul class="uk-nav uk-nav-dropdown uk-panel">
                                    <li class="uk-nav-header">网站</li>
                                    <li><a href="http://www.mooban.cn/down/dt-c5-1.html" target="_blank">Destoon</a></li>
                                    <li><a href="http://www.mooban.cn/down/wp-c48-1.html" target="_blank">WordPress</a></li>
                                    <li><a href="http://www.mooban.cn/down/dede-c31-1.html" target="_blank">DeDeCMS</a></li>
                                    <li><a href="http://www.mooban.cn/down/ec-c7-1.html" target="_blank">ECShop</a></li>
                                    <li><a href="http://www.mooban.cn/down/dz-c56-1.html" target="_blank">Discuz</a></li>
                                    <li><a href="http://www.mooban.cn/down/static-c143-1.html" target="_blank">HTML</a></li>
                                    <li><a href="http://www.mooban.cn/down/qita-c225-1.html" target="_blank">其他模板</a></li>
                                </ul>
                            </div>
                            <div class="uk-width-1-2">
                                <ul class="uk-nav uk-nav-dropdown uk-panel">
                                    <li class="uk-nav-header">APP</li>
                                    <li><a href="http://www.mooban.cn/down/app-c6-1.html" target="_blank">AppCan</a></li>
                                    <li><a href="http://www.mooban.cn/down/ecm-c33-1.html" target="_blank">ECMobile</a></li>
                                    <li><a href="http://www.mooban.cn/down/ect-c66-1.html" target="_blank">ECTouch</a></li>
                                    <li><a href="http://www.mooban.cn/down/pg-c65-1.html" target="_blank">PhoneGap</a></li>
                                    <li><a href="http://www.mooban.cn/down/web-c64-1.html" target="_blank">WebAPP</a></li>
                                    <li><a href="http://www.mooban.cn/down/api-c32-1.html" target="_blank">APICloud</a></li>
                                    <li><a href="http://www.mooban.cn/down/React-c227-1.html" target="_blank">React</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="uk-parent" data-uk-dropdown="">
                    <a href="http://www.mooban.cn/original/">原创</a>

                </li>
                <li class="uk-parent" data-uk-dropdown="">
                    <a href="http://www.mooban.cn/source/">源码</a>

                </li>
                <li class="uk-parent" data-uk-dropdown="">
                    <a href="http://www.mooban.cn/plugin/">插件</a>

                </li>
                <li class="uk-parent" data-uk-dropdown="">
                    <a href="http://www.mooban.cn/material/">素材</a>

                </li>
                <li class="uk-parent" data-uk-dropdown="">
                    <a href="http://school.mooban.cn/">教程</a>

                </li>
                <li class="uk-parent" data-uk-dropdown="">
                    <a href="http://www.mooban.cn/know/">问答</a>

                </li>
                <li class="uk-parent uk-hidden-medium uk-active" data-uk-dropdown="">
                    <a href="http://st.mooban.cn/?fr=mooban" target="_blank">更多</a>

                </li>
            </ul>
            <div id="destoon_member" class="uk-navbar-content uk-navbar-flip top-head-avatar">
                <div class="uk-button-group"><a class="uk-button uk-button-primary uk-margin-right"
                                                href="http://www.mooban.cn/member/register.php">免费注册</a><a
                        class="uk-button uk-button-primary"
                        href="http://www.mooban.cn/member/login.php">立即登录</a></div>
            </div>

        </nav>
    </div>
</header>
<div class="uk-container uk-visible-small touch-nav">
    <nav class="uk-navbar">
        <div class="uk-grid">
            <div class="uk-width-4-6">
                <div class="uk-navbar-brand uk-float-left">
                    <a class="w1" href="http://www.mooban.cn/down/"> <i class="uk-icon-home"></i> 会员 - 魔工坊</a>
                </div>
            </div>
            <div class="uk-width-2-6">
                <nav class="uk-nav">
                    <a href="#offcanvas" class="uk-navbar-toggle uk-float-right w1" data-uk-offcanvas=""></a>
                </nav>
            </div>
        </div>
    </nav>
</div>
<div id="offcanvas" class="uk-offcanvas">
    <div class="uk-offcanvas-bar">
        <ul class="uk-nav uk-nav-offcanvas">
            <li class="uk-active"><a href="http://www.mooban.cn/"><i class="uk-icon-home"></i> 首页</a></li>
            <li><a href="http://www.mooban.cn/down/"><i class="uk-icon-folder-o"></i> 模板</a></li>
            <li><a href="http://www.mooban.cn/original/"><i class="uk-icon-folder-o"></i> 原创</a></li>
            <li><a href="http://www.mooban.cn/source/"><i class="uk-icon-folder-o"></i> 源码</a></li>
            <li><a href="http://www.mooban.cn/plugin/"><i class="uk-icon-folder-o"></i> 插件</a></li>
            <li><a href="http://www.mooban.cn/material/"><i class="uk-icon-folder-o"></i> 素材</a></li>
            <li><a href="http://school.mooban.cn/"><i class="uk-icon-folder-o"></i> 教程</a></li>
            <li><a href="http://www.mooban.cn/know/"><i class="uk-icon-folder-o"></i> 问答</a></li>
        </ul>
    </div>
</div>

<div class="mb-cover uk-height-1-1">
    <div class="b20"></div>
    <div class="uk-container uk-container-center">

        <div class="uk-panel uk-panel-box">
            <div class="uk-grid uk-grid-divider" data-uk-grid-margin="">
                <div class="uk-width-medium-1-2">
                    <div class="uk-grid">
                        <div class="uk-width-1-5"></div>
                        <div class="uk-width-3-5">
                            <div class="uk-panel">
                                <div class="b35"></div>
                                <h1>
                                    <a href="http://www.mooban.cn/member/login.php" class="b"><i
                                            class="uk-icon-user mb-a"></i> 管理员登录</a>
                                </h1>
                                <form id="Dform" class="uk-form" method="post" action="${pageContext.request.contextPath}/admin/login">

                                    <div class="uk-form-row">
                                        <div class="uk-form-icon">
                                            <i class="uk-icon-user"></i>
                                            <input title=""
                                                   class="uk-form-width-large uk-form-large" name="admin_name"
                                                   type="text" id="username" value="" placeholder="请输入账号/邮箱"
                                                   data-cached-title="注意账号或者邮箱地址的格式">
                                        </div>
                                    </div>
                                    <div class="uk-form-row">
                                        <div class="uk-form-icon uk-form-password">
                                            <i class="uk-icon-lock"></i>
                                            <input data-uk-tooltip="{pos:'right',animation:true}" title=""
                                                   maxlength="20" class="uk-form-width-large uk-form-large"
                                                   name="admin_pwd" id="password" type="password" value=""
                                                   placeholder="请输入登录密码" data-cached-title="6-20个字符，区分大小写">
                                        </div>
                                    </div>
                                    <div class="b35"></div>
                                    <div class="uk-form-row">
                                        <button type="submit" name="submit"
                                                class="uk-button uk-button-primary border_radius3 uk-button-large uk-width-1-1"
                                                id="loginBtn">立 即 登 录
                                        </button>
                                    </div>

                                    <div class="b20"></div>

                                    <div class="b35"></div>
                                </form>
                            </div>
                        </div>
                        <div class="uk-width-1-5"></div>
                    </div>
                </div>
                <div class="uk-width-medium-1-2">

                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>
