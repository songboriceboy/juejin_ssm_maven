package school.coder.controller;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import school.coder.domain.TopicCommentInfo;
import school.coder.domain.TopicCommentInfoEx;
import school.coder.domain.TopicInfo;
import school.coder.domain.UserInfo;
import school.coder.service.TopicCommentService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

/**
 * Created by Administrator on 2018/2/20.
 */
@Controller
@RequestMapping("/comment")
public class TopicCommentController {
    @Autowired
    TopicCommentService topicCommentService;

    @RequestMapping("/add_comment")
    public void addComment(HttpServletRequest request
            , HttpServletResponse response,TopicCommentInfo topicCommentInfo) throws IOException {


        String strMarkdown2 = request.getParameter("test-editormd2-html-code");
        String strMarkdown = request.getParameter("test-editormd-html-code");
        if(strMarkdown != null) {
            topicCommentInfo.setComment_content(strMarkdown);
        }
        if(strMarkdown2 != null) {
            topicCommentInfo.setComment_content(strMarkdown2);
        }
        Date date = new Date();
        topicCommentInfo.setComment_createtime(date);
        UserInfo userInfo = (UserInfo)request.getSession().getAttribute("user_info");
        topicCommentInfo.setUser_id(userInfo.getUser_id());

        topicCommentService.addComment(topicCommentInfo);

        TopicCommentInfoEx topicCommentInfoEx = new TopicCommentInfoEx();
        topicCommentInfoEx.setUser_name(userInfo.getUser_name());
        topicCommentInfoEx.setUser_avatar(userInfo.getUser_avatar());
        topicCommentInfoEx.setComment_createtime(date);
        topicCommentInfoEx.setComment_content(topicCommentInfo.getComment_content());

        response.setContentType("application/json;charset=utf-8");
        String strJson = JSON.toJSONString(topicCommentInfoEx);
        response.getWriter().println(strJson);
    }

}
