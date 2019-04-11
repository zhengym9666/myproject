/**
 * @ClassName:
 * @Description: TODO
 * @author linyb3
 * @date
 */

import com.community.bean.GroupMember;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

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
        /*StringBuilder studentIds=new StringBuilder();
        studentIds.append("a,b,x,");
        studentIds.delete(studentIds.length()-1,studentIds.length());
        System.out.println(studentIds.toString());*/
        List<String> list=new ArrayList<>();
        list.add(null);
        list.add("as");
        System.out.println(list);
        Iterator<String> iterator = list.iterator();
        while (iterator.hasNext()){
            String next = iterator.next();
            if(next==null){
                iterator.remove();
            }
        }
        System.out.println(list);

    }
}
