package com.community.dao;

import com.community.bean.User;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName:
 * @Description: TODO
 * @author linyb3
 * @date
 */

public interface UserDAO {
    //�����û�id��ѯ�û�
    public User queryUserById(@Param("id")float id);
}
