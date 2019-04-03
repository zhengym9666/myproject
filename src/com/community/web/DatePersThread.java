package com.community.web;

import com.community.bean.Fee;
import com.community.dao.NewsDAO;
import com.community.service.impl.NewsServiceImpl;
import com.community.service.interfaces.INewsService;
import com.community.util.MybatisUtil;
import com.community.util.UploadImageUtil;import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * @ClassName:
 * @Description: 数据持久化进程，启动项目的时候执行
 * @author linyb3
 * @date
 */
@Controller
@RequestMapping(value="/datePers")
public class DatePersThread extends Thread{
    private static transient org.apache.commons.logging.Log log = LogFactory.getLog(UploadImageUtil.DatePersThread.class);
    @Autowired
    private INewsService newsService;

    @RequestMapping("/test.action")
    @ResponseBody
    public Map<String,Object> queryCode(HttpServletRequest request){
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("wechatCode", "12321");
        return resultMap;

    }

    private static Map<String,Integer> map=new HashMap();
    @Override
    public void run() {
        Thread th = Thread.currentThread();
        long start=System.currentTimeMillis();
        while(true){
            long end =System.currentTimeMillis();
            //如果被中断则退出
            if(th.isInterrupted()){
                break;
            }
            try {
                int keySize = map.keySet().size();
                //超过缓存，获取大于10秒则进行保存
                if(keySize>10 || end-start>1000*10){
                    //开始保存到数据库
                    saveDateBase();
                    log.info("保存数据完成");
                    //清空map的数据
                    clearMap();
                    log.info("保存完清空当前数据");
                    start=System.currentTimeMillis();
                    ;
                }else{
                    log.info("暂时没有达到缓存最大值，暂不保存数据库，休息10秒");
                    sleep(10000l);
                }
            } catch (InterruptedException e) {
                e.printStackTrace();
                //防止中断信号来了之后，标记被清空
                th.interrupt();
            }

        }
    }

    private void clearMap() {
        map.clear();
    }

    //保存到数据库
    private void saveDateBase() {
        Set<Map.Entry<String, Integer>> entries = map.entrySet();
        for (Map.Entry<String, Integer> entry:entries){
            String key = entry.getKey();
            Integer count = entry.getValue();
            newsService.updateReadcount(key,count);
            log.info("保存 id"+key+"  count"+count);
        }
    }

    public static int getCountByKey(String key){
        return map.get(key)==null?0:map.get(key);
    }
    //根据原有的值进行保存
    public static void setCountByKey(String key,int count){
        Integer value= map.get(key);
        if(value!=null){
            value=value+1;
        }else{
            value=count+1;
        }
        map.put(key,value);
    }

    public void setNewsService(INewsService newsService) {
        this.newsService = newsService;
    }

    public static void main(String[] args) throws Exception {
        MybatisUtil mybatisUtil=new MybatisUtil();


        UploadImageUtil.DatePersThread datePersThread = new UploadImageUtil.DatePersThread();
        INewsService service = mybatisUtil.getMapperServiceImplObject(NewsDAO.class, NewsServiceImpl.class);
        datePersThread.setNewsService(service);
        datePersThread.start();
        datePersThread.setCountByKey("2000002",200);

    }
}
