package school.coder.controller;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import school.coder.domain.UserInfo;
import school.coder.service.UserService;
import school.coder.util.CreateMD5;
import school.coder.vo.UploadRes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

/**
 * Created by Administrator on 2018/2/19.
 */
//验证码，注册时验证用户是否已存在
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/home/{id}")
    public ModelAndView home(@PathVariable int id)
    {

        ModelAndView maView = new ModelAndView();
        maView.setViewName("front/user/home");
        return maView;
    }
    @RequestMapping("/edit/{id}")
    public ModelAndView edit(@PathVariable int id)
    {

        ModelAndView maView = new ModelAndView();
        maView.setViewName("front/user/edit");
        return maView;
    }
    @RequestMapping("/upload_avatar")
    public void upload_avatar(@RequestParam MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws IOException {

        if(file.isEmpty())
        {
            System.out.println("文件未上传!");
        }
        else
        {
            //得到上传的文件名
            String fileName = file.getOriginalFilename();
            //得到服务器项目发布运行所在地址
            String strFolder = request.getServletContext().getRealPath("/avatar")+ File.separator;
            File folder = new File(strFolder);
            if(!folder.exists())
            {
                folder.mkdir();
            }
            //  此处未使用UUID来生成唯一标识,用日期做为标识
            String strUUid = UUID.randomUUID().toString();
            String strNewFilePath = strUUid + fileName;
            String strFinalPath = strFolder + strNewFilePath;
            //查看文件上传路径,方便查找
            System.out.println(strFinalPath);
            //把文件上传至path的路径
            File localFile = new File(strFinalPath);
            file.transferTo(localFile);
            UserInfo userInfo = (UserInfo)request.getSession().getAttribute("user_info");
            userInfo.setUser_avatar(strNewFilePath);
            userService.updateUserAvatar(userInfo);
//            response.setContentType("application/json;charset=utf-8");
            UploadRes uploadRes = new UploadRes();
            uploadRes.setSrc(strNewFilePath);
            String strJson = JSON.toJSONString(uploadRes);
            response.getWriter().println(strJson);
        }
    }
    @RequestMapping("/login")
    public ModelAndView login()
    {

        ModelAndView maView = new ModelAndView();
        maView.setViewName("front/login");
        return maView;
    }

    @RequestMapping("/reg")
    public ModelAndView reg()
    {

        ModelAndView maView = new ModelAndView();
        maView.setViewName("front/reg");
        return maView;
    }
    @RequestMapping("/reguser")
    public ModelAndView reguser(UserInfo userInfo) throws NoSuchAlgorithmException {
        userInfo.setUser_phone("");
        userInfo.setUser_pwd(CreateMD5.getMd5(userInfo.getUser_pwd()));
        userService.regUser(userInfo);
        ModelAndView maView = new ModelAndView();
        maView.setViewName("front/index");
        return maView;
    }
    @RequestMapping("/userlogin")
    public ModelAndView userlogin(UserInfo userInfo, HttpServletRequest request) throws NoSuchAlgorithmException {

        userInfo.setUser_pwd(CreateMD5.getMd5(userInfo.getUser_pwd()));
        UserInfo userInfo1 = userService.userLogin(userInfo);
        if(userInfo1!=null)
        {
            request.getSession().setAttribute("user_info",userInfo1);
        }
        ModelAndView maView = new ModelAndView();
        maView.setViewName("front/index");
        return maView;
    }

    @RequestMapping("/logout")
    public ModelAndView logout(UserInfo userInfo, HttpServletRequest request) throws NoSuchAlgorithmException {

        request.getSession().invalidate();
        ModelAndView maView = new ModelAndView();
        maView.setViewName("front/index");
        return maView;
    }
}
