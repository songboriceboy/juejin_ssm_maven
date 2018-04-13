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
    <link href="${pageContext.request.contextPath}/assets/uikit-2.25.0/css/uikit.almost-flat.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/editor-md-master/css/editormd.css" />

    <script src="${pageContext.request.contextPath}/assets/jquery/jquery.js"></script>
    <%--<script src="${pageContext.request.contextPath}/assets/js/autosize.js"></script>--%>
    <script src="${pageContext.request.contextPath}/assets/uikit-2.25.0/js/components/tooltip.js"></script>
    <script src="${pageContext.request.contextPath}/assets/uikit-2.25.0/js/uikit.min.js"></script>

    <script src="${pageContext.request.contextPath}/assets/editor-md-master/editormd.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/adapter.js"></script>
    <script src="${pageContext.request.contextPath}/assets/layer/layer.js"></script>

    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
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
        var testEditor = null;
        var testEditor2 = null;
        function isLogin() {
            <c:if test="${empty user_info}">
                return 0;
            </c:if>
            <c:if test="${!empty user_info}">
                return 1;
            </c:if>
        }

        function initMdEditor(num) {

            editormd.urls.atLinkBase = "${pageContext.request.contextPath}/user/"
            //markdown
           var editorMd = editormd({
                id: "test-editormd"+num,
//                height: 840,
               autoFocus:false,
                width   : "90%",
                watch : false,
                height  : 250,
               lineNumbers:false,
                placeholder          : "文明社会，理性评论，支持Markdown",
                path: "${pageContext.request.contextPath}/assets/editor-md-master/lib/",
                toolbarIcons: function () {
                    // Or return editormd.toolbarModes[name]; // full, simple, mini
                    // Using "||" set icons align right.
                    return ["undo", "redo", "|", "watch", "fullscreen", "preview"]
                },
                //toolbar  : false,             // 关闭工具栏
                codeFold: true,
                searchReplace: true,
                saveHTMLToTextarea: true,      // 保存 HTML 到 Textarea
                htmlDecode: "style,script,iframe|on*",            // 开启 HTML 标签解析，为了安全性，默认不开启
                emoji: true,
                taskList: true,
                tocm: true,          // Using [TOCM]
                tex: true,                      // 开启科学公式 TeX 语言支持，默认关闭
                //previewCodeHighlight : false,  // 关闭预览窗口的代码高亮，默认开启
                flowChart: true,                // 疑似 Sea.js与 Raphael.js 有冲突，必须先加载 Raphael.js ，Editor.md 才能在 Sea.js 下正常进行；
                sequenceDiagram: true,          // 同上
                //dialogLockScreen : false,      // 设置弹出层对话框不锁屏，全局通用，默认为 true
                //dialogShowMask : false,     // 设置弹出层对话框显示透明遮罩层，全局通用，默认为 true
                //dialogDraggable : false,    // 设置弹出层对话框不可拖动，全局通用，默认为 true
                //dialogMaskOpacity : 0.4,    // 设置透明遮罩层的透明度，全局通用，默认值为 0.1
                //dialogMaskBgColor : "#000", // 设置透明遮罩层的背景颜色，全局通用，默认为 #fff
                imageUpload: true,
                imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                imageUploadURL: "{:url('api/uploader/uploadEditorImg?pic_type=10')}"
            });

            /**
             * 上传图片
             */
            $("#test-editormd"+num).on('paste', function (ev) {
                var data = ev.clipboardData;
                var items = (event.clipboardData || event.originalEvent.clipboardData).items;
                for (var index in items) {
                    var item = items[index];
                    if (item.kind === 'file') {
                        var blob = item.getAsFile();
                        var reader = new FileReader();
                        reader.onload = function (event) {
                            var base64 = event.target.result;
                            //ajax上传图片
                            $.post("${pageContext.request.contextPath}/topic/uploadimg",{base:base64}, function (res) {
                                // layer.msg(ret.msg);
                                var ret = JSON.parse(res);
                                if (ret.code === 1) {
                                    //新一行的图片显示
                                    editorMd.insertValue("\n![" + "image.png" + "](${pageContext.request.contextPath}/" + ret.path + ")");
                                }
                            });
                        }; // data url!
                        var url = reader.readAsDataURL(blob);
                    }
                }
            });

            return editorMd;
        }

        //动态生成的评论框提交
        function check_submit(form) {

            var userid = isLogin();

            if(userid === 0)
            {
                layer.msg('未登录',{time:2000});
                return false;
            }

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
                                testEditor2.editor.remove();
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

                    testEditor = initMdEditor('');

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
                            testEditor2.editor.remove();
                            $('#reply-anywhere').remove();
                        }
                        var reply = `<li>
                                   <div class="reply" id="reply-anywhere">
                            <form class="uk-form" id="reply-reply-form" action="#" method="post" onsubmit="return check_submit(this);">
                                <div class="uk-form-row">
                                    <input type="hidden" name = "topic_id" value="${topic.topic_id}">
                                    <input type="hidden" name = "reply_comment_id" value="${reply_comment_id}">
                               <div class="editormd" id="test-editormd2">
    <textarea class="editormd-markdown-textarea" name="comment_markdown_content">${toAuthor}</textarea>
</div>
                                    <input type="submit" class="uk-button">
                                </div>
                            </form>
                        </div>
                        </li>`;
                        var replynode = $(reply);
