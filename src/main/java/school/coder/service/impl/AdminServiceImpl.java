package school.coder.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import school.coder.domain.AdminInfo;
import school.coder.mapper.AdminMapper;
import school.coder.service.AdminService;

/**
 * Created by Administrator on 2018/2/15.
 */
@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminMapper adminMapper;
    @Override
    public AdminInfo Login(AdminInfo adminInfo) {
        return adminMapper.Login(adminInfo);
    }
}
