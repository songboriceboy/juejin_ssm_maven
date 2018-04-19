<%--
  Created by IntelliJ IDEA.
  User: ttc
  Date: 2018/4/19
  Time: 12:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="uk-height-1-1">
<head>
    <title>Title</title>
    <%@include file="../common/common_css_js_include.jsp"%>
</head>
<body class="uk-height-1-1">
<%@include file="../common/header_only_nav.jsp"%>
<div class="mb-cover uk-height-1-1">
    <div class="b20"></div>
    <div class="uk-container uk-container-center uk-text-center">
        <img src="${pageContext.request.contextPath}/assets/img/xiongmao.png" width="100" height="100">
        <div class="uk-margin-top uk-text-bold uk-text-large uk-text-muted">发布成功,有了你的分享，掘金会变得更好</div>
        <div class="uk-grid">
            <div class="uk-width-1-4">

            </div>
            <div class="uk-width-1-2">
                <div class="uk-panel-box uk-margin-large-top">
                    <div class="uk-padding ">
                        <a class="uk-text-large" href="${pageContext.request.contextPath}/topic/show/${topic.topic_id}">${topic.topic_title}</a>
                    </div>
                </div>
            </div>
            <div class="uk-width-1-4">

            </div>
        </div>

        <div class="uk-margin-large-top"><a href="${pageContext.request.contextPath}/topic/new" class="uk-button uk-button-primary">继续分享</a></div>
        <div class="uk-margin-top"><a class="uk-margin-top uk-text-large" href="${pageContext.request.contextPath}/">回到首页</a></div>
    </div>
</div>
</body>
</html>
