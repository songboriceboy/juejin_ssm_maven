<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/19
  Time: 11:05
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
    <%@include file="common/common_css_js_include.jsp"%>
</head>
<body class="uk-height-1-1">

<%@include file="common/header.jsp"%>

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
                                            class="uk-icon-user mb-a"></i> 用户登录</a>
                                </h1>
                                <form id="Dform" class="uk-form" method="post" action="${pageContext.request.contextPath}/user/userlogin">

                                    <div class="uk-form-row">
                                        <div class="uk-form-icon">
                                            <i class="uk-icon-user"></i>
                                            <input title=""
                                                   class="uk-form-width-large uk-form-large" name="user_name"
                                                   type="text" id="username" value="" placeholder="请输入账号/邮箱"
                                                   data-cached-title="注意账号或者邮箱地址的格式">
                                        </div>
                                    </div>
                                    <div class="uk-form-row">
                                        <div class="uk-form-icon uk-form-password">
                                            <i class="uk-icon-lock"></i>
                                            <input data-uk-tooltip="{pos:'right',animation:true}" title=""
                                                   maxlength="20" class="uk-form-width-large uk-form-large"
                                                   name="user_pwd" id="password" type="password" value=""
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
                                    <div class="uk-form-row uk-text-small uk-margin-small-top">
                                        <label class="uk-float-left"
                                               data-uk-tooltip="{pos:'left',animation:true}"
                                               title="选中后，一月内不用再次登录，网吧或公共计算机请勿选"><input type="checkbox"
                                                                                        name="cookietime"
                                                                                        value="1"
                                                                                        id="cookietime"
                                                                                        checked=""> 记住我</label>
                                        <a class="uk-float-right uk-link uk-link-muted"
                                           href="send.php">忘记密码?</a>
                                    </div>
                                    <div class="b20"></div>
                                    <div class="uk-form-row uk-text-center">
                                        <a class="uk-icon-button uk-icon-hover uk-icon-qq"
                                           href="http://www.mooban.cn/api/oauth/qq/connect.php"
                                           data-uk-tooltip="{pos:'bottom',animation:true}" title="QQ登录">
                                        </a> &nbsp;
                                        <a class="uk-icon-button uk-icon-hover uk-icon-weibo"
                                           href="http://www.mooban.cn/api/oauth/sina/connect.php"
                                           data-uk-tooltip="{pos:'bottom',animation:true}" title="微博登录">
                                        </a> &nbsp;
                                        <a class="uk-icon-button uk-icon-hover uk-icon-paw"
                                           href="http://www.mooban.cn/api/oauth/baidu/connect.php"
                                           data-uk-tooltip="{pos:'bottom',animation:true}" title="百度登录">
                                        </a> &nbsp;
                                        <a class="uk-icon-button uk-icon-hover uk-icon-envelope-square"
                                           href="http://www.mooban.cn/api/oauth/netease/connect.php"
                                           data-uk-tooltip="{pos:'bottom',animation:true}" title="网易邮箱">
                                        </a> &nbsp;
                                        <a class="uk-icon-button uk-icon-hover uk-icon-windows"
                                           href="http://www.mooban.cn/api/oauth/msn/connect.php"
                                           data-uk-tooltip="{pos:'bottom',animation:true}" title="微软登录">
                                        </a> &nbsp;
                                        <a class="uk-icon-button uk-icon-hover uk-icon-github"
                                           href="https://github.com/login/oauth/authorize?client_id=dee9dd47e28f78701ccb&state=cx4343kk&redirect_uri=http://www.songbo.info/testgit/auth/github; "
                                           data-uk-tooltip="{pos:'bottom',animation:true}" title="Github">
                                        </a> &nbsp;
                                    </div>
                                    <div class="b35"></div>
                                </form>
                            </div>
                        </div>
                        <div class="uk-width-1-5"></div>
                    </div>
                </div>
                <div class="uk-width-medium-1-2">
                    <div class="uk-grid">
                        <div class="uk-width-1-6"></div>
                        <div class="uk-width-4-6">
                            <div class="b35"></div>
                            <h1 class="uk-text-center uk-margin-large-top">
                                <a href="javascript:;"
                                   class="b">没有账号？立即注册</a>
                            </h1>
                            <a href="${pageContext.request.contextPath}/user/reg" class="uk-button uk-button-large uk-button-success uk-width-1-1">立 即 注 册
                            </a>

                        </div>
                        <div class="uk-width-1-6"></div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>
