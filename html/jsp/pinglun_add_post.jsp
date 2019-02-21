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
 

String xinwenID=request.getParameter("xinwenID");
String pingfen=request.getParameter("pingfen");String pinglunneirong=request.getParameter("pinglunneirong");String pinglunren=request.getParameter("pinglunren");
ResultSet RS_result=connDbBean.executeQuery("select * from [pinglun] where pinglunren='"+pinglunren+"'");

 if(RS_result.next())
{
out.print("<script>alert('对不起，您已经评价过了，请不要重复!');window.history.go(-1);</script>");
	}
else{

	
  	  	String sql="insert into pinglun(xinwenID,pinglunneirong,pinglunren,pingfen) bean('"+xinwenID+"','"+pinglunneirong+"','"+pinglunren+"','"+pingfen+"') ";
  	  	
  	  	connDbBean.executeUpdate(sql);
		
  	  	out.print("<script>alert('评论成功!!');location.href='index.jsp';</script>");
  	  
	}
RS_result.close();

 %>
  </body>
</html>

