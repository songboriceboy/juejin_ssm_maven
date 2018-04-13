package school.coder.controller;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import school.coder.service.TagServcie;
import school.coder.vo.TagAuto;
import school.coder.domain.TagInfoEx;
import school.coder.vo.TagList;

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
    public void get_tags(String keyword, HttpServletResponse response) throws IOException {
        System.out.println(keyword);
        List<TagInfoEx> lst = tagServcie.getAllTags("%"+keyword+"%");
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
        List<TagInfoEx> lst = tagServcie.getAllTags("%%");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("tags",lst);
        modelAndView.setViewName("front/tag/tag");
        return modelAndView;
    }
}
