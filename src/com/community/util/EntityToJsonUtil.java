package com.community.util;/**
 * @ClassName:
 * @Description: TODO
 * @author linyb3
 * @date
 */

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class EntityToJsonUtil {
    /***
     * 从request取出请求实体，返回byt类型数据
     *
     * @param request
     * @return byte[]
     * @throws IOException
     */
    public static byte[] getRequestPostBytes(HttpServletRequest request)
            throws IOException {
        int contentLength = request.getContentLength();
        if(contentLength<0){
            return null;
        }
        byte buffer[] = new byte[contentLength];
        for (int i = 0; i < contentLength;) {

            int readlen = request.getInputStream().read(buffer, i,
                    contentLength - i);
            if (readlen == -1) {
                break;
            }
            i += readlen;
        }
        return buffer;
    }
    /***
     * 从request取出请求实体，返回byt类型数据，并转化成String对象
     *
     * @param request
     * @return
     * @throws IOException
     */
    public static String getRequestPostStr(HttpServletRequest request)
            throws IOException {
        byte buffer[] = getRequestPostBytes(request);
        String charEncoding = request.getCharacterEncoding();
        if (charEncoding == null) {
            charEncoding = "UTF-8";
        }
        return new String(buffer, charEncoding);
    }

    public  static JSONObject getRequestPostJson(HttpServletRequest request) throws IOException {
        String requestPostStr = getRequestPostStr(request);
        JSONObject object =  JSON.parseObject(requestPostStr);
        return object;
    }
}
