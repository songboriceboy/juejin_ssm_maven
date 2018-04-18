<%--
  Created by IntelliJ IDEA.
  User: ttc
  Date: 2018/4/18
  Time: 13:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="../common/common_css_js_include.jsp"%>
</head>
<body>
<%@include file="../common/header_only_nav.jsp"%>
<div class="mb-cover">
    <div class="b20"></div>
    <div class="uk-container uk-container-center uk-text-center">
            <img src="${pageContext.request.contextPath}/assets/img/xiongmao.png" width="100" height="100">
            <span>发布成功</span>
            <div class="uk-panel uk-panel-box">
                <a href="${pageContext.request.contextPath}/topic/show/${topic.topic_id}">${topic.topic_title}</a>
            </div>
            <div><a href="${pageContext.request.contextPath}/topic/new" class="uk-button uk-button-primary">继续分享</a></div>
            <div><a href="${pageContext.request.contextPath}/">回到首页</a></div>
    </div>
</div>
</body>
</html>
