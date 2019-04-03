package com.community.util;

import com.community.bean.Club;
import com.community.bean.UserGroupData;
import com.community.dao.ClubDAO;
import com.community.service.impl.AbsServiceImpl;
import com.community.service.impl.ClubServiceImpl;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.omg.CORBA.OBJ_ADAPTER;

import java.io.InputStream;
import java.lang.reflect.Method;
import java.lang.reflect.Type;

/**
 * @ClassName:
 * @Description: TODO
 * @author linyb3
 * @date
 */

public  class MybatisUtil {
    SqlSession sqlSession;
    public SqlSessionFactory initSqlSessionFactory() throws Exception{
        //  1.���غ��������ļ���sqlMapConfig.xml
        // ����resource��ָ�����������ļ���λ��
        InputStream inputStream = Resources.getResourceAsStream("test/testSqlMapConfig.xml");
        // 2.��ȡ�����ļ�����
        SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
        // sqlSessionFactory������mybatis��ܵĺ��Ķ���һ��Ӧ�ã���Ŀ��ֻ��Ҫһ��
        SqlSessionFactory sqlSessionFactory = builder.build(inputStream);
        return sqlSessionFactory;
    }
    public <A> A getMapperObject(Class<A> mapperClazz) throws Exception {
        // 1.����sqlSession����
        sqlSession = initSqlSessionFactory().openSession();

        // 2.ʹ��sqlSession���󣬻�ȡmapper�ӿڴ������
        //getMapper��������ȡmapper�ӿڵĴ������
        // ������mapper�ӿڵ�class
        A object = sqlSession.getMapper(mapperClazz);
        // 3.ʹ��mapper������󣬵��÷���ִ��
        return  object;
    }


    public <T,A> T getMapperServiceImplObject(Class<A> mapperClazz,Class<T> serviceImplClazz) throws Exception {
        A mapperObject = getMapperObject(mapperClazz);
        T serviceImplObject = (T) serviceImplClazz.newInstance();
        //####ִ�з��ͷ��� ����һ����ȡ����ĸ��ִ࣬�и���ķ�����ʵ��ִ������ķ�����
//        Class<? super T> superclass = serviceImplClazz.getSuperclass();
//        Method setMapperMethod = superclass.getDeclaredMethod("setMapper", Object.class);
        //####ִ�з��ͷ��� ����������ȡ����ĸ���ķ�����ֱ�ӵ�������ĸ���ķ�����
            //���ҷ���������1��������  2�������Ķ������ڳ������Ƿ��ͣ�����ֻ����Object����߶�����������÷��ͻ����ʧ�ܣ���Ϊ���������ʱ���Ѿ��Ǿ���������ˣ����Բ��Ҳ���
        Method setMapperMethod = serviceImplObject.getClass().getMethod("setMapper", Object.class);
        //ִ�з�������ȫ������ʵ�����Ķ���serviceImplObject �����߶���mapperObject dao��ʵ����
        setMapperMethod.invoke(serviceImplObject,mapperObject);
        return serviceImplObject;
    }

    public void commit(){
        //�ύ����
        sqlSession.commit();
    }
    public void close(){
        //�ͷ���Դ
        sqlSession.close();
    }

    public static void main(String[] args) throws Exception {
        //ʹ��ʾ��
        MybatisUtil util=new MybatisUtil();
        ClubServiceImpl service = util.getMapperServiceImplObject(ClubDAO.class,ClubServiceImpl.class);
        Club club = service.queryUserGroup("1010100");
        util.commit();
        System.out.println(club);

    }
}
