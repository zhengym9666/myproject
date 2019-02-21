package com.community.service.interfaces;/**
 * @ClassName:
 * @Description: TODO
 * @author linyb3
 * @date
 */

import com.community.model.base.Token;

public interface ITokenService {
    public Token getTokenByUserId(String userId);

    public  Token getTokenById(String tokenId);

    public  Token createToken(String userId) ;

    public  Token updateToken(String tokenId);

    public  boolean deleteToken(String tokenId);

}
