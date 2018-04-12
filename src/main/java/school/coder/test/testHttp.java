package school.coder.test;

import org.apache.log4j.Logger;
import school.coder.controller.AuthLoginController;
import school.coder.util.CommonUtil;

/**
 * Created by Administrator on 2018/2/24.
 */
public class testHttp {

    static String client_id = "dee9dd47e28f78701ccb";
    static String client_secret = "114e8083327a80e2006614b6e4eba46fb23005a3";
    protected static Logger log = Logger.getLogger(AuthLoginController.class);

    public static void main(String[] args) {
        String code = "1f0bbce6b6c056683686";
        log.error("code"+code);
        String requestUrl = "https://github.com/login/oauth/access_token?client_id="+client_id+"&client_secret="+client_secret+"&code="+code+"&redirect_uri=http://www.songbo.info/testgit/auth/github";
        log.error("requestUrl"+requestUrl);

        String me = CommonUtil.sendGet
                (requestUrl);

        log.error("me"+me);
        String atoke = me.split("&")[0];
        log.error("atoke"+atoke);
        String res = CommonUtil.sendGet("https://api.github.com/user?"+atoke+"");
        log.error("res"+res);
    }
}
