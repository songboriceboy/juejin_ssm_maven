<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/19
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="uk-hidden-small" id="top-header">
    <div class="uk-container uk-container-center">
        <nav class="uk-navbar uk-navbar-attached app-nav">
            <a class="uk-navbar-brand" href="${pageContext.request.contextPath}/" title="魔工坊">
                <img src="https://gold-cdn.xitu.io/v3/static/img/logo.a7995ad.svg" alt="魔工坊" width="60" height="60">
            </a>
            <ul class="uk-navbar-nav">
                <li><a href="${pageContext.request.contextPath}/">首页</a></li>
                <li class="uk-parent" data-uk-dropdown>
                    <a href="${pageContext.request.contextPath}/">开源库</a>
                </li>
                <li class="uk-parent" data-uk-dropdown="">
                    <a href="${pageContext.request.contextPath}/tag/index">标签</a>
                </li>
            </ul>

            <div id="destoon_member" class="uk-navbar-content uk-navbar-flip uk-button-dropdown" data-uk-dropdown="{mode:'click',pos:'bottom-center'}">
                <c:choose>
                    <c:when test="${!empty user_info}">
                        <a title="" href="javascript:;"
                           class="uk-border-circle uk-thumbnail" data-cached-title="回到个人中心首页">
                            <div class="uk-border-circle"><img
                                    class="uk-border-circle" width="40" height="40"
                                    src="${pageContext.request.contextPath}/avatar/${user_info.user_avatar}"
                                    alt="魔工坊">
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

        </nav>
    </div>
</header>
<div class="uk-container uk-visible-small touch-nav">
    <nav class="uk-navbar">
        <div class="uk-grid">
            <div class="uk-width-4-6">
                <div class="uk-navbar-brand uk-float-left">
                    <a class="w1" href="#"> <i class="uk-icon-home"></i> 会员 - 魔工坊</a>
                </div>
            </div>
            <div class="uk-width-2-6">
                <nav class="uk-nav">
                    <a href="#offcanvas" class="uk-navbar-toggle uk-float-right w1" data-uk-offcanvas=""></a>
                </nav>
            </div>
        </div>
    </nav>
</div>
<div id="offcanvas" class="uk-offcanvas">
    <div class="uk-offcanvas-bar">
        <c:choose>
            <c:when test="${!empty user_info}">
                <ul class="uk-nav uk-nav-offcanvas">
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
            </c:when>
            <c:otherwise>
                <ul class="uk-nav uk-nav-offcanvas">
                    <li class="uk-active"><a href="#"><i class="uk-icon-home"></i> 首页</a></li>
                    <li><a href="#"><i class="uk-icon-folder-o"></i>开源库</a></li>
                    <li><a href="${pageContext.request.contextPath}/tag/index"><i class="uk-icon-folder-o"></i>标签</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/reg"><i class="uk-icon-folder-o"></i>免费注册</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/login"><i class="uk-icon-folder-o"></i>立即登录</a></li>
                </ul>
            </c:otherwise>
        </c:choose>

    </div>
</div>
