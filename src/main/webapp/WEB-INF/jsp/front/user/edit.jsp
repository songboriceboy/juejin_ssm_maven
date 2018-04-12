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
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/assets/uikit-2.25.0/css/uikit.almost-flat.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/jquery/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/assets/uikit-2.25.0/js/components/tooltip.js"></script>
    <script src="${pageContext.request.contextPath}/assets/uikit-2.25.0/js/uikit.min.js"></script>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/uikit-2.25.0/css/components/form-file.almost-flat.css" rel="stylesheet">
    <script>
        function upfile(){
            var pic=document.getElementsByTagName('input')[0].files[0];
            var fd=new FormData();
            var xhr=new XMLHttpRequest();
            xhr.open('post','${pageContext.request.contextPath}/user/upload_avatar',true);
            xhr.onreadystatechange=function (){
                if(this.readyState==4){
                    var res = JSON.parse(this.responseText);
                    document.getElementById('avatar').src = '${pageContext.request.contextPath}/avatar/' + res.src;
                }
            }

            fd.append('file',pic);
            xhr.send(fd);
        }
    </script>
</head>
<body>

<%@include file="../common/header.jsp"%>
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
                            <h1>个人资料</h1>
                            <ul class="uk-list">
                                <li class="uk-margin-large-bottom">
                                    <div class="uk-form-file">
                                        <img id = "avatar" src="https://user-gold-cdn.xitu.io/2018/2/22/161bc4cd96f02929?imageView2/1/w/90/h/90/q/85/format/webp/interlace/1">
                                        <input type="file" name="pic" onchange="upfile();"/>
                                    </div>
                                </li>
                                <li class="uk-grid">

                                    <span class="uk-width-1-10">昵称</span>

                                    <input spellcheck="false" placeholder="填写你的昵称" class="uk-width-7-10">
                                    <div class="uk-width-2-10">
                                        <button  tabindex="-1" class="btn confirm-btn">保存</button>
                                        <button  tabindex="-1" class="btn cancel-btn">取消</button>
                                    </div>

                                </li>
                                <li class="uk-grid">

                                    <span class="uk-width-1-10">昵称</span>

                                    <input spellcheck="false" placeholder="填写你的昵称" class="uk-width-7-10">
                                    <div class="uk-width-2-10">
                                        <button  tabindex="-1" class="btn confirm-btn">保存</button>
                                        <button  tabindex="-1" class="btn cancel-btn">取消</button>
                                    </div>

                                </li>
                                <li class="uk-grid">

                                    <span class="uk-width-1-10">昵称</span>

                                    <input spellcheck="false" placeholder="填写你的昵称" class="uk-width-7-10">
                                    <div class="uk-width-2-10">
                                        <button  tabindex="-1" class="btn confirm-btn">保存</button>
                                        <button  tabindex="-1" class="btn cancel-btn">取消</button>
                                    </div>

                                </li>
                                <li class="uk-grid">

                                    <span class="uk-width-1-10">昵称</span>

                                    <input spellcheck="false" placeholder="填写你的昵称" class="uk-width-7-10">
                                    <div class="uk-width-2-10">
                                        <button  tabindex="-1" class="btn confirm-btn">保存</button>
                                        <button  tabindex="-1" class="btn cancel-btn">取消</button>
                                    </div>

                                </li>
                                <li class="uk-grid">

                                    <span class="uk-width-1-10">昵称</span>

                                    <input spellcheck="false" placeholder="填写你的昵称" class="uk-width-7-10">
                                    <div class="uk-width-2-10">
                                        <button  tabindex="-1" class="btn confirm-btn">保存</button>
                                        <button  tabindex="-1" class="btn cancel-btn">取消</button>
                                    </div>

                                </li>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>