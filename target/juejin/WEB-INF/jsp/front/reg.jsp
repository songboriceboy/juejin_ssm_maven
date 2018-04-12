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
                                    <a href="http://www.mooban.cn/member/register.php" class="b list_cat"><i
                                            class="uk-icon-user mb-a"></i> 用户注册</a>
                                </h1>

                                <form class="uk-form jqtransformdone" action="${pageContext.request.contextPath}/user/reguser" method="post"
                                      target="send" onsubmit="return check();">

                                    <div class="uk-form-row">
                                        <div class="uk-form-icon">
                                            <i class="uk-icon-user" id="dusername"></i>
                                            <input data-uk-tooltip="{pos:'right',animation:true}" maxlength="20"
                                                   onkeyup="value=value.replace(/[^a-z0-9_\-]/g,'')"
                                                   title="4-20个字符，只能使用小写字母(a-z)、数字(0-9)、下划线(_)、中划线(-)，且以字母或数字开头和结尾"
                                                   class="uk-form-width-large uk-form-large"
                                                   name="user_name" id="username"
                                                   onblur="validator('username');" type="text"
                                                   autocomplete="off" placeholder="请输入账号">
                                        </div>
                                    </div>

                                    <div class="uk-form-row">
                                        <div class="uk-form-icon uk-form-password">
                                            <i class="uk-icon-lock" id="dpassword"></i>
                                            <input data-uk-tooltip="{pos:'right',animation:true}" maxlength="20"
                                                   title="" class="uk-form-width-large uk-form-large"
                                                   name="user_pwd" id="password"
                                                   onblur="validator('password');" type="password"
                                                   autocomplete="off" value="" placeholder="请输入密码"
                                                   data-cached-title="6-20个字符，区分大小写，推荐使用数字、字母和特殊符号组合">

                                        </div>
                                    </div>
                                    <div class="uk-form-row">
                                        <div class="uk-form-icon uk-form-password">
                                            <i class="uk-icon-unlock-alt" id="dcpassword"></i>
                                            <input data-uk-tooltip="{pos:'right',animation:true}" maxlength="20"
                                                   title="" class="uk-form-width-large uk-form-large"
                                                   name="user_pwd_again" id="cpassword"
                                                   onblur="validate('cpassword');" type="password"
                                                   autocomplete="off" value="" placeholder="请确认密码"
                                                   data-cached-title="必须和上面输入的密码一样">

                                        </div>
                                    </div>


                                    <div class="uk-form-row">
                                        <button type="submit" name="submit"
                                                class="uk-button uk-button-primary border_radius3 uk-button-large uk-width-1-1"
                                                id="registerBtn">立 即 注 册
                                        </button>
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
                            <div class="uk-panel">
                                <div class="b35"></div>
                                <h1 class="uk-text-center">
                                    <a href="javascript:;"
                                       class="b">我已注册账号</a>
                                </h1>
                                <a href="${pageContext.request.contextPath}/user/login" class="uk-button uk-button-large uk-button-success uk-width-1-1"
                                        >立 即 登 录
                                </a>
                                <div class="b20"></div>
                                <div class="uk-form-row">
                                    <h3 class="uk-margin-bottom-remove"><span
                                            class="uk-text-muted">快捷登录:&nbsp;</span>
                                        <a class="uk-icon-button uk-icon-hover uk-icon-qq"
                                           href="http://www.mooban.cn/api/oauth/qq/connect.php"
                                           data-uk-tooltip="{pos:'bottom',animation:true}" title="QQ登录">
                                        </a>
                                        <a class="uk-icon-button uk-icon-hover uk-icon-weibo"
                                           href="http://www.mooban.cn/api/oauth/sina/connect.php"
                                           data-uk-tooltip="{pos:'bottom',animation:true}" title="微博登录">
                                        </a>
                                        <a class="uk-icon-button uk-icon-hover uk-icon-paw"
                                           href="http://www.mooban.cn/api/oauth/baidu/connect.php"
                                           data-uk-tooltip="{pos:'bottom',animation:true}" title="百度登录">
                                        </a>
                                        <a class="uk-icon-button uk-icon-hover uk-icon-envelope-square"
                                           href="http://www.mooban.cn/api/oauth/netease/connect.php"
                                           data-uk-tooltip="{pos:'bottom',animation:true}" title="网易邮箱">
                                        </a>
                                        <a class="uk-icon-button uk-icon-hover uk-icon-windows"
                                           href="http://www.mooban.cn/api/oauth/msn/connect.php"
                                           data-uk-tooltip="{pos:'bottom',animation:true}" title="微软登录">
                                        </a>
                                        <a class="uk-icon-button uk-icon-hover uk-icon-github"
                                           href="http://www.mooban.cn/api/oauth/github/connect.php"
                                           data-uk-tooltip="{pos:'bottom',animation:true}" title="Github">
                                        </a>
                                    </h3>
                                </div>

                            </div>
                        </div>
                        <div class="uk-width-1-6"></div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<script>
    function check() {

        var username = document.getElementById('username');
        if (username.value == '') {

            alert("请填写用户登录名");
            return false;
        }

        var pwd = document.getElementById('password');
        if (pwd.value.length < 6) {
            alert("用户登录密码不能低于6位");
            return false;
        }

        var pwd_again = document.getElementById('cpassword');
        if ($.trim(pwd_again.value).length > 1 && pwd.value != pwd_again.value) {
            alert("两次输入密码不一致");
            return false;
        }
        return true;
    }
</script>
</body>
</html>
