package com.community.service.interfaces;

import com.community.bean.Student;

/** 
* @author  ���� :zhengym
* @date ����ʱ�䣺2019��1��25�� ����12:08:17
* @version 1.0 
* @desrciption		
*/
public interface IStudentService {
	//����ѧ�Ż�ȡѧ����Ϣ
	public Student getStudentInfoById(String stuNum);
	
	//��������id��ȡ�᳤��Ϣ
	public Student getGeneralInfoByClubId(String clubId);
}
