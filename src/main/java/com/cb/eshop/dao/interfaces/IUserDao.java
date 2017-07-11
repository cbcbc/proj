package com.cb.eshop.dao.interfaces;

import com.cb.eshop.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface IUserDao {
    User selectUserByUsername(@Param("username") String username);
}
