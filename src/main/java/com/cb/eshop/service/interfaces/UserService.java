package com.cb.eshop.service.interfaces;

import com.cb.eshop.dao.interfaces.IUserDao;
import com.cb.eshop.model.User;
import com.cb.eshop.service.impl.IUserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class UserService implements IUserService {

    @Resource
    private IUserDao userDao;

    @Override
    public User getUserById(Long userId) {
        return userDao.selectUserById(userId);
    }

    @Override
    public User login(String userName, String password) {
        User user = userDao.findWithLoginAndPassword(userName, password);
        if (user != null && user.getuPassword().equals(password)) {
            return user;
        }
        return null;
    }

    @Override
    public User getUserByPhoneOrEmail(String emailOrPhone) {
        return userDao.selectUserByPhoneOrEmail(emailOrPhone);
    }

    @Override
    public List<User> getAllUser() {
        return userDao.selectAllUser();
    }
}

