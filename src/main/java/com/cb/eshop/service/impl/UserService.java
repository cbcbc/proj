package com.cb.eshop.service.impl;

import com.cb.eshop.dao.interfaces.IUserDao;
import com.cb.eshop.model.User;
import com.cb.eshop.service.interfaces.IUserService;
import com.cb.eshop.utils.DecriptUtil;
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

    @Override
    public List<User> getTenUsersByPageId(Integer pageId) {
        return userDao.selectSomeUsersFromStartId(pageId * 10);
    }

    @Override
    public Integer getUserPageNumbers() {
        Integer userNumbers = userDao.selectUserNumbers();
        return userNumbers % 10 == 0 ? userNumbers / 10 : userNumbers / 10 + 1;
    }

    @Override
    public void deleteUserByUserId(Integer userId) {
        userDao.deleteUserByUserId(userId);
    }

    @Override
    public void updateUserRoleTypeByUserId(Integer roleType, Integer userId) {
        userDao.updateUserRoleTypeByUserId(roleType, userId);
    }

    @Override
    public Boolean judgeUserIsInAllUserByUsername(String username) {
        if (userDao.selectUserByUsernameInAllUsers(username) == null) {
            return false;
        }
        return true;
    }

    @Override
    public void saveUser(Integer roleType, String nickname, String phoneNumber, String address,
                         String username, String password, String remark) {
        userDao.addUser(roleType, nickname, phoneNumber, address, username,DecriptUtil.MD5(password), remark);
    }

}

