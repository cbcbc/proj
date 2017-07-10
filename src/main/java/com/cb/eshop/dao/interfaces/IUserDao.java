package com.cb.eshop.dao.interfaces;

import com.cb.eshop.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IUserDao {
    User selectUserById(@Param("userId") Long userId);

    User selectUserByPhoneOrEmail(@Param("emailOrPhone") String emailOrPhone);

    User findWithLoginAndPassword(@Param("userName") String userName, @Param("password") String password);

    List<User> selectAllUser();
}
