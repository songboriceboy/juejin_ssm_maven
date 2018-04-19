<%--
  Created by IntelliJ IDEA.
  User: ttc
  Date: 2018/4/19
  Time: 12:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="../common/common_css_js_include.jsp"%>
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
                $.post("${pageContext.request.contextPath}/topic/getpagedtopics",{tag_id:${tid},section_id:g_sid,last_topic_id:last_id}, function (res) {
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
            $.post("${pageContext.request.contextPath}/topic/getpagedtopics",{tag_id:${tid},section_id:sid,last_topic_id:0}, function (res) {
                var data = JSON.parse(res);
                var html = template('topic-list-tpl', data);
                $('#topic-list').html('');
                $('#topic-list').append(html);
            });
        }

    </script>
</head>
<body>
<%@include file="../common/header_only_nav.jsp"%>
<div class="mb-cover">

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



        <ul class="uk-grid-collapse uk-margin-top" id="topic-list">


        </ul>

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
        <div class="uk-text-left uk-text-truncate uk-margin-small-top  uk-margin-small-bottom uk-text-bold">
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
