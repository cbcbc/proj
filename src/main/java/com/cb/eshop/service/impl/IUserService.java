package com.cb.eshop.service.impl;

import com.cb.eshop.model.User;
import java.util.List;

public interface IUserService {
    List<User> getAllUser();

    User getUserByPhoneOrEmail(String emailOrPhone);

    User getUserById(Long userId);

    User login(String userName,String password);
}
