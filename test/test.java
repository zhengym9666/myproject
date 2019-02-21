/**
 * @ClassName:
 * @Description: TODO
 * @author linyb3
 * @date
 */

import com.community.bean.GroupMember;

/**
 * @ClassName:
 * @Description: TODO
 * @author linyb3
 * @date
 *
 */
public class test {
    public static void main(String[] args) {
        //System.out.println("/news/newscontent.action".contains("newscontent.action"));
        StringBuilder studentIds=new StringBuilder();
        studentIds.append("a,b,x,");
        studentIds.delete(studentIds.length()-1,studentIds.length());
        System.out.println(studentIds.toString());
    }
}
