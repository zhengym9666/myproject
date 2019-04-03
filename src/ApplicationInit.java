/**
 * @ClassName:
 * @Description: TODO
 * @author linyb3
 * @date
 */

import com.community.util.DatePersThread;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * @ClassName:
 * @Description: TODO
 * @author linyb3
 * @date
 *
 */
public class ApplicationInit implements ServletContextListener {
    private static transient Log log = LogFactory.getLog(ApplicationInit.class);
    DatePersThread datePersThread;
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        //启动持久化进行
        datePersThread = new DatePersThread();
        datePersThread.start();

        log.info("应用程序初始化，开启线程");
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        datePersThread.interrupt();
        datePersThread.colseDatesource();
        log.info("应用程序销毁,退出线程");
    }
}
