package school.coder.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import school.coder.domain.SectionInfo;
import school.coder.domain.TopicInfoEx;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2018/3/1.
 */
@Controller
@RequestMapping("/tag")
public class TagController {
    @RequestMapping("/index")
    public ModelAndView index()
    {
        ModelAndView maView = new ModelAndView();
        maView.setViewName("front/tag/tag");
        return maView;
    }
    @RequestMapping("/get_tags")
    public void get_tags(String tag, HttpServletResponse response) throws IOException {

        response.getWriter().println(tag);
    }
}
