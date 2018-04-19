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

    <header class="uk-background-muted uk-text-center uk-padding">
        <h2 class="uk-margin-large-top uk-text-bold uk-text-large uk-text-muted" style="font-size: 32px;">前端</h2>
        <div class="uk-margin-top uk-text-bold uk-text-muted">
            55关注，22文章
        </div>
    </header>

    <div class="uk-container uk-container-center uk-text-center">
        <nav class="uk-text-left uk-margin-top">
            <img src="https://lc-mhke0kuv.cn-n1.lcfile.com/bac28828a49181c34110.png" width="32" height="32">
            <button class="uk-margin-top-remove uk-margin-left app-tag uk-button uk-button-primary uk-button-success uk-margin-top">已关注</button>

            <ul class="uk-subnav uk-text-large uk-margin-top uk-float-right uk-margin-top-remove" id="tag-nav">
                <li class="uk-active"><a href="#">热门</a></li>
                <li><a href="#">最热</a></li>
                <li><a href="#">最新</a></li>
            </ul>
        </nav>

        <div class="uk-panel-box uk-margin-top">
            <div class="uk-padding ">

            </div>
        </div>

    </div>
</div>

<script type="text/html" id="topic-list-tpl">
    {{each list as topic i}}
    <li class="uk-panel uk-panel-box uk-panel-hover app-blog-item" id="{{topic.topic_id}}" >
        {{topic.topic_id}}
        <ul class="uk-subnav">
            <li class="special-column">专栏</li>
            <li><a href="${pageContext.request.contextPath}/user/show/{{topic.user_id}}">{{topic.user_name}}</a></li>
            <li>{{topic.createtime_str}}</li>
            <li><a href="#">ios</a></li>
            <li class="seperator">/</li>
            <li class="seperator"><a href="#">android</a></li>
        </ul>
        <div class="uk-text-truncate uk-margin-small-top  uk-margin-small-bottom uk-text-bold">
            <a href="${pageContext.request.contextPath}/topic/show/{{topic.topic_id}}">{{topic.topic_title}}</a>
        </div>
        <ul class="uk-subnav uk-subnav-pill">
            <li><a href="#"><i class="uk-icon-heart uk-margin-small-right"></i>123</a></li>
            <li><a href="#"><i class="uk-icon-file uk-margin-small-right"></i>15</a></li>
            <%--<span class="uk-icon-share-alt share"></span>--%>
            <%--<span class="uk-icon-envelope collect"></span>--%>
        </ul>
    </li>
    {{/each}}
</script>
</body>
</html>
