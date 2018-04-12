<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/15
  Time: 12:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>hello</title>
    <meta name="viewport"
          content="width=device-width,user-sctag-item=no,initial-scale=1, minimum-scale=1, maximum-scale=1">
    <%@include file="common/common_css_js_include.jsp"%>
<style>
    body {
        background-color: #F4F5F5;
    }

    .firstPageOfLog .interval {
        height: 0.46296rem;
    }

    .uk-panel-box {
        border: 0;
        background-color: white;

    }

    .uk-position-relative, .uk-position-relative li {
        display: inline-block;
    }

    .uk-position-relative li {
        padding-left: 0.92593rem;
        font-size: 0.27778rem;
    }

    .draft {
        color: #9D9090;
    }

    .writeArticle {
        padding: 0;
        background-color: white;
        /*border: 1px solid red;*/
        height: 0.92593rem;
        line-height: 0.92593rem;
    }

    .writeArticle img {
        width: 0.92593rem;
        height: 0.92593rem;
        display: inline-block;
    }

    .writeArticle ul li {
        display: inline-block;
        margin-left: 0.37037rem;
    }

    .writeArticle ul {
        margin-top: -1px;
    }

    .firstPageOfLog .option ul .select {
        display: inline-block;
        border-right: 1px solid #EAEAEA;

        padding-right: 0.25926rem;
        margin-left: 0.18519rem;
    }

    .firstPageOfLog .option ul li:hover a {
        color: #007FFF;
        text-decoration: none;
    }

    .firstPageOfLog .option ul li a {
        color: #909090;
    }

    .firstPageOfLog .option {
        border-radius: 0;
        padding: 0.11111rem;
        border-bottom: 1px solid #F5F5F5;
    }

    .firstPageOfLog .option ul .first {
        color: #007FFF;
    }

    .firstPageOfLog .rank, .firstPageOfLog .rank li {
        display: inline-block;
    }

    .firstPageOfLog .rank {
        padding-left: 6.85185rem;
    }

    .firstPageOfLog .rank li {
        border: 0px solid white;
        padding-right: 0.25926rem;
        margin-left: 0.18519rem;

    }

    .firstPageOfLog .rank .cicle {
        display: inline-block;
        border: 1px solid #AFB8C2;
        border-radius: 100%;
        margin-bottom: 0.07407rem;
    }

    .firstPageOfLog .text .cicle {
        display: inline-block;
        border: 1px solid #AFB8C2;
        border-radius: 100%;
        margin-bottom: 0.07407rem;
    }

    .firstPageOfLog .text span {
        font-size: 0.22222rem;
        padding: 0 0.11111rem;
        color: #B2BAC2;
    }

    .firstPageOfLog .text .special-column {
        color: #B71ED7;
    }

    .firstPageOfLog .text .content-title {
        color: black;
        font-size: 0.33333rem;
    }

    .firstPageOfLog .text .content {
        margin-top: 0.11111rem;
    }

    .firstPageOfLog .text a {
        border-bottom: 1px solid #F5F5F5;
    }

    .firstPageOfLog .buttonGroup .pic {
        padding: 0.11111rem 0.18519rem;
        border: 1px solid #EDEEEF;
    }

    .firstPageOfLog .buttonGroup .pic:hover {
        background-color: #EAEAEA;
    }

    .firstPageOfLog .buttonGroup .count {
        margin-left: 0.03704rem;
    }

    .firstPageOfLog .buttonGroup {
        margin-top: 0.18519rem;
    }

    .firstPageOfLog .buttonGroup .share {
        margin-left: 0.27778rem;
    }

    .firstPageOfLog .buttonGroup .collect, .firstPageOfLog .buttonGroup .share {
        padding: 0.11111rem 0.27778rem;
        border: 1px solid #EDEEEF;
        display: none;
    }

    .firstPageOfLog .buttonGroup .share:hover, .firstPageOfLog .buttonGroup .collect:hover {
        background-color: #EAEAEA;
    }

    .firstPageOfLog .text .guide .author:hover, .firstPageOfLog .text .guide .time:hover, .firstPageOfLog .text .guide .kinds:hover {
        color: #007FFF;
    }

    .firstPageOfLog .text .content .content-title:hover {
        text-decoration: underline;
    }

    .firstPageOfLog .text img {
        width: 1.11111rem;
        height: 1.11111rem;
    }

    .firstPageOfLog .right-part .interest .interestingPeople {
        border-radius: 0;
        border-bottom: 1px solid #F5F5F5;
    }

    .firstPageOfLog .right-part .interest a:hover {
        background-color: #EAEAEA;
    }

    .firstPageOfLog .right-part .interest a img {
        width: 0.74074rem;
        height: 0.74074rem;
        border-radius: 100%;
    }
