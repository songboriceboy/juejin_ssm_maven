package school.coder.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import school.coder.domain.AdminInfo;
import school.coder.domain.UserInfo;
import school.coder.service.AdminService;
import school.coder.util.CreateMD5;

import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2018/2/15.
 */

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    AdminService adminService;

    @RequestMapping("/")
    public ModelAndView index()
    {
        System.out.println("hello");
        ModelAndView maView = new ModelAndView();
        maView.setViewName("admin/index");
        return maView;
    }
    @RequestMapping("/login")
    public ModelAndView Login(AdminInfo adminInfo, HttpSession hs) throws Exception{


        adminInfo.setAdmin_pwd(CreateMD5.getMd5(adminInfo.getAdmin_pwd()));
        AdminInfo ai = adminService.Login(adminInfo);
        if(ai != null)
        {
            hs.setAttribute("admin_info",ai);
            return new ModelAndView("redirect:/admin/");
        }
        else
        {
            ModelAndView mav = new ModelAndView();
            mav.addObject("message", "登录失败");
            mav.setViewName("login");
            return mav;
        }

    }
}