//                        $(this).closest('.reply-item').append(replynode);
                        $(this).closest('.reply-child-item').after(replynode);
                        testEditor2 = initMdEditor(2);

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

                        var param = $("#reply-form").serialize();
                        $.post('${pageContext.request.contextPath}/comment/add_comment', param)
                                .done(function (comment) {
                                    if(comment.comment_id >= 0)
                                    {
                                        alert('first');
                                        var txt = testEditor.getHTML();
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
<%@include file="../common/header.jsp"%>

<div class="mb-cover">
    <div class="b20"></div>
    <div class="uk-container uk-container-center">
        <div class="uk-grid" data-uk-grid-margin="">
            <div class="uk-width-medium-3-4">

                <div class="uk-panel uk-panel-box uk-padding-remove">
                    <div class="topic-content">
                        <div class="topic-author">
                            <img class="uk-align-left uk-border-circle"
                                 src="https://avatars.githubusercontent.com/u/20903311" width="40" height="40">
                            <div>zhangsan</div>
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
                                <div class="editormd" id="test-editormd">
                                    <input type="hidden" name = "topic_id" value="${topic.topic_id}">
                                    <textarea class="editormd-markdown-textarea" name="comment_markdown_content"></textarea>
                                    <!-- html textarea 需要开启配置项 saveHTMLToTextarea == true -->
                                    <%--<textarea class="editormd-html-textarea" name="article_content"></textarea>--%>

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
    <%--<div class="uk-container uk-container-center">--%>

        <%--<div class="uk-panel uk-panel-box">--%>
            <%--<h2>${topic.topic_title}</h2>--%>
            <%--<div>--%>
                <%--${topic.topic_content}--%>
            <%--</div>--%>


            <%--&lt;%&ndash;<ul class="uk-comment-list" id="uk-comment-list">&ndash;%&gt;--%>
             <%--&lt;%&ndash;&ndash;%&gt;--%>
            <%--&lt;%&ndash;</ul>&ndash;%&gt;--%>

            <%--<ul class="uk-comment-list" id="uk-comment-list">--%>
                <%--<c:forEach items="${mapComments}" var="entry">--%>
                    <%--<li class="reply-item" id="comment_${entry.value.curr_comment_id}">--%>
                        <%--<article class="uk-comment">--%>
                            <%--<header class="uk-comment-header">--%>
                                <%--<img class="uk-comment-avatar" src="${pageContext.request.contextPath}/avatar/${entry.value.curr_user_avatar}" width="50" height="50" alt="">--%>
                                <%--<h4 class="uk-comment-title">${entry.value.curr_user_name}</h4>--%>
                                <%--<div class="uk-comment-meta">${entry.value.curr_comment_createtime} | Profile | #</div>--%>
                            <%--</header>--%>
                            <%--<div class="uk-comment-body">--%>
                                <%--<p>${entry.value.curr_comment_content}</p>--%>
                            <%--</div>--%>
                            <%--<div class="x-comment-footer uk-margin-top">--%>
                                <%--<a href="#" class="uk-button btn-reply"><i class="uk-icon-reply"></i> 回复</a>--%>
                                <%--<a href="#" class="uk-button">赞</a>--%>
                            <%--</div>--%>
                        <%--</article>--%>

                        <%--<ul class="ul-comment-list-child">--%>
                            <%--<c:forEach items="${entry.value.childCommentList}" var="childComment">--%>
                                <%--<li class="reply-child-item" id="comment_${childComment.comment_id}">--%>
                                    <%--<article class="uk-comment">--%>
                                        <%--<header class="uk-comment-header">--%>
                                            <%--<img class="uk-comment-avatar" src="${pageContext.request.contextPath}/avatar/${childComment.user_avatar}" width="50" height="50" alt="">--%>
                                            <%--<h4 class="uk-comment-title">${childComment.user_name}</h4>--%>
                                            <%--<div class="uk-comment-meta">${childComment.comment_createtime}| Profile | #</div>--%>
                                        <%--</header>--%>
                                        <%--<div class="uk-comment-body">--%>
                                            <%--<p>${childComment.comment_content}</p>--%>
                                        <%--</div>--%>
                                        <%--<div class="x-comment-footer uk-margin-top">--%>
                                            <%--<a href="#" class="uk-button btn-reply"><i class="uk-icon-reply"></i> 回复</a>--%>
                                            <%--<a href="#" class="uk-button">赞</a>--%>
                                        <%--</div>--%>
                                    <%--</article>--%>
                                <%--</li>--%>
                            <%--</c:forEach>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                <%--</c:forEach>--%>
            <%--</ul>--%>

            <%--<div class="reply" id="final-reply">--%>
                <%--<form class="uk-form" action="#" method="post" id="reply-form">--%>
                    <%--<div class="uk-form-row">--%>
                        <%--<div class="editormd" id="test-editormd">--%>
                            <%--<input type="hidden" name = "topic_id" value="${topic.topic_id}">--%>
                            <%--<textarea class="editormd-markdown-textarea" name="comment_markdown_content"></textarea>--%>
                            <%--<!-- html textarea 需要开启配置项 saveHTMLToTextarea == true -->--%>
                            <%--&lt;%&ndash;<textarea class="editormd-html-textarea" name="article_content"></textarea>&ndash;%&gt;--%>

                        <%--</div>--%>
                        <%--<input type="submit" class="uk-button" id="submit">--%>
                    <%--</div>--%>
                <%--</form>--%>
            <%--</div>--%>

        <%--</div>--%>

    <%--</div>--%>
</div>
</body>
</html>