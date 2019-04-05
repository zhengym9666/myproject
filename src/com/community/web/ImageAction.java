package com.community.web;

import com.community.bean.Student;
import com.community.service.interfaces.IStudentService;
import com.community.util.CommonStatic;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;

/**
 * @ClassName:
 * @author linyb3
 * @date
 */
@Controller
@RequestMapping("/image")
public class ImageAction {
    @Autowired
    IStudentService studentService;
    private static transient Log log = LogFactory.getLog(StudentAction.class);

    //返回二进制图片
    @ResponseBody
    @RequestMapping(value="/{studentId}",method=RequestMethod.GET)
    public void imageById(@PathVariable("studentId")String studentId,HttpServletRequest request, HttpServletResponse response) throws IOException {
        OutputStream out=null;
        try {
            response.setContentType("image/png");
            //获取该学生信息
            Student student = studentService.getStudentInfoById(studentId);
            if(student==null){
                log.error("找不到该学生，请重试，学生ID"+studentId);
                return;
            }
            //获取学生图片名称
            String imageName = student.getHead();
            String suffix = null;
            File file = new File(CommonStatic.IMAGE_PATH+imageName);
            //查询图片是否存在
            if(file.exists() && (imageName!=null && imageName.length()>0)){
                suffix=imageName.substring(imageName.lastIndexOf(".")+1);
                //没有上传图片则获取默认图片
            }else{
                imageName="default.png";
                String defaultPath = request.getServletContext().getRealPath("/stuchat/js/anychat/images/");
                suffix = imageName.substring(imageName.lastIndexOf(".")+1);
                file = new File(defaultPath+imageName);
                if(!file.exists()){
                    log.error("获取不到学生的默认图片，路径："+defaultPath+imageName);
                }
            }
            if(file.exists()){
                out= response.getOutputStream();
                BufferedImage read = ImageIO.read(file);
                ImageIO.write(read,suffix,out);
            }
        } finally {
            if(out!=null){
                out.close();
            }
        }
    }


}
