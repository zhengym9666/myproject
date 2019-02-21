package com.community.web;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.community.bean.User;
import com.community.util.EntityToJsonUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @ClassName:
 * @Description: TODO
 * @author linyb3
 * @date
 *
 */
@Controller
@RequestMapping(value="/test")
public class TestAction {

    @RequestMapping("/test.action")
    public String mathBuild(HttpServletRequest request, HttpSession session) throws IOException {
        JSONObject ob = EntityToJsonUtil.getRequestPostJson(request);

        String userGroupTopId = ob.getString("userGroupTopId");
        System.out.println(userGroupTopId);
        return "";
    }


    /***
     * Get request query string, form method : post
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
     * Get request query string, form method : post
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
}