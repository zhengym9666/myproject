package com.community.service.impl;

import com.community.bean.User;
import com.community.dao.UserDAO;
import com.community.service.interfaces.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ClassName:
 * @Description: TODO
 * @author linyb3
 * @date
 */

@Service("userService")
public class UserServiceImpl implements IUserService {
    @Autowired
    private UserDAO userMapper;

    @Override
    public User queryUserById(String id) {
        return userMapper.queryUserById(id);
    }

    public static void main(String[] args) {
        User user = new UserServiceImpl().queryUserById("123");
        System.out.println(user);
    }
}
