package com.cb.eshop.service.interfaces;

import com.cb.eshop.model.User;
import java.util.List;

public interface IUserService {
    User getUserByUsername(String username);
}
