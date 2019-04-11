/**
 * @ClassName:
 * @Description: TODO
 * @author linyb3
 * @date
 */

import java.util.ResourceBundle;

/**
 * @ClassName:
 * @Description: TODO
 * @author linyb3
 * @date
 *
 */
public class getResource {
    public static void main(String[] args) {
        ResourceBundle resource = ResourceBundle.getBundle("admin/chat");
        String admin_host = resource.getString("ws_url");
        System.out.println(admin_host);
    }
}
