package school.coder.controller;


import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import school.coder.domain.*;
import school.coder.service.SectionService;
import school.coder.service.TopicCommentService;
import school.coder.service.TopicService;
import school.coder.util.StringDate;
import school.coder.util.imgUploadBackData;
import school.coder.util.picEncode;
import school.coder.vo.PageData;
import school.coder.vo.TopicCommentList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

/**
 * Created by Administrator on 2018/2/19.
 */
@Controller
@RequestMapping("/topic")
public class TopicController {
    @Autowired
    private TopicService topicService;
    @Autowired
    private TopicCommentService topicCommentService;
    @Autowired
    private SectionService sectionService;
    @RequestMapping("/new")
    public ModelAndView newTopic()
    {

        List<SectionInfo> sectionInfoList = sectionService.getAllSections();

        ModelAndView maView = new ModelAndView();
        TopicInfo topicInfo = new TopicInfo();

//        topicInfo.setTopic_markdown_content("\n\n\n\n\n");
        SectionInfo sectionInfoFirst = sectionInfoList.get(0);
        topicInfo.setSection_id(sectionInfoFirst.getSection_id());
        maView.addObject("sectionList",sectionInfoList);
        maView.addObject("topic",topicInfo);
        maView.setViewName("front/topic/new");
//        maView.setViewName("front/topic/test_new");

        return maView;
    }
    @RequestMapping("/modify/{id}")
    public ModelAndView modifyTopic(@PathVariable int id)
    {
        TopicInfo topicInfo = topicService.getTopicByID(id);
        List<SectionInfo> sectionInfoList = sectionService.getAllSections();

        ModelAndView maView = new ModelAndView();
        maView.setViewName("front/topic/new");
        maView.addObject("sectionList",sectionInfoList);
        maView.addObject("topic",topicInfo);
        return maView;
    }
    @RequestMapping("/show/{id}")
    public ModelAndView showTopic(@PathVariable int id)
    {
        TopicInfo topicInfo = topicService.getTopicByID(id);
        List<TopicCommentInfoEx> list  = topicCommentService.getAllCommentsByTopicID(id);
        Map<Integer,TopicCommentList> mapComments = new LinkedHashMap<>();
        //获取嵌套评论列表
        for(TopicCommentInfoEx topicCommentInfoEx : list)
        {

            Integer tci_comment_id = topicCommentInfoEx.getTci_comment_id();
            if(tci_comment_id == 0)
            {
                TopicCommentList topicCommentList = new TopicCommentList();
                Integer comment_id = topicCommentInfoEx.getComment_id();
                String comment_content = topicCommentInfoEx.getComment_content();
                Date comment_createtime =topicCommentInfoEx.getComment_createtime();
                Integer user_id = topicCommentInfoEx.getUser_id();
                topicCommentList.setCurr_comment_id(comment_id);
                topicCommentList.setCurr_comment_content(comment_content);
                topicCommentList.setCurr_comment_createtime(comment_createtime);
                topicCommentList.setCurr_comment_user_id(user_id);
                topicCommentList.setCurr_user_avatar(topicCommentInfoEx.getUser_avatar());
                topicCommentList.setCurr_user_name(topicCommentInfoEx.getUser_name());
                List<TopicCommentInfoEx> childCommentList = new ArrayList<>();
                topicCommentList.setChildCommentList(childCommentList);
                mapComments.put(topicCommentInfoEx.getComment_id(),topicCommentList);
            }
            else
            {
                TopicCommentList topicCommentList = mapComments.get(tci_comment_id);
                List<TopicCommentInfoEx> childCommentList = topicCommentList.getChildCommentList();

                Integer comment_id = topicCommentInfoEx.getComment_id();
                String comment_content = topicCommentInfoEx.getComment_content();
                Date comment_createtime =topicCommentInfoEx.getComment_createtime();
                Integer user_id = topicCommentInfoEx.getUser_id();

                TopicCommentInfoEx topicCommentInfo = new TopicCommentInfoEx();
                topicCommentInfo.setComment_content(comment_content);
                topicCommentInfo.setComment_id(comment_id);
                topicCommentInfo.setComment_createtime(comment_createtime);
                topicCommentInfo.setUser_id(user_id);
                topicCommentInfo.setUser_name(topicCommentInfoEx.getUser_name());
                topicCommentInfo.setUser_avatar(topicCommentInfoEx.getUser_avatar());

                childCommentList.add(topicCommentInfo);
            }

        }

        ModelAndView maView = new ModelAndView();
        maView.setViewName("front/topic/show");
        maView.addObject("topic",topicInfo);
        maView.addObject("mapComments",mapComments);

        maView.addObject("cid","${comment.comment_id}");
        maView.addObject("reply_comment_id","${reply_comment_id}");

        maView.addObject("toAuthor","${toAuthor}");
        maView.addObject("comment_content","${comment.comment_content}");
        maView.addObject("comment_createtime","${comment.comment_createtime}");
        maView.addObject("user_name","${comment.user_name}");
        maView.addObject("user_avatar","${comment.user_avatar}");
        return maView;
    }
    @RequestMapping("/save_topic")
    public void saveTopic(HttpServletRequest request, HttpServletResponse response, TopicInfo topicInfo) throws IOException {

        UserInfo userInfo = (UserInfo)request.getSession().getAttribute("user_info");
        String strMarkdown = request.getParameter("test-editormd-html-code");
        topicInfo.setTopic_content(strMarkdown);
        topicInfo.setTopic_createtime(new Date());
        topicInfo.setUser_id(userInfo.getUser_id());
        System.out.println(topicInfo);
        //代表是新增
        if(topicInfo.getTopic_id() == 0)
        {
            topicService.insertTopic(topicInfo);
        }
        else //代表是修改文章
        {
            topicService.updateTopic(topicInfo);
        }
        response.setContentType("application/json;charset=utf-8");
        String strJson = JSON.toJSONString(topicInfo);
        response.getWriter().println(strJson);
    }

