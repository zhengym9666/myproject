package service.action;

import com.opensymphony.xwork2.Action;

public class CollegeAction implements Action{

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("执行了CollegeAction的excute方法");
		
		return "success";
	}

}
