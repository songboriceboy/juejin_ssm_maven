<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/1
  Time: 22:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="uk-height-1-1">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,user-scalable=no,initial-scale=1, minimum-scale=1, maximum-scale=1">
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/assets/uikit-2.25.0/css/uikit.almost-flat.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/jquery/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/assets/uikit-2.25.0/js/components/tooltip.js"></script>
    <script src="${pageContext.request.contextPath}/assets/uikit-2.25.0/js/uikit.min.js"></script>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    <%@include file="../common/common_css_js_include.jsp"%>
</head>
<body>
<%@include file="../common/header.jsp"%>
<div class="mb-cover uk-height-1-1">
    <div class="b20"></div>
    <div class="uk-container uk-container-center">
        <ul class="uk-grid ">
            <c:forEach items="${tags}" var="tag">
                <li class="uk-width-medium-1-4 uk-width-small-1-2 uk-margin-large-bottom">
                    <div class="uk-panel uk-panel-box uk-panel-box-secondary uk-text-center">
                        <a>
                            <img src="https://lc-mhke0kuv.cn-n1.lcfile.com/f8ee3cd45f949a546263.png" width="32" height="32">
                            <h2>${tag.tag_name}</h2>
                            <p class="uk-text-muted"><span>38699</span> 关注 <span>${tag.article_num}</span> 文章</p>
                            <button class="uk-button uk-button-primary uk-button-success uk-margin-top">已关注</button>
                        </a>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
</body>
</html>
