package school.coder.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import school.coder.domain.UserInfo;
import school.coder.mapper.UserMapper;
import school.coder.service.UserService;

/**
 * Created by Administrator on 2018/2/19.
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public int regUser(UserInfo userInfo) {
        return userMapper.regUser(userInfo);
    }

    @Override
    public UserInfo userLogin(UserInfo userInfo) {
         return userMapper.userLogin(userInfo);
    }

    @Override
    public boolean IsUserExist(String email) {
        return false;
    }

    @Override
    public int updateUserAvatar(UserInfo userInfo) {
        return userMapper.updateUserAvatar(userInfo);
    }


}