</style>
    <script>
        window.onload = function (ev) {
            var text=document.getElementById('text');
            var oas=text.getElementsByTagName('a');

            for(var i=0;i<oas.length;i++)
            {
                oas[i].onmouseover=function (ev2) {
                    var spans=this.getElementsByTagName('span');
                    // alert(spans.length);
                    spans[10].style.display='inline';
                    spans[9].style.display='inline';

                }
                oas[i].onmouseout=function (ev2) {
                    var spans=this.getElementsByTagName('span');
                    // alert(spans.length);
                    spans[10].style.display='none';
                    spans[9].style.display='none';
                }
            }
        }
    </script>

</head>
<body>
<%--欢迎您 ${user_info.user_name}--%>
<%--<a href="${pageContext.request.contextPath}/user/login">login</a>--%>
<%--<a href="${pageContext.request.contextPath}/user/reg">reg</a>--%>
<%--<a href="${pageContext.request.contextPath}/topic/new">new topic</a>--%>
<%--<a href="${pageContext.request.contextPath}/">home</a>--%>
<%--<div id="wai">--%>
<%--<div id="nei"></div>--%>
<%--</div><span id="precent"></span><br/>--%>
<%--<img class="uk-border-circle" id="avatar">--%>
<%--<input type="file" name="pic" onchange="upfile();"/>--%>
<%@include file="common/header.jsp"%>
<div class="firstPageOfLog uk-container uk-container-center">
    <div class="interval"></div>
    <div class="uk-grid">
        <div class="uk-width-medium-3-4">

            <div class="writeArticle uk-panel uk-panel-box ">
                <img src="ef3ce67f21b1f3b0c7a8d89288ebc33a.jpg" class="uk-float-left">
                <ul class=" uk-list  uk-text-truncate uk-float-left">
                    <li><a href="#" class="uk-icon-pencil-square-o" style="margin-right: 6px"></a><a href="#">写文章</a>
                    </li>
                    <li><a href="#" class="uk-icon-share-square-o" style="margin-right: 6px"></a><a href="#">分享链接</a>
                    </li>
                    <li class="draft uk-position-absolute uk-hidden-small" style="right: 30px">草稿</li>
                </ul>
            </div>
            <div class="interval"></div>

            <!--uikit没有掘金那种选项卡，uikit的都太丑了，我还是用正常css那么写吧-->
            <div class="uk-panel-box uk-panel option">
                <ul class="uk-list uk-list-space uk-text-truncate">
                    <li class="select"><a href="#" class="first">热门</a></li>
                    <li class="select"><a href="#">最新</a></li>
                    <li class="select"><a href="#">评论</a></li>
                    <ul class="rank uk-position-absolute uk-hidden-small" style="right: 15px;top:18px">
                        <li><a href="#">本周最热</a></li>
                        <div class="cicle">

                        </div>
                        <li><a href="#">本月最热</a></li>
                        <div class="cicle">

                        </div>
                        <li><a href="#">历史最热</a></li>
                    </ul>
                </ul>
            </div>
            <div class="text uk-grid-collapse" id="text">
                <a class=" uk-panel uk-panel-box uk-panel-hover ">
                    <div class="guide uk-text-truncate">
                        <span class="special-column">专栏</span>
                        <div class="cicle">

                        </div>
                        <span class="author">蚂蚁金服数据体验技术</span>
                        <div class="cicle">

                        </div>
                        <span class="time">5小时前</span>
                        <div class="cicle">

                        </div>
                        <span class="kinds">ios</span>
                    </div>
                    <div class="uk-text-truncate content uk-text-bold">
                        <span class="content-title">我们需要注意的immutable操作</span>
                    </div>
                    <div class="buttonGroup">
                        <span class="uk-icon-heart pic uk-text-bold">
                            <span class="count uk-text-bold">100</span>
                        </span>
                        <span class="uk-icon-file pic uk-text-bold">
                            <span class="count uk-text-bold">16</span>
                        </span>
                        <span class="uk-icon-share-alt share"></span><span class="uk-icon-envelope collect"></span>
                    </div>
                    <!--<img src="timg.jpg" >-->
                </a>
                <a class=" uk-panel uk-panel-box uk-panel-hover ">
                    <div class="guide uk-text-truncate">
                        <span class="special-column">专栏</span>
                        <div class="cicle">

                        </div>
                        <span class="author">蚂蚁金服数据体验技术</span>
                        <div class="cicle">

                        </div>
                        <span class="time">5小时前</span>
                        <div class="cicle">

                        </div>
                        <span class="kinds">ios</span>
                    </div>
                    <div class="uk-text-truncate content uk-text-bold">
                        <span class="content-title">我们需要注意的immutable操作</span>
                    </div>
                    <div class="buttonGroup">
                        <span class="uk-icon-heart pic uk-text-bold"><span
                                class="count uk-text-bold">100</span></span><span class="uk-icon-file pic uk-text-bold"><span
                            class="count uk-text-bold">16</span></span>
                        <span class="uk-icon-share-alt share"></span><span class="uk-icon-envelope collect"></span>
                    </div>
                    <!--<img src="timg.jpg" >-->
                </a>
                <a class=" uk-panel uk-panel-box uk-panel-hover ">
                    <div class="guide uk-text-truncate">
                        <span class="special-column">专栏</span>
                        <div class="cicle">

                        </div>
                        <span class="author">蚂蚁金服数据体验技术</span>
                        <div class="cicle">

                        </div>
                        <span class="time">5小时前</span>
                        <div class="cicle">

                        </div>
                        <span class="kinds">ios</span>
                    </div>
                    <div class="uk-text-truncate content uk-text-bold">
                        <span class="content-title">我们需要注意的immutable操作</span>
                    </div>
                    <div class="buttonGroup">
                        <span class="uk-icon-heart pic uk-text-bold"><span
                                class="count uk-text-bold">100</span></span><span class="uk-icon-file pic uk-text-bold"><span
                            class="count uk-text-bold">16</span></span>
                        <span class="uk-icon-share-alt share"></span><span class="uk-icon-envelope collect"></span>
                    </div>
                    <!--<img src="timg.jpg" >-->
                </a>
                <a class=" uk-panel uk-panel-box uk-panel-hover ">
                    <div class="guide uk-text-truncate">
                        <span class="special-column">专栏</span>
                        <div class="cicle">

                        </div>
                        <span class="author">蚂蚁金服数据体验技术</span>
                        <div class="cicle">

                        </div>
                        <span class="time">5小时前</span>
                        <div class="cicle">

                        </div>
                        <span class="kinds">ios</span>
                    </div>
                    <div class="uk-text-truncate content uk-text-bold">
                        <span class="content-title">我们需要注意的immutable操作</span>
                    </div>
                    <div class="buttonGroup">
                        <span class="uk-icon-heart pic uk-text-bold"><span
                                class="count uk-text-bold">100</span></span><span class="uk-icon-file pic uk-text-bold"><span
                            class="count uk-text-bold">16</span></span>
                        <span class="uk-icon-share-alt share"></span><span class="uk-icon-envelope collect"></span>
                    </div>
                    <!--<img src="timg.jpg" >-->
                </a>
                <a class=" uk-panel uk-panel-box uk-panel-hover ">
                    <div class="guide uk-text-truncate">
                        <span class="special-column">专栏</span>
                        <div class="cicle">

                        </div>
                        <span class="author">蚂蚁金服数据体验技术</span>
                        <div class="cicle">

                        </div>
                        <span class="time">5小时前</span>
                        <div class="cicle">

                        </div>
                        <span class="kinds">ios</span>
                    </div>
                    <div class="uk-text-truncate content uk-text-bold">
                        <span class="content-title">我们需要注意的immutable操作</span>
                    </div>
                    <div class="buttonGroup">
                        <span class="uk-icon-heart pic uk-text-bold"><span
                                class="count uk-text-bold">100</span></span><span class="uk-icon-file pic uk-text-bold"><span
                            class="count uk-text-bold">16</span></span>
                        <span class="uk-icon-share-alt share"></span><span class="uk-icon-envelope collect"></span>
                    </div>
                    <!--<img src="timg.jpg" >-->
                </a>
            </div>


        </div>
        <div class="uk-width-medium-1-4 right-part">
            <div class="uk-collapse interest">
                <div class="uk-panel uk-panel-box interestingPeople">
                    <span>你可能感兴趣的人</span>
                </div>
                <a class="uk-panel uk-panel-box uk-panel-box-hover ">
                    <img src="c55ecbaae860a243699b2b7634a0f25a.jpg"
                         class="uk-margin-small-top uk-float-left uk-margin-right">
                    <div class="authorANDsource uk-float-left">
                        <div>hanperi0000</div>
                        <div>utai.com</div>
                    </div>

                </a>
                <a class="uk-panel uk-panel-box uk-panel-box-hover">
                    <img src="cfe62e5071a7393f40064479bbb3ab1d.jpg"
                         class="uk-margin-small-top uk-float-left uk-margin-right">
                    <div class="authorANDsource uk-float-left">
                        <div>西瓜研究所</div>
                        <div>哈哈犀利</div>
                    </div>
                </a>
                <a class="uk-panel uk-panel-box uk-panel-box-hover">
                    <img src="756fbcdea4a13886d90ecd8a7c12bd75.jpg"
                         class="uk-margin-small-top uk-float-left uk-margin-right">
                    <div class="authorANDsource uk-float-left">
                        <div>box</div>
                        <div>牛客网</div>
                    </div>
                </a>
                <a class="uk-panel uk-panel-box uk-panel-box-hover">
                    <img src="timg.jpg" class="uk-margin-small-top uk-float-left uk-margin-right">
                    <div class="authorANDsource uk-float-left">
                        <div>UTF-8</div>
                        <div>网易云</div>
                    </div>
                </a>

            </div>
        </div>
    </div>

