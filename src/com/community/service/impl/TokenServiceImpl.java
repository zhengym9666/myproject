package com.community.service.impl;/**
 * @ClassName:
 * @Description: TODO
 * @author linyb3
 * @date
 */

import com.community.bean.Student;
import com.community.config.CommonConfigUCenter;
import com.community.dao.StudentDAO;
import com.community.dao.TokenDAO;
import com.community.model.base.Token;
import com.community.model.base.TokenCriteria;
import com.community.service.interfaces.ITokenService;
import com.community.util.IdUtil;
import com.community.util.MybatisUtil;
import com.community.util.StringUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("tokenService")
public class TokenServiceImpl extends AbsServiceImpl<TokenDAO> implements ITokenService {
//    @Autowired
//    private TokenDAO tokenMapper;
    private static transient Log log = LogFactory.getLog(TokenServiceImpl.class);

    public Token getTokenByUserId(String userId) {
        if (StringUtil.stringIsNull(userId)) {
            return null;
        }
        try {
            TokenCriteria tokenCriteria = new TokenCriteria();
            TokenCriteria.Criteria criteria = tokenCriteria.createCriteria();
            criteria.andUserIdEqualTo(userId);
            List<Token> tokenList = mapper.selectByExample(tokenCriteria);
            if (tokenList == null || tokenList.size() == 0) {
                return null;
            }
            return tokenList.get(0);
        } catch (Exception e) {
           log.info("获取token异常:"+e);
            return null;
        } finally {
        }
    }

    public  Token getTokenById(String tokenId) {
        if (StringUtil.stringIsNull(tokenId)) {
            return null;
        }
        try {

            Token token = mapper.selectByPrimaryKey(tokenId);
            return token;
        } catch (Exception e) {
            log.info("获取token异常:"+e);
            return null;
        } finally {
        }
    }

    public  Token createToken(String userId,String club_id) {
        if (StringUtil.stringIsNull(userId)) {
            return null;
        }
        Token token = new Token();
        Date date = new Date();
        token.setTokenCreateTime(date);
        token.setTokenUpdateTime(date);
        Date expireTime = new Date(date.getTime() + CommonConfigUCenter.TOKEN_EXPIRE_TIME);
        token.setTokenExpireTime(expireTime);
        token.setUserId(userId);
        token.setTokenId(IdUtil.getUuid());
        token.setCur_club_id(club_id);

        try {

            int result = mapper.insert(token);
            if (result == 0) {
                log.info("创建token失败");
                return null;
            }
            return token;
        } catch (Exception e) {
            log.info("创建token异常:"+e);
            return null;
        } finally {
        }
    }

    public  Token updateToken(String tokenId,String clubId) {
        if (StringUtil.stringIsNull(tokenId)) {
            return null;
        }
        Token token = getTokenById(tokenId);
        if (token == null) {
            return null;
        }
        token = new Token();
        Date date = new Date();
        token.setTokenId(tokenId);
        token.setTokenUpdateTime(date);
        Date expireTime = new Date(date.getTime() + CommonConfigUCenter.TOKEN_EXPIRE_TIME);
        token.setTokenExpireTime(expireTime);
        token.setCur_club_id(clubId);

        try {
            int result = mapper.updateByPrimaryKeySelective(token);
            if (result == 0) {
                log.info("更新token失败");
                return null;
            }
            return token;
        } catch (Exception e) {
            log.info("更新token失败:"+e);
            return null;
        } finally {
        }
    }

    public  boolean deleteToken(String tokenId) {
        if (StringUtil.stringIsNull(tokenId)) {
            return false;
        }
        Token token = getTokenById(tokenId);
        if (token == null) {
            return false;
        }
        try {
            int result = mapper.deleteByPrimaryKey(tokenId);
            if (result == 0) {
                log.info("删除token失败");

                return false;
            }
            return true;
        } catch (Exception e) {
            log.info("删除token失败:"+e);
            return false;
        } finally {
        }
    }

    @Override
    public Token getTokenByToken(String token) {
        return mapper.getTokenByToken(token);
    }

    SqlSessionFactory sqlSessionFactory;
//    @Before
//    public void init() throws Exception{
//        //  1.加载核心配置文件：sqlMapConfig.xml
//        // 参数resource：指定核心配置文件的位置
//        InputStream inputStream = Resources.getResourceAsStream("test/test.xml");
////        BufferedInputStream bf=new BufferedInputStream(inputStream);
//        /*byte bea[]=new byte[1024];
//        int len=0;
//        int temp=0;
//        while((temp=bf.read(bea))!=-1){
//            bea[len]= (byte) temp;
//                    len++;
//        }
//        System.out.println(new String(bea,0,len));*/
//
//        // 2.读取配置文件内容
//        SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
//        // sqlSessionFactory对象，是mybatis框架的核心对象，一个应用（项目）只需要一个
//        sqlSessionFactory = builder.build(inputStream);
//
//    }
//    @Test
//    public void test(){
//        // 1.创建sqlSession对象
//        SqlSession sqlSession = this.sqlSessionFactory.openSession();
//
//        // 2.使用sqlSession对象，获取mapper接口代理对象
//        //getMapper方法：获取mapper接口的代理对象
//        // 参数：mapper接口的class
//        tokenMapper = sqlSession.getMapper(TokenDAO.class);
//
//        // 3.使用mapper代理对象，调用方法执行
//
//        TokenServiceImpl impl =new TokenServiceImpl();
////        impl.createToken("213");
//        Token token = impl.getTokenByUserId("213");
//        System.out.println(token);
//
//        sqlSession.commit();
//        // 4.释放资源
//        sqlSession.close();
//    }

   public static void main(String[] args) throws Exception {
       MybatisUtil mybatisUtil=new MybatisUtil();
       TokenServiceImpl service = mybatisUtil.getMapperServiceImplObject(TokenDAO.class, TokenServiceImpl.class);
       Token tokenByToken = service.getTokenByToken("585ada75663d4dbe88bd3a49f08a2567");
       mybatisUtil.commit();
       System.out.println(tokenByToken);
   }
}
