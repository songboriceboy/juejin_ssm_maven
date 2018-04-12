package school.coder.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import school.coder.domain.UserInfo;
import school.coder.util.CommonUtil;
import school.coder.vo.GithubAuthResJson;

import javax.servlet.http.HttpServletRequest;


/**
 * Created by Administrator on 2018/2/22.
 */
@Controller
@RequestMapping("/auth")
public class AuthLoginController {
    static String client_id = "dee9dd47e28f78701ccb";
    static String client_secret = "114e8083327a80e2006614b6e4eba46fb23005a3";
    protected static Logger log = Logger.getLogger(AuthLoginController.class);




    @RequestMapping("/github")
    public ModelAndView github(HttpServletRequest request,String code)
    {
//        System.out.println(code);
        log.error("code"+code);
        String requestUrl = "https://github.com/login/oauth/access_token?client_id="+client_id+"&client_secret="+client_secret+"&code="+code+"&redirect_uri=http://www.songbo.info/testgit/auth/github";
        log.error("requestUrl"+requestUrl);

        String me = CommonUtil.sendPost
                (requestUrl,null);

        log.error("me"+me);
        String atoke = me.split("&")[0];
        log.error("atoke"+atoke);
        String res = CommonUtil.sendGet("https://api.github.com/user?"+atoke+"");
        log.error("res"+res);
        GithubAuthResJson githubAuthResJson = JSON.parseObject(res, new TypeReference<GithubAuthResJson>() {});
//        JSONObject user = (JSONObject) JSON.parse(res);
        System.out.println(githubAuthResJson.getLogin());
        UserInfo userInfo = new UserInfo();
        userInfo.setUser_name(githubAuthResJson.getLogin());
        userInfo.setUser_avatar(githubAuthResJson.getAvatar_url());
        request.getSession().setAttribute("user_info",userInfo);
//        return CommonUtil.constructResponse(1,"user_Person_Notice",user);
        ModelAndView maView = new ModelAndView();
        maView.setViewName("front/index");

        return maView;
    }
}