</div>

<%--<div class="mb-cover">--%>
<%--<ul class="uk-margin-top" id="topic-list">--%>

<%--</ul>--%>
<%--</div>--%>

<div class="app-cover">
    <div class="b20"></div>
    <!--固定宽度，居中对齐-->
    <div class="uk-container uk-container-center">
        <div class="uk-grid" data-uk-grid-margin="">
            <div class="uk-width-medium-3-4">

                <div class="uk-panel uk-panel-box uk-padding-remove">
                    <ul class="uk-list" id="topic-list">


                    </ul>

                </div>

            </div>

            <div class="uk-width-medium-1-4 uk-hidden-small" id="mb_list_right">

                <div id="ulogin" class="login uk-panel uk-panel-box uk-panel-box-secondary">

                    <div class="uk-text-bold uk-margin-bottom">铸剑-zhujian</div>
                    <form class="uk-form  uk-margin-small-top">
                        <div class="uk-form-row ">
                            <input type="text" placeholder="昵称" class="uk-form-blank uk-form-width-medium ">
                        </div>
                        <div class="uk-form-row">
                            <input type="text" placeholder="邮箱/手机" class="uk-form-blank uk-form-width-medium">
                        </div>
                        <div class="uk-form-row">
                            <input type="password" placeholder="密码（不少于6位）" class="uk-form-blank uk-form-width-medium">
                        </div>

                        <button id="login" class="uk-margin-top uk-button uk-button-primary uk-width-1-1" >立即注册</button>

                    </form>
                    <div class="uk-margin-top">
                        <span class="uk-margin-small-right">第三方登录：</span>
                        <span class="three-part-login ">
                                <i ><a href="#" class="uk-icon-justify uk-icon-github uk-margin-small-left"></a></i>
                                <i ><a href="#" class="uk-icon-justify uk-icon-weixin uk-margin-small-left"></a></i>
                                <i ><a href="#" class="uk-icon-justify uk-icon-weibo uk-margin-small-left"></a></i>
                            </span>

                    </div>
                </div>
                <div class="b20"></div>
                <div class="tag uk-panel uk-panel-box uk-panel-box-secondary">
                    <div>
                        <div class="uk-text-bold uk-text-middle uk-float-left uk-margin-left uk-margin-top">热门标签</div>
                        <div class="uk-float-right uk-margin-right uk-margin-top"><a href="#">查看全部</a></div>
                    </div>
                    <div class="uk-margin-large-top"><hr></div>

                    <div class="uk-margin-top">
                        <div class="tag-item uk-text-center uk-display-inline-block uk-width-1-3 uk-border-rounded uk-margin-left"><a href="#">架构</a></div>
                        <div class="tag-item uk-text-center uk-display-inline-block uk-width-1-3 uk-border-rounded uk-margin-left"><a href="#">开源</a></div>
                    </div>
                    <div class="uk-margin-top">
                        <div class="tag-item  uk-text-center uk-display-inline-block uk-width-1-3 uk-border-rounded uk-margin-left"><a href="#">算法</a></div>
                        <div class="tag-item  uk-text-center uk-display-inline-block uk-width-1-3 uk-border-rounded uk-margin-left"><a href="#">GitHub</a></div>
                    </div>
                    <div class="uk-margin-top">
                        <div class="tag-item  uk-text-center uk-display-inline-block uk-width-1-3 uk-border-rounded uk-margin-left"><a href="#">面试</a></div>
                        <div class="tag-item  uk-text-center uk-display-inline-block uk-width-1-3 uk-border-rounded uk-margin-left"><a href="#">代码规范</a></div>
                    </div>
                    <div class="uk-margin-top">
                        <div class="tag-item  uk-text-center uk-display-inline-block uk-width-1-3 uk-border-rounded uk-margin-left"><a href="#">产品</a></div>
                        <div class="tag-item  uk-text-center uk-display-inline-block uk-width-1-3 uk-border-rounded uk-margin-left"><a href="#">铸剑翻译</a></div>
                    </div>
                </div>



                <!--页脚部分-->
                <div class="uk-panel uk-panel-box uk-panel-box-secondary">
                    <h3 class="uk-panel-title">你可能感兴趣的人</h3>
                    <ul class="uk-list">
                        <li>
                            <img class="uk-align-left uk-border-circle"
                                 src="https://avatars.githubusercontent.com/u/20903311" width="40" height="40">
                            <div>zhangsan</div>
                            <div>前端学徒</div>
                        </li>
                        <li>
                            <img class="uk-align-left uk-border-circle"
                                 src="https://avatars.githubusercontent.com/u/20903311" width="40" height="40">
                            <div>zhangsan</div>
                            <div>前端学徒</div>
                        </li>
                        <li>
                            <img class="uk-align-left uk-border-circle"
                                 src="https://avatars.githubusercontent.com/u/20903311" width="40" height="40">
                            <div>zhangsan</div>
                            <div>前端学徒</div>
                        </li>
                        <li>
                            <img class="uk-align-left uk-border-circle"
                                 src="https://avatars.githubusercontent.com/u/20903311" width="40" height="40">
                            <div>zhangsan</div>
                            <div>前端学徒</div>
                        </li>
                        <li>
                            <img class="uk-align-left uk-border-circle"
                                 src="https://avatars.githubusercontent.com/u/20903311" width="40" height="40">
                            <div>zhangsan</div>
                            <div>前端学徒</div>
                        </li>
                    </ul>

                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/html" id="topic-list-tpl">
    {{each list as topic i}}
    <%--<li class="uk-list uk-list-line uk-clearfix topic uk-margin-top" id="{{topic.topic_id}}">--%>
    <%--{{topic.topic_id}}--%>

    <%--<div class="content">--%>
    <%--<div class="uk-grid">--%>
    <%--<div class="uk-width-5-6">--%>
    <%--<a href="${pageContext.request.contextPath}/topic/show/{{topic.topic_id}}">{{topic.topic_title}}</a>--%>
    <%--<a href="${pageContext.request.contextPath}/topic/modify/{{topic.topic_id}}">修改</a>--%>
    <%--</div>--%>
    <%--<div class="uk-width-1-6 uk-vertical-align uk-text-center">--%>
    <%--{{if topic.comment_count > 0}}--%>
    <%--<span class="uk-badge uk-badge-notification uk-vertical-align-middle">--%>
    <%--{{topic.comment_count}}--%>
    <%--</span>--%>
    <%--{{/if}}--%>
    <%--</div>--%>
    <%--</div>--%>

    <%--<div>--%>
    <%--<span class="node"><a href="javascript:;" section_id = {{topic.section_id}}>{{topic.section_name}}</a></span>--%>
    <%--<span class="split">•</span>--%>
    <%--<span class="author"><a href="${pageContext.request.contextPath}/user/show/{{topic.user_id}}">{{topic.user_name}}</a></span>--%>
    <%--<span class="split">•</span>--%>
    <%--<span class="datetime">{{topic.createtime_str}}</span>--%>
    <%--</div>--%>

    <%--</div>--%>
    <%--</li>--%>

    <li class="app-blog-item" id="{{topic.topic_id}}" >
        {{topic.topic_id}}
        <div class="title uk-text-truncate">
            <a href="${pageContext.request.contextPath}/topic/show/{{topic.topic_id}}">{{topic.topic_title}}</a>
        </div>
        <div>
            <a href="javascript:;" section_id = {{topic.section_id}}>
                                    <span class="topic-cate">
                                        {{topic.section_name}}
                                    </span>
            </a>
            <span>
                      <a href="${pageContext.request.contextPath}/user/show/{{topic.user_id}}">{{topic.user_name}}</a>
              </span>
            <span>
                   {{topic.createtime_str}}
              </span>
            <span>
                   908次阅读
               </span>
        </div>
    </li>
    {{/each}}
</script>
</body>
</html>
