/**
 * @ClassName:
 * @Description: TODO
 * @author linyb3
 * @date
 */

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.community.bean.Student;

/**
 * @ClassName:
 * @Description: TODO
 * @author linyb3
 * @date
 *
 */
public class testJsonTo {
    public static void main(String[] args) {
        Student student=new Student();
        student.sethOpCode("23");
        student.setStuName("213");
        student.setStuPass("21322");
        student.sethOpCode("233");
        //JSONObject o =  JSON.toJSONString();
        System.out.println();

    }
}
