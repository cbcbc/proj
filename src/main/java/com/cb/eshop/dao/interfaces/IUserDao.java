package com.cb.eshop.dao.interfaces;

import com.cb.eshop.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IUserDao {
    User selectUserByUsername(@Param("username") String username);

    User selectUserByUsernameInAllUsers(@Param("username") String username);

    List<User> selectSomeUsersFromStartId(@Param("startId") Integer startId);

    Integer selectUserNumbers();

    void deleteUserByUserId(@Param("userId") Integer userId);

    void updateUserRoleTypeByUserId(@Param("roleType") Integer roleType, @Param("userId") Integer userId);

    void addUser(@Param("roleType") Integer roleType, @Param("nickname") String nickname,
                 @Param("phoneNumber") String phoneNumber, @Param("address") String address,
                 @Param("username") String username, @Param("password") String password,
                 @Param("remark") String remark);

    void updateManagerInfoByUsername(@Param("nickname") String nickname, @Param("phoneNumber") String phoneNumber,
                           @Param("remark") String remark, @Param("username") String username);

    void updateSellerInfoByUsername();

    void updateOrdinaryUserInfoByUsername();

    void updatePasswordByUsername(@Param("username") String username, @Param("password") String password);

    Integer selectRoleTypeByUserId(@Param("userId") Integer userId);
}
