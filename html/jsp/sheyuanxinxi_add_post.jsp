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
 

String xuehao=request.getParameter("xuehao");String xingming=request.getParameter("xingming");String mima=request.getParameter("mima");String zhuanye=request.getParameter("zhuanye");String banji=request.getParameter("banji");String sushe=request.getParameter("sushe");String lianxifangshi=request.getParameter("lianxifangshi");String zhaopian=request.getParameter("zhaopian");String beizhu=request.getParameter("beizhu");String shetuan=request.getParameter("shetuan");String shifoushechang=request.getParameter("shifoushechang");
 ResultSet RS_result=connDbBean.executeQuery("select * from [sheyuanxinxi] where xuehao='"+xuehao+"'");

 if(RS_result.next())
{
out.print("<script>alert('该学号已经存在,请换其他学号!');window.history.go(-1);</script>");
	}
else{

	
  	  	String sql="insert into sheyuanxinxi(xuehao,xingming,mima,zhuanye,banji,sushe,lianxifangshi,zhaopian,beizhu,shetuan,shifoushechang) bean('"+xuehao+"','"+xingming+"','"+mima+"','"+zhuanye+"','"+banji+"','"+sushe+"','"+lianxifangshi+"','"+zhaopian+"','"+beizhu+"','"+shetuan+"','"+shifoushechang+"') ";
  	  	
  	  	connDbBean.executeUpdate(sql);
  	  	out.print("<script>alert('添加成功!!');location.href='sheyuanxinxi_add.jsp';</script>");
  	  
	}
 RS_result.close();

 %>
  </body>
</html>