    @RequestMapping("/uploadimg")
    public void uploadImg(HttpServletRequest request, HttpServletResponse response, TopicInfo topicInfo) throws IOException {
        String strTemp = request.getParameter("base");
        System.out.println(strTemp);
        strTemp = strTemp.replace("data:image/png;base64,","");
        String strPath = this.getClass().getClassLoader().getResource("/../../upload").getPath();
//        String strPath = request.getServletContext().getRealPath(File.separator+"upload");
        String strUUid = UUID.randomUUID().toString();
        System.out.println(strPath);

        File file = new File(strPath);

        if(!file.exists())
        {
            file.mkdir();
        }
        String strSavePath = strPath+File.separator+strUUid+".jpg";
        picEncode.generateImage(strTemp,strSavePath);
        imgUploadBackData iubd = new imgUploadBackData();
        iubd.setPath("upload"+File.separator+strUUid+".jpg");
        iubd.setCode(1);
        String strJson = JSON.toJSONString(iubd);
        response.getWriter().println(strJson);
    }



//    @RequestMapping("getpagedtopics")
//    public void getPagedTopics(TopicPageInfo pageinfo
//            ,HttpServletResponse response) throws IOException
//    {
//        int count = topicService.getTopicsCounts(pageinfo);
//        List<TopicInfoEx> lstBookInfos = new ArrayList<TopicInfoEx>();
//
//
//        lstBookInfos = topicService.getPagedTopics(pageinfo);
//        for(TopicInfoEx topicInfoEx : lstBookInfos)
//        {
//            topicInfoEx.setCreatetime_str(StringDate.getStringDate(topicInfoEx.getTopic_createtime()));
//        }
//        PageData<TopicInfoEx> pageData = new PageData<TopicInfoEx>();
//        pageData.setList(lstBookInfos);
//        pageData.setTotal(count);
//
//        String strJsonString = JSON.toJSONString(pageData);
//        PrintWriter pWriter = response.getWriter();
//        pWriter.println(strJsonString);
//    }

    @RequestMapping("getpagedtopics")
    public void getPagedTopics(TopicPageInfoScroll topicPageInfoScroll
            ,HttpServletResponse response) throws IOException, InterruptedException {
//        int count = topicService.getTopicsCounts(pageinfo);
        List<TopicInfoEx> lstBookInfos = new ArrayList<TopicInfoEx>();


        lstBookInfos = topicService.getPagedTopics(topicPageInfoScroll);
        for(TopicInfoEx topicInfoEx : lstBookInfos)
        {
            topicInfoEx.setCreatetime_str(StringDate.getStringDate(topicInfoEx.getTopic_createtime()));
        }
        PageData<TopicInfoEx> pageData = new PageData<TopicInfoEx>();
        pageData.setList(lstBookInfos);
        pageData.setTotal(0);

        String strJsonString = JSON.toJSONString(pageData);
        PrintWriter pWriter = response.getWriter();
        Thread.sleep(500);
        pWriter.println(strJsonString);
    }
}
