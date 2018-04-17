<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/22
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,user-scalable=no,initial-scale=1, minimum-scale=1, maximum-scale=1">
    <link href="${pageContext.request.contextPath}/assets/uikit-2.25.0/css/components/form-file.almost-flat.css" rel="stylesheet">

    <title>Title</title>
    <%@include file="../common/common_css_js_include.jsp"%>
    <script>
        function upfile() {
            var pic = document.getElementsByTagName('input')[0].files[0];
            var fd = new FormData();
            var xhr = new XMLHttpRequest();
            xhr.open('post', '${pageContext.request.contextPath}/user/upload_avatar', true);
            xhr.onreadystatechange = function () {
                if (this.readyState == 4) {
                    var res = JSON.parse(this.responseText);
                    document.getElementById('avatar').src = '${pageContext.request.contextPath}/avatar/' + res.src;
                }
            }

            fd.append('file', pic);
            xhr.send(fd);
        }
    </script>
</head>
<body>

<%@include file="../common/header_only_nav.jsp" %>
<!--整体背景-->
<div class="mb-cover">
    <div class="b20"></div>
    <!--固定宽度，居中对齐-->
    <div class="uk-container uk-container-center">
        <div class="uk-grid" data-uk-grid-margin="">
            <div class="uk-width-medium-3-4">
                <div id="mb_member_left">
                    <div class="uk-panel uk-panel-box uk-text-center">
                        <div class="view setting-profile-view">
                            <form class="uk-form uk-form-horizontal">
                                <h1>个人资料</h1>
                                <div>点击头像上传</div>
                                <div class="uk-form-row uk-margin-large-bottom">
                                    <div class="uk-form-file">
                                        <img id="avatar"
                                             src="https://user-gold-cdn.xitu.io/2018/2/22/161bc4cd96f02929?imageView2/1/w/90/h/90/q/85/format/webp/interlace/1">
                                        <input type="file" name="pic" onchange="upfile();"/>
                                    </div>
                                </div>
                                <div class="uk-form-row">
                                    <label class="uk-width-1-10 uk-margin-right">用户昵称</label>
                                    <input placeholder="填写你的昵称" class="uk uk-form-large uk-width-8-10">
                                    <button tabindex="-1" class="uk-width-1-10 uk-button-link">保存</button>
                                </div>
                                <div class="uk-form-row">
                                    <label class="uk-width-1-10 uk-margin-right">用户职位</label>
                                    <input placeholder="填写你的职位" class="uk uk-form-large uk-width-8-10">
                                    <button tabindex="-1" class="uk-width-1-10 uk-button-link">保存</button>
                                </div>
                                <div class="uk-form-row">
                                    <label class="uk-width-1-10 uk-margin-right">所在公司</label>
                                    <input placeholder="填写你的公司" class="uk uk-form-large uk-width-8-10">
                                    <button tabindex="-1" class="uk-width-1-10 uk-button-link">保存</button>
                                </div>
                                <div class="uk-form-row">
                                    <label class="uk-width-1-10 uk-margin-right">个人介绍</label>
                                    <input placeholder="填写你的个人介绍" class="uk uk-form-large uk-width-8-10">
                                    <button tabindex="-1" class="uk-width-1-10 uk-button-link">保存</button>
                                </div>
                                <div class="uk-form-row">
                                    <label class="uk-width-1-10 uk-margin-right">个人主页</label>
                                    <input placeholder="填写你的个人主页" class="uk uk-form-large uk-width-8-10">
                                    <button tabindex="-1" class="uk-width-1-10 uk-button-link">保存</button>
                                </div>
                            </form>

                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>