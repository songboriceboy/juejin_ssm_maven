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
                          var last_id = $('#topic-list li:last-child').attr('id');

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
                      <form class="uk-form  uk-margin-small-top" action="${pageContext.request.contextPath}/user/reguser" method="post">
                          <div class="uk-form-row ">
                              <input type="text" placeholder="昵称" name = "user_name" class="uk-form-blank uk-form-width-medium ">
                          </div>
                          <div class="uk-form-row">
                              <input type="text" placeholder="密码（不少于6位）" name="user_pwd" class="uk-form-blank uk-form-width-medium">
                          </div>
                          <div class="uk-form-row">
                              <input type="password" name="user_pwd_again" placeholder="确认密码" class="uk-form-blank uk-form-width-medium">
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
      <li class="app-blog-item" id="{{topic.topic_id}}" >
          {{topic.topic_id}}
          <div class="title uk-text-truncate">
              <a href="${pageContext.request.contextPath}/topic/show/{{topic.topic_id}}">{{topic.topic_title}}</a>
          </div>
          <div>
              <a href="javascript:;" id = {{topic.section_id}}>
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
