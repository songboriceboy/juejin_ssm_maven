<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/19
  Time: 19:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,user-scalable=no,initial-scale=1, minimum-scale=1, maximum-scale=1">
    <title>Title</title>
    <%@include file="../common/common_css_js_include.jsp"%>
<style>
    .topic-author{
        padding: 20px;
    }
    .topic-detail{
        padding: 20px;
    }
    #uk-comment-list{
        padding: 30px;
    }
</style>
    <script>
        var editor = null;
        var editor2 = null;
        var E = window.wangEditor;
        function isLogin() {
            <c:if test="${empty user_info}">
                return 0;
            </c:if>
            <c:if test="${!empty user_info}">
                return 1;
            </c:if>
        }

        //动态生成的评论框提交
        function check_submit(form) {

            var userid = isLogin();

            if(userid === 0)
            {
                layer.msg('未登录',{time:2000});
                return false;
            }
            var true_comment_content = document.getElementById('true_comment_content2');
            true_comment_content.value = editor2.txt.html();
            var param = $("#reply-reply-form").serialize();
            $.post('${pageContext.request.contextPath}/comment/add_comment', param)
                    .done(function (comment) {
                        if(comment.comment_id >= 0)
                        {
                            alert('first');

                            var comment = `
                    <li class="reply-child-item" id="comment_${cid}">
                    <article class="uk-comment">
                        <header class="uk-comment-header">
                            <img class="uk-comment-avatar" src="${pageContext.request.contextPath}/avatar/${user_avatar}" width="50" height="50" alt="">
                            <h4 class="uk-comment-title">${user_name}</h4>
                            <div class="uk-comment-meta">${comment_createtime} | Profile | #</div>
                        </header>
                        <div class="uk-comment-body">
                           <p>${comment_content}</p>
                        </div>
                        <div class="x-comment-footer uk-margin-top">
                            <a href="#" class="uk-button btn-reply"><i class="uk-icon-reply"></i> 回复</a>
                            <a href="#" class="uk-button">赞</a>
                        </div>
                    </article>
                    </li>
                `;
                            var li = $(comment);
                            $(form).closest('.reply-item').find('.ul-comment-list-child').append(li);

                            var $div = $('#reply-anywhere');
                            if ($div.length > 0)
                            {
                                $('#editor2').remove();
                                $('#reply-anywhere').remove();
                            }

                            return false;

                        }

                    })
                    .fail(function () {

                    });

            return false;

        }

        $(document).ready(function () {


                    editor = new E('#editor');

                    editor.customConfig.onfocus = function () {
                        var $div = $('#reply-anywhere');
                        if ($div.length > 0)
                        {
                            $('#editor2').remove();
                            $('#reply-anywhere').remove();

                        }
                    }
                    editor.create();
                    //点击某条评论里的回复按钮，动态生成一个textarea
                    $('#uk-comment-list').on('click', '.btn-reply', function () {


                        var $isChildComment = $(this).closest('.reply-child-item');
                        var toAuthor = '';
                        if($isChildComment.length > 0)
                        {
                            var toAuthor = '@'+ $(this).closest('.uk-comment').find('.uk-comment-title').text();
                        }

                        var reply_comment_id = $(this).closest('.reply-item').attr('id').replace('comment_','');

                        var $div = $('#reply-anywhere');
                        if ($div.length > 0)
                        {
                            $('#editor2').remove();
                            $('#reply-anywhere').remove();

                        }
                        var reply = `
                                   <div class="reply" id="reply-anywhere">
                            <form class="uk-form" id="reply-reply-form" action="#" method="post" onsubmit="return check_submit(this);">
                                <div class="uk-form-row">
                                    <input type="hidden" name = "topic_id" value="${topic.topic_id}">
                                    <input type="hidden" name = "reply_comment_id" value="${reply_comment_id}">

                                    <input type="hidden" name = "comment_content" value="" id="true_comment_content2">
                                    <div id="editor2" class="uk-margin-large-left uk-margin-large-right">

                                    </div>

                                    <input type="submit" class="uk-button">
                                </div>
                            </form>
                        </div>
                        `;
                        var replynode = $(reply);

                        $(this).closest('.uk-comment').append(replynode);

                        editor2 = new E('#editor2')
                        editor2.create()
                        editor2.txt.html('<a href="${pageContext.request.contextPath}/user/home/${user_info.user_id}">'+toAuthor+'</a>')
                        return false;
                    })

                    //动态添加元素的事件绑定问题参考了http://blog.csdn.net/lixin2151408/article/details/71411564
                    //最后面的评论框提交
//                    $('#final-reply').on('submit', 'form', function () {
//
//                    })
                    $("#submit").click(function () {

                        var userid = isLogin();

                        if(userid === 0)
                        {
                            layer.msg('未登录',{time:2000});
                            return false;
                        }

                        var true_comment_content = document.getElementById('true_comment_content');
                        true_comment_content.value = editor.txt.html();
                        var param = $("#reply-form").serialize();
                        $.post('${pageContext.request.contextPath}/comment/add_comment', param)
                                .done(function (comment) {
                                    if(comment.comment_id >= 0)
                                    {
                                        alert('first');
                                        var txt = editor.txt.html();
                                        var comment = `
                    <li class="reply-item" id="comment_${cid}">
                    <article class="uk-comment">
                     <header class="uk-comment-header">
                            <img class="uk-comment-avatar" src="${pageContext.request.contextPath}/avatar/${user_avatar}" width="50" height="50" alt="">
                            <h4 class="uk-comment-title">${user_name}</h4>
                            <div class="uk-comment-meta">${comment_createtime} | Profile | #</div>
                        </header>
                        <div class="uk-comment-body">
                           <p>${comment_content}</p>
                        </div>
                        <div class="x-comment-footer uk-margin-top">
                            <a href="#" class="uk-button btn-reply"><i class="uk-icon-reply"></i> 回复</a>
                            <a href="#" class="uk-button">赞</a>
                        </div>
                    </article>
                    <ul class="ul-comment-list-child">
                    </ul>
                    </li>
                `;
                                        var li = $(comment);
                                        $('#uk-comment-list').append(li);

                                        return false;

                                    }

                                })
                                .fail(function () {

                                });

                        return false;
                    })
                }
        );
    </script>
