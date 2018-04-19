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
    <link href="${pageContext.request.contextPath}/assets/uikit-2.25.0/css/uikit.almost-flat.css?v=0.1" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/jquery/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/assets/uikit-2.25.0/js/components/tooltip.js"></script>
    <script src="${pageContext.request.contextPath}/assets/uikit-2.25.0/js/uikit.min.js"></script>
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    <%@include file="../common/common_css_js_include.jsp"%>
    <script>
        function getUserTag() {
            var req = new XMLHttpRequest();
            req.open('get','${pageContext.request.contextPath}/tag/get_current_user_tags',true);
            req.send();
            req.onload = function () {
                var json = JSON.parse(req.responseText);
                var html = template('user-tag', json);
                document.getElementById('user-tag-ul').innerHTML=html;
            }
        }
        $(function () {
            getUserTag();
            $('.uk-tab').on('change.uk.tab',function (event, item) {
//                alert(item.text());
                if(item.text()=='已关注标签')
                {
                    getUserTag();
                }
            })
        })
    </script>
</head>
<body class="uk-height-1-1">
<%@include file="../common/header_only_nav.jsp"%>
<div class="mb-cover uk-height-1-1">
    <div class="b20"></div>
    <div class="uk-container uk-container-center">
        <ul class="uk-tab" data-uk-tab>
            <li class="uk-active">
                <a href="#">已关注标签</a>
            </li>
            <li>
                <a href="#">全部标签</a>

            </li>
        </ul>
        <ul class="uk-grid uk-margin-large-top" id="user-tag-ul">
        </ul>
    </div>
</div>

<script type="text/html" id="all-tag">
    <ul class="uk-subnav uk-text-large uk-margin-top">
        <li class="uk-active"><a href="#">最热</a></li>
        <li><a href="#">最新</a></li>
        <li><input type="text" placeholder="搜索标签"></li>
    </ul>
    <ul class="uk-grid uk-margin-large-top">
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
</script>

<script type="text/html" id="user-tag">


            {{ each list as tag index}}
            <li class="uk-width-medium-1-4 uk-width-small-1-2 uk-margin-large-bottom">
                <div class="uk-panel uk-panel-box uk-panel-box-secondary uk-text-center">
                    <a>
                        <img src="https://lc-mhke0kuv.cn-n1.lcfile.com/f8ee3cd45f949a546263.png" width="32" height="32">
                        <h2>{{ tag.tag_name}}</h2>
                        <p class="uk-text-muted"><span>{{tag.follow_num}}</span> 关注 <span>{{ tag.article_num}}</span> 文章</p>
                        <button class="uk-button uk-button-primary uk-button-success uk-margin-top">已关注</button>
                    </a>
                </div>
            </li>
            {{/each}}

    </script>
</body>
</html>
