package com.cb.eshop.service.impl;

import com.cb.eshop.dao.interfaces.IUserDao;
import com.cb.eshop.model.User;
import com.cb.eshop.service.interfaces.IUserService;
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
    public User getUserByUsername(String username) {
        return userDao.selectUserByUsername(username);
    }

}

