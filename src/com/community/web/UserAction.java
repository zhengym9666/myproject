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
    public ResponseEntity<User> queryUserById(@PathVariable("userId")Long userId){

        try {
            //�����û�id��ѯ�û�
            User user = userService.queryUserById(userId);

            return ResponseEntity.ok(user);
        } catch (Exception e) {
            e.printStackTrace();
        }

        //����500
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }
}
