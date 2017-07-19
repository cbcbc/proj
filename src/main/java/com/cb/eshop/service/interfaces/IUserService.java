package com.cb.eshop.service.interfaces;

import com.cb.eshop.model.User;
import java.util.List;

public interface IUserService {
    User getUserByUsername(String username);

    List<User> getTenUsersByPageId(Integer pageId);

    Integer getUserPageNumbers();

    void deleteUserByUserId(Integer userId);

    void updateUserRoleTypeByUserId(Integer roleType, Integer userId);

    Boolean judgeUserIsInAllUserByUsername(String username);

    void saveUser(Integer roleType, String nickname, String phoneNumber, String address, String username,
                  String password, String remark);

    void updateUserInfoByUsername(String nickname, String phoneNumber, String address, String remark, String username, String mailAddress);

    void updatePasswordByUsername(String username, String password);

}
