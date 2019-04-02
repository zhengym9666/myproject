package com.community.service.interfaces;/**
 * @ClassName:
 * @Description: TODO
 * @author linyb3
 * @date
 */

import com.community.bean.Student;
import com.community.model.base.Token;

public interface ITokenService {
    public Token getTokenByUserId(String userId);

    public  Token getTokenById(String tokenId);

    public  Token createToken(String userId,String clubId) ;

    public  Token updateToken(String tokenId,String clubId);

    public  boolean deleteToken(String tokenId);

    Token getTokenByToken(String token);
}