</head>
<body>
<%@include file="../common/header_only_nav.jsp"%>

<div class="mb-cover">
    <div class="b20"></div>
    <div class="uk-container uk-container-center">
        <div class="uk-grid" data-uk-grid-margin="">
            <div class="uk-width-medium-3-4">

                <div class="uk-panel uk-panel-box uk-padding-remove">
                    <div class="topic-content">
                        <div class="topic-author">
                            <img class="uk-align-left uk-border-circle"
                                 src="${pageContext.request.contextPath}/avatar/${topic.user_avatar}" width="40" height="40">
                            <div>${topic.user_name}</div>
                            <div>2018 年 03 月 07 日</div>
                        </div>
                        <h2 class="article-title uk-margin-large-left">
                            ${topic.topic_title}
                        </h2>
                        <div class="topic-detail">
                            ${topic.topic_content}
                        </div>
                    </div>

                    <ul class="uk-comment-list" id="uk-comment-list">
                        <c:forEach items="${mapComments}" var="entry">
                            <li class="reply-item" id="comment_${entry.value.curr_comment_id}">
                                <article class="uk-comment">
                                    <header class="uk-comment-header">
                                        <img class="uk-comment-avatar" src="${pageContext.request.contextPath}/avatar/${entry.value.curr_user_avatar}" width="50" height="50" alt="">
                                        <h4 class="uk-comment-title">${entry.value.curr_user_name}</h4>
                                        <div class="uk-comment-meta">${entry.value.curr_comment_createtime} | Profile | #</div>
                                    </header>
                                    <div class="uk-comment-body">
                                        <p>${entry.value.curr_comment_content}</p>
                                    </div>
                                    <div class="x-comment-footer uk-margin-top">
                                        <a href="#" class="uk-button btn-reply"><i class="uk-icon-reply"></i> 回复</a>
                                        <a href="#" class="uk-button">赞</a>
                                    </div>
                                </article>

                                <ul class="ul-comment-list-child">
                                    <c:forEach items="${entry.value.childCommentList}" var="childComment">
                                        <li class="reply-child-item" id="comment_${childComment.comment_id}">
                                            <article class="uk-comment">
                                                <header class="uk-comment-header">
                                                    <img class="uk-comment-avatar" src="${pageContext.request.contextPath}/avatar/${childComment.user_avatar}" width="50" height="50" alt="">
                                                    <h4 class="uk-comment-title">${childComment.user_name}</h4>
                                                    <div class="uk-comment-meta">${childComment.comment_createtime}| Profile | #</div>
                                                </header>
                                                <div class="uk-comment-body">
                                                    <p>${childComment.comment_content}</p>
                                                </div>
                                                <div class="x-comment-footer uk-margin-top">
                                                    <a href="#" class="uk-button btn-reply"><i class="uk-icon-reply"></i> 回复</a>
                                                    <a href="#" class="uk-button">赞</a>
                                                </div>
                                            </article>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </li>
                        </c:forEach>
                    </ul>

                    <div class="reply" id="final-reply">
                        <form class="uk-form" action="#" method="post" id="reply-form">
                            <div class="uk-form-row">
                                <input type="hidden" name = "topic_id" value="${topic.topic_id}">
                                <input type="hidden" name = "comment_content" value="" id="true_comment_content">
                                <div id="editor" class="uk-margin-large-left uk-margin-large-right">

                                </div>
                                <input type="submit" class="uk-button" id="submit">
                            </div>
                        </form>
                    </div>

                </div>

            </div>

            <div class="uk-width-medium-1-4" id="mb_list_right">
                <div class="uk-panel uk-panel-box uk-panel-box-secondary">
                    <a href="#" class="uk-float-right">查看全部</a>
                    <h3 class="uk-panel-title">热门标签</h3>
                    <div class="uk-grid uk-text-center">
                        <div class="uk-width-1-2 uk-button uk-button-link ">
                            代码规范
                        </div>
                        <div class="uk-width-1-2 uk-button uk-button-link">
                            代码代码规范
                        </div>
                        <div class="uk-width-1-2 uk-button uk-button-link">
                            代码规范
                        </div>
                        <div class="uk-width-1-2 uk-button uk-button-link">
                            代码代码规范
                        </div>
                        <div class="uk-width-1-2 uk-button uk-button-link">
                            代码规范
                        </div>
                        <div class="uk-width-1-2 uk-button uk-button-link">
                            代码代码规范
                        </div>
                        <div class="uk-width-1-2 uk-button uk-button-link">
                            代码规范
                        </div>
                        <div class="uk-width-1-2 uk-button uk-button-link">
                            代码代码规范
                        </div>
                        <div class="uk-width-1-2 uk-button uk-button-link">
                            代码规范
                        </div>
                        <div class="uk-width-1-2 uk-button uk-button-link">
                            代码代码规范
                        </div>
                    </div>
                </div>

                <div class="b20"></div>
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
</body>
</html>