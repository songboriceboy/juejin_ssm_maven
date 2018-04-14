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

    <link href="${pageContext.request.contextPath}/assets/uikit-2.25.0/css/uikit.almost-flat.css" rel="stylesheet">
    <%@include file="common/common_css_js_include.jsp"%>

    <script type="text/javascript">
        var isNoMore = false;
        var iiLoading=null;
        var curr_req_id = 0;
        var g_sid = 0;
        function refresh(loadmore) {
            $(window).scroll(function(){
                console.log('正在滑动f');

                var scrollTop = $(this).scrollTop();    //滚动条距离顶部的高度
                var scrollHeight = $(document).height();   //当前页面的总高度
                var clientHeight = $(this).height();    //当前可视的页面高度
                // console.log("top:"+scrollTop+",doc:"+scrollHeight+",client:"+clientHeight);
                if(!isNoMore&&(scrollTop + clientHeight >= scrollHeight)){   //距离顶部+当前高度 >=文档总高度 即代表滑动到底部
                    console.log('下拉');
                    if(loadmore){
                        var last_id = $('#topic-list .app-blog-item:last-child').attr('id');
//                        alert(last_id);
                        loadmore(last_id);
                    }
                }
            });
        }

        $(function () {

            $('#login-btn').on('click', function() {

                        layer.open({
                            type: 1,
                            skin: 'layui-layer-lan',
                            shadeClose: true, //点击遮罩关闭层
                            area: ['320px', '320px'],
                            content: $('#ulogin')//弹框显示的url
                        });
                    }
            );

            refresh(function (last_id) {

                if(last_id == undefined)
                {
                    return;
                }

                if(curr_req_id == last_id)
                {
                    return;
                }
                curr_req_id = last_id;
                iiLoading = layer.load();
                $.post("${pageContext.request.contextPath}/topic/getpagedtopics",{section_id:g_sid,last_topic_id:last_id}, function (res) {
                    // layer.msg(ret.msg);
                    var data = JSON.parse(res);

                    var html = template('topic-list-tpl', data);
                    $('#topic-list').append(html);
                    layer.close(iiLoading);
                    if(data.list.length == 0)
                    {
                        isNoMore = true;
                        layer.msg('没有了', {
                            time: 500
                        });
                    }
                    curr_req_id = 0;
                });
            });
            getTopicsBySectionID(g_sid);

        })

        function getTopicsBySectionID(sid) {
            g_sid = sid;
            $.post("${pageContext.request.contextPath}/topic/getpagedtopics",{section_id:sid,last_topic_id:0}, function (res) {
                var data = JSON.parse(res);
                var html = template('topic-list-tpl', data);
                $('#topic-list').html('');
                $('#topic-list').append(html);
            });
        }

    </script>
</head>
<body>

<%@include file="common/header.jsp"%>
<div class="app-cover">
    <div class="firstPageOfLog uk-container uk-container-center">
        <div class="b20"></div>
        <div class="uk-grid">
            <div class="uk-width-medium-3-4">

                <div class="writeArticle uk-panel uk-panel-box ">
                    <c:choose>
                        <c:when test="${!empty user_info.user_avatar}">
                            <img
                                    class="uk-float-left" width="40" height="40" title="欢迎您${user_info.user_name}"
                                    src="${pageContext.request.contextPath}/avatar/${user_info.user_avatar}"
                                    alt="掘金">
                        </c:when>
                        <c:otherwise>
                            <img
                                    class="uk-float-left" width="40" height="40" title="欢迎您${user_info.user_name}"
                                    src="https://user-gold-cdn.xitu.io/2017/7/29/e4663a53d6f246bac968c7c2d5d22e60?imageView2/1/w/90/h/90/q/85/format/webp/interlace/1"
                                    alt="掘金">
                        </c:otherwise>
                    </c:choose>
                    <ul class=" uk-list  uk-text-truncate uk-float-left">
                        <li><a href="#" class="uk-icon-pencil-square-o" style="margin-right: 6px"></a><a href="${pageContext.request.contextPath}/topic/new">写文章</a>
                        </li>
                        <li><a href="#" class="uk-icon-share-square-o" style="margin-right: 6px"></a><a href="#">分享链接</a>
                        </li>
                        <li class="draft uk-position-absolute uk-hidden-small" style="right: 30px">草稿</li>
                    </ul>
                </div>

                <div class="b20"></div>
                <div class="uk-panel-box uk-panel uk-padding-bottom-remove">
                    <ul class="uk-subnav uk-subnav-line uk-display-inline-block">
                        <li class="uk-active"><a href="#">热门</a></li>
                        <li><a href="#">最新</a></li>
                        <li><a href="#">评论</a></li>
                    </ul>
                    <ul class="uk-subnav uk-subnav-line uk-display-inline-block uk-float-right">
                        <li><a href="#">本周最热</a></li>
                        <li><a href="#">本月最热</a></li>
                        <li><a href="#">历史最热</a></li>
                    </ul>
                </div>

                <ul class="text uk-grid-collapse" id="topic-list">


                </ul>
            </div>
            <div class="uk-width-medium-1-4 right-part">
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
