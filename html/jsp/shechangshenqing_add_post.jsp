<%@ page language="java"  pageEncoding="gb2312" import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
request.setCharacterEncoding("gb2312"); 
response.setCharacterEncoding("gb2312"); 
%>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'adminyanzheng.jsp' starting page</title>
    

  </head>
  
  <body>
  <%
 

String xuehao=request.getParameter("xuehao");String xingming=request.getParameter("xingming");String shetuan=request.getParameter("shetuan");String shenqingliyou=request.getParameter("shenqingliyou");
 ResultSet RS_result=connDbBean.executeQuery("select * from [shechangshenqing] where xuehao='"+xuehao+"'");

 if(RS_result.next())
{
out.print("<script>alert('您已经申请地了，请不要重复提交!');window.history.go(-1);</script>");
	}
else{

	
  	  	String sql="insert into shechangshenqing(xuehao,xingming,shetuan,shenqingliyou) values('"+xuehao+"','"+xingming+"','"+shetuan+"','"+shenqingliyou+"') ";
  	  	
  	  	connDbBean.executeUpdate(sql);
  	  	out.print("<script>alert('添加成功!!');location.href='shechangshenqing_add.jsp';</script>");
  	  
	}
 RS_result.close();

 %>
  </body>
</html>

