package activiti.common;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngineConfiguration;

/**
 * �������湤����
 * @author LEE.SIU.WAH
 * @email lixiaohua7@163.com
 * @date 2016��7��5�� ����5:32:33
 * @version 1.0
 */
public class ProcessEngineUtils {
	/** ��������������� */
	private static ProcessEngine processEngine;
	static{
		/** ������������������Ϣ����(����һ����������������������Ϣ����) */
		ProcessEngineConfiguration pec = ProcessEngineConfiguration
					.createStandaloneProcessEngineConfiguration();
		/** ������������������Ϣ�����еķ�������������Ϣ */
		/** �������ݿ����� */
		pec.setDatabaseType("mysql");
		/** 
		 * ���ô������ݿ��ķ�ʽ:
		 * ProcessEngineConfiguration.DB_SCHEMA_UPDATE_TRUE(true):  ���û�����ݿ��ͻᴴ�����еĻ��Ͳ�����������ǰ汾�����ͻ��޸�
		 * ProcessEngineConfiguration.DB_SCHEMA_UPDATE_FALSE(false): ���ᴴ���������ݿ��
		 * ProcessEngineConfiguration.DB_SCHEMA_UPDATE_CREATE_DROP(create-drop): ÿ�ζ����ȴ������ݿ����ɾ��
		 */
		pec.setDatabaseSchemaUpdate(ProcessEngineConfiguration.DB_SCHEMA_UPDATE_TRUE);
		/** �������ݿ����� */
		pec.setJdbcDriver("com.mysql.jdbc.Driver");
		/** �����������ݿ��URL */
		pec.setJdbcUrl("jdbc:mysql://localhost:3306/community?useUnicode=true&characterEncoding=utf-8");
		/** �����������ݿ���û��� */
		pec.setJdbcUsername("root");
		/** �����������ݿ������ */
		pec.setJdbcPassword("root");
		
		/** ��������ͼ�ڵ��ϵ����� */
		pec.setActivityFontName("����");
		/** �������������������*/
		pec.setLabelFontName("����");
		/** ����xml�ļ����������*/
		pec.setXmlEncoding("utf-8");
		/** �����ʼ���ص����� */
		/**�����ʼ���������������*/
		pec.setMailServerHost("smtp.163.com");
		/** ����Ĭ�ϵ��ʼ������� */
		pec.setMailServerDefaultFrom("fkjava8888@163.com");
		/** �����ʼ������û��� */
		pec.setMailServerUsername("fkjava8888");
		/** �����ʼ���������*/
		pec.setMailServerPassword("fkjava888");
		/** ���ÿ�����ʱ����*/
		pec.setJobExecutorActivate(true);
		
		/** ����������������Ϣ���󹹽��������� */
		processEngine = pec.buildProcessEngine();
	}
	
	public static ProcessEngine getProcessEngine(){
		return processEngine;
	}
}
