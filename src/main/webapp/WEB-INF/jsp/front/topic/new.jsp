<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>admin</title>
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon-precomposed" href="images/apple-touch-icon.png">
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon-precomposed" href="images/apple-touch-icon.png">
    <%@include file="../common/common_css_js_include.jsp"%>

    <script>
        var tags_select = [];
        window.onload = function () {
            var ul = document.getElementById("lis");
            var lis = ul.getElementsByTagName('li');
            var section_id = document.getElementById('section_id');
            for (var i = 0; i < lis.length; i++) {
                lis[i].onclick = function () {
                    section_id.value = this.id;
                    for (var i = 0; i < lis.length; i++) {
                        lis[i].getElementsByTagName('a')[0].className = 'uk-button';
                    }
                    this.getElementsByTagName('a')[0].className = 'a1 uk-button';

                }
            }

            var btn = document.getElementById('submit');
            btn.onclick = function () {
                $('[data-uk-dropdown]').hide();
                $('#select-tags').val(tags_select.join(','));
                var form = document.getElementById('article_form');
                form.action = '${pageContext.request.contextPath}/topic/add_topic';
                form.submit();
            }

            <%--var tag_input = document.getElementById('tag_input');--%>
            <%--tag_input.onkeyup = function () {--%>
                <%--alert(tag_input.value);--%>
                <%--$.post('${pageContext.request.contextPath}/tag/get_tags', {'tag':tag_input.value})--%>
                <%--.done(function (tag_list) {--%>
                    <%--alert(tag_list);--%>

                <%--})--%>
                <%--.fail(function () {--%>

                <%--});--%>

            }

        //        var testEditor = null;


        $(function () {
            $("#tag_input").bigAutocomplete({
//                     width:543,

                url:'${pageContext.request.contextPath}/tag/get_tags',

                callback:function(data){

                    if(tags_select.indexOf(data.tid) < 0)
                    {
                        tags_select.push(data.tid);
                        var html = template('tag-selected-item', data);
                        $('#tag-selected').append(html);
                    }

//                    alert(data.title);
                }
            });


            $("#tag-selected").delegate("a", "click", function() {
                var tid = $(this).attr('tid');
                var index = tags_select.indexOf(tid);
                if(index > -1)
                {
                    tags_select.splice(index, 1);
                }
                $(this).hide();
            })



            var testEditor = editormd({
                id: "test-editormd",
//                height: 840,
                height:"100%",
                width: "100%",
                placeholder          : "Markdown编辑器",
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
                imageUploadURL: "{:url('api/uploader/uploadEditorImg?pic_type=10')}",
                onload: function () {

                    this.on('paste', function () {
                        console.log(1);
                    });

                },
                onpreviewing : function() {
                    this.watch();
                    console.log("onpreviewing =>", this, this.id, this.settings);
                    // on previewing you can custom css .editormd-preview-active
                },

                onpreviewed : function() {
                    console.log("onpreviewed =>", this, this.id, this.settings);
                    this.unwatch();
                }
            });

            /**
             * 上传图片
             */
            $("#test-editormd").on('paste', function (ev) {
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
                                    testEditor.insertValue("\n![" + "image.png" + "](${pageContext.request.contextPath}/" + ret.path + ")");
                                }
                            });
                        }; // data url!
                        var url = reader.readAsDataURL(blob);
                    }
                }
            });

            <%--$("#submit").click(function () {--%>
                <%--var param = $("#article_form").serialize();--%>
                <%--$.post('${pageContext.request.contextPath}/topic/save_topic', param)--%>
                        <%--.done(function (article) {--%>
                            <%--if(article.topic_id >= 0)--%>
                            <%--{--%>
                                <%--alert("ok");--%>
                                <%--return false;--%>
                            <%--}--%>

                        <%--})--%>
                        <%--.fail(function () {--%>

                        <%--});--%>
            <%--})--%>

        });
    </script>
    <style>
        .mk-ed{
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>


<!--固定宽度，居中对齐-->

<form class="uk-form"  action="#" method="post"
      target="_blank" id = "article_form">

    <div class="uk-grid">
        <div class="uk-width-4-6">
            <input type="hidden" name = "topic_id" value="${topic.topic_id}" id="topic_id">
            <input type="hidden" name = "section_id" value="1" id="section_id">
            <input type="hidden" name = "tagids" value="" id="select-tags">
            <input type="text" placeholder="请输入标题" class="uk-width-1-1 uk-form-large uk-form-blank" name="topic_title" value="${topic.topic_title}" id = "title">
        </div>

            <%--<input type="button" value="发布文章" id = "submit" class="uk-width-1-1 uk-form-large">--%>
            <div class="uk-width-1-6 uk-text-center uk-button-dropdown" data-uk-dropdown="{pos:'bottom-right',mode:'click'}">
                <a href="#" class="uk-link-muted uk-text-large uk-text-primary" style="line-height: 40px">发布文章</a>

                <div class="turnonart uk-dropdown uk-text-left uk-dropdown-bottom">
                    <ul class="uk-list uk-margin-left">
                        <li class="li1 uk-margin-top">发布文章</li>
                        <li class="li2 uk-margin-top">选择分类</li>
                        <li id="lis">
                            <ul class=" uk-margin-top">

                                <c:forEach items="${sectionList}" var="section">
                                <c:choose>
                                <c:when test="${section.section_id == 1}">
                                    <li class="uk-display-inline-block uk-margin-small-top uk-margin-small-right" id="${section.section_id}">
                                        <a href="#" class="a1 uk-button">${section.section_name}</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="uk-display-inline-block uk-margin-small-top uk-margin-small-right" id="${section.section_id}">
                                        <a href="#" class="uk-button">${section.section_name}</a>
                                    </li>
                                </c:otherwise>
                                </c:choose>
                                </c:forEach>

                            </ul>
                        </li>
                        <li>
                            <div>
                                <div class="li2 uk-margin-top">标签</div>
                            <ul id="tag-selected">


                            </ul>

                                <input id="tag_input" type="text" value="" placeholder="搜索标签（可选填）" class="input uk-margin-top uk-width-1-1 uk-form-blank">

                            </div>

                        </li>
                        <li>
                            <div class="uk-text-center"><a href="#" class="a2 uk-button uk-margin-top" id="submit">确定并发布</a></div>
                        </li>
                    </ul>
                </div>



            </div>

        <div id="destoon_member" class="uk-width-1-6 uk-navbar-content uk-navbar-flip uk-button-dropdown" data-uk-dropdown="{mode:'click',pos:'bottom-center'}">
            <c:choose>
                <c:when test="${!empty user_info}">
                    <a title="" href="javascript:;"
                       class="uk-border-circle uk-thumbnail" data-cached-title="回到个人中心首页">
                        <div class="uk-border-circle">
                            <c:choose>
                                <c:when test="${!empty user_info.user_avatar}">
                                    <img
                                            class="uk-border-circle" width="32" height="32" title="欢迎您${user_info.user_name}"
                                            src="${pageContext.request.contextPath}/avatar/${user_info.user_avatar}"
                                            alt="掘金">
                                </c:when>
                                <c:otherwise>
                                    <img
                                            class="uk-border-circle" width="40" height="40" title="欢迎您${user_info.user_name}"
                                            src="https://user-gold-cdn.xitu.io/2017/7/29/e4663a53d6f246bac968c7c2d5d22e60?imageView2/1/w/90/h/90/q/85/format/webp/interlace/1"
                                            alt="掘金">
                                </c:otherwise>
                            </c:choose>


                            <div class="uk-border-circle" >

                            </div>

                        </div>
                    </a>
                    <div class="uk-dropdown">
                        <ul class="uk-nav uk-nav-dropdown">
                            <li><a href="${pageContext.request.contextPath}/topic/new"><i class="uk-icon-pencil uk-icon-justify "></i>写文章</a></li>
                            <li class="uk-nav-divider"></li>
                            <li><a href="${pageContext.request.contextPath}/user/home/${user_info.user_id}"><i class="uk-icon-home uk-icon-justify "></i>我的主页</a></li>
                            <li><a href="#"><i class="uk-icon-heartbeat uk-icon-justify "></i>我喜欢的</a></li>
                            <li><a href="#"><i class="uk-icon-book uk-icon-justify "></i>我的收藏集</a></li>
                            <li><a href="#"><i class="uk-icon-film uk-icon-justify "></i>标签管理</a></li>
                            <li class="uk-nav-divider"></li>
                            <li><a href="#"><i class="uk-icon-cog uk-icon-justify "></i>设置</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/logout"><i class="uk-icon-leaf uk-icon-justify "></i>登出</a></li>
                        </ul>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="uk-button-group">
                        <a id = "login-btn" class="uk-button uk-button-primary uk-margin-right"
                           href="#">免费注册
                        </a>
                            <%--<a class="uk-button uk-button-primary uk-margin-right"--%>
                            <%--href="${pageContext.request.contextPath}/user/reg">免费注册--%>
                            <%--</a>--%>
                        <a
                                class="uk-button uk-button-primary"
                                href="${pageContext.request.contextPath}/user/login">立即登录
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        </div>


    </div>

    <div class="uk-grid uk-margin-remove mk-ed">

        <div class="editormd  uk-height-viewport uk-width-1-1 markdown-editor" id="test-editormd">

            <textarea class="editormd-markdown-textarea uk-width-1-1" name="topic_markdown_content" id = "topic_markdown_content">${topic.topic_markdown_content}</textarea>
            <!-- html textarea 需要开启配置项 saveHTMLToTextarea == true -->
            <%--<textarea class="editormd-html-textarea" name="article_content"></textarea>--%>

        </div>

    </div>

</form>
<script type="text/html" id="tag-selected-item">
    <li class="uk-display-inline-block uk-margin-small-top uk-margin-small-right">
        <a href="javascript:;" class="a1 uk-button tag-selected-item" tid="{{tid}}">{{title}}</a>
    </li>
    </script>

</body>
</html>
