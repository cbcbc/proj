package com.cb.eshop.authority;

import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import com.cb.eshop.model.User;
import com.cb.eshop.service.interfaces.IUserService;
import org.springframework.stereotype.Component;

@Component
public class UserRealm extends AuthorizingRealm {

    @Resource
    private IUserService userService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String username = (String) principals.fromRealm(getName()).iterator().next();
        User user = userService.getUserByUsername(username);
        Short roleType = user.getRoleType();
        if (roleType != null) {
            SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
            info.addRole(roleType.toString());
            return info;
        } else {
            return null;
        }
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        // 1. 把AuthenticationToken转换为UsernamePasswordToken
        UsernamePasswordToken upToken = (UsernamePasswordToken) token;
        // 2. 从UsernamePasswordToken中获取username
        String username = upToken.getUsername();
        // 3. 若用户不存在，抛出UnknownAccountException异常
        User user = userService.getUserByUsername(username);
        if (user == null)
            throw new UnknownAccountException("The user don't exist!");
        // 4.根据用户的情况，来构建AuthenticationInfo对象并返回，通常使用的实现类为SimpleAuthenticationInfo
        // 以下信息从数据库中获取
        // （1）principal：认证的实体信息，可以是username，也可以是数据表对应的用户的实体类对象
        Object principal = username;
        // （2）credentials：密码
        Object credentials = user.getPassword();
        // （3）realmName：当前realm对象的name，调用父类的getName()方法即可
        String realmName = getName();
        // （4）盐值：取用户信息中唯一的字段来生成盐值，避免由于两个用户原始密码相同，加密后的密码也相同
        ByteSource credentialsSalt = ByteSource.Util.bytes(username);
        return new SimpleAuthenticationInfo(principal, credentials, credentialsSalt, realmName);
    }

}
