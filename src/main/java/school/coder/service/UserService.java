package school.coder.service;

import school.coder.domain.UserInfo;

/**
 * Created by Administrator on 2018/2/19.
 */
public interface UserService {
    int regUser(UserInfo userInfo);
    UserInfo userLogin(UserInfo userInfo);
    boolean IsUserExist(String email);
    int updateUserAvatar(UserInfo userInfo);
}

