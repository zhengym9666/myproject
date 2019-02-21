package com.community.web;

import com.community.bean.User;
import com.community.service.interfaces.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @ClassName:
 * @Description: TODO
 * @author linyb3
 * @date
 */
@Controller
@RequestMapping("/user")
public class UserAction {
    @Autowired
    private IUserService userService;

    @RequestMapping(value = "/{userId}", method = RequestMethod.GET)
    public ResponseEntity<User> queryUserById(@PathVariable("userId")String userId){

        try {
            //根据用户id查询用户
            User user = userService.queryUserById(userId);

            return ResponseEntity.ok(user);
        } catch (Exception e) {
            e.printStackTrace();
        }

        //返回500
        return ResponseEntity.status(HttpStatus.OK).body(null);
    }


}
