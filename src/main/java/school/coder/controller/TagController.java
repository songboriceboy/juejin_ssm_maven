package school.coder.controller;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import school.coder.domain.TagInfoEx;
import school.coder.domain.TagSearchInfo;
import school.coder.domain.TagUserInfo;
import school.coder.domain.UserInfo;
import school.coder.service.TagServcie;
import school.coder.vo.JsonData;
import school.coder.vo.TagAuto;
import school.coder.vo.TagList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2018/3/1.
 */
@Controller
@RequestMapping("/tag")
public class TagController {
    @Autowired
    TagServcie tagServcie;
    @RequestMapping("/index")
    public ModelAndView index()
    {
        ModelAndView maView = new ModelAndView();
        maView.setViewName("front/tag/tag");
        return maView;
    }
    @RequestMapping("/get_tags")
    public void get_tags(String keyword,HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println(keyword);
        TagSearchInfo tagSearchInfo = new TagSearchInfo();
        UserInfo userInfo = (UserInfo)request.getSession().getAttribute("user_info");
        tagSearchInfo.setUserid(userInfo.getUser_id());
        tagSearchInfo.setWord("%"+keyword+"%");
        List<TagInfoEx> lst = tagServcie.getAllTags(tagSearchInfo);
        List<TagAuto> lstTagAuto = new ArrayList<>();
        for(TagInfoEx tagInfo : lst)
        {
            TagAuto tagAuto = new TagAuto();
            tagAuto.setTitle(tagInfo.getTag_name());
            tagAuto.setTid(tagInfo.getTag_id());
            lstTagAuto.add(tagAuto);
        }
        TagList tagList = new TagList();
        tagList.setData(lstTagAuto);
        String strJson = JSON.toJSONString(tagList);
        System.out.println(strJson);
        response.getWriter().println(strJson);
    }

    @RequestMapping("/get_all_tags")
    public ModelAndView getAllTags() throws IOException {

        ModelAndView modelAndView = new ModelAndView();

        modelAndView.setViewName("front/tag/tag");
        return modelAndView;
    }

    @RequestMapping("/ajax_get_all_tags")
    public void getAllTagsAjax(HttpServletRequest request,HttpServletResponse response) throws IOException {
        TagSearchInfo tagSearchInfo = new TagSearchInfo();
        UserInfo userInfo = (UserInfo)request.getSession().getAttribute("user_info");
        tagSearchInfo.setUserid(userInfo.getUser_id());
        tagSearchInfo.setWord("%%");
        List<TagInfoEx> lst = tagServcie.getAllTags(tagSearchInfo);
        ModelAndView modelAndView = new ModelAndView();
        JsonData jsonData = new JsonData();
        jsonData.setList(lst);
        response.getWriter().println(JSON.toJSONString(jsonData));
    }


    @RequestMapping("/get_current_user_tags")
    public void get_current_user_tags(HttpServletRequest request,HttpServletResponse response) throws IOException {
        UserInfo userInfo = (UserInfo)request.getSession().getAttribute("user_info");
        List<TagInfoEx> lst = tagServcie.getTagsByUserID(userInfo.getUser_id());
        JsonData jsonData = new JsonData();
        jsonData.setList(lst);
        response.getWriter().println(JSON.toJSONString(jsonData));
    }

    @RequestMapping("/follow_tags")
    public void follow_tags(Integer tagid, HttpServletRequest request,HttpServletResponse response) throws IOException {
        UserInfo userInfo = (UserInfo)request.getSession().getAttribute("user_info");
        TagUserInfo tagUserInfo = new TagUserInfo();
        tagUserInfo.setTag_id(tagid);
        tagUserInfo.setUser_id(userInfo.getUser_id());
        int resutlt = tagServcie.followTag(tagUserInfo);

        response.getWriter().println(resutlt);
    }
    @RequestMapping("/cancel_follow_tags")
    public void cancel_follow_tags(Integer tagid, HttpServletRequest request,HttpServletResponse response) throws IOException {
        UserInfo userInfo = (UserInfo)request.getSession().getAttribute("user_info");

        TagUserInfo tagUserInfo = new TagUserInfo();
        tagUserInfo.setTag_id(tagid);
        tagUserInfo.setUser_id(userInfo.getUser_id());
        int resutlt = tagServcie.cancelFollowTag(tagUserInfo);
        response.getWriter().println(resutlt);
    }
}
