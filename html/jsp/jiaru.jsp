<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'adminyanzheng.jsp' starting page</title>
    

  </head>
  
  <body>
  <%
 

String st=new String(request.getParameter("st").getBytes("8859_1"));

String sql="update sheyuanxinxi set shetuan='"+st+"' where xuehao='"+request.getSession().getAttribute("username")+"'";
  	  	
connDbBean.executeUpdate(sql);
out.print("<script>alert('²Ù×÷³É¹¦!!');location.href='index.jsp';</script>");
  	  


 %>
  </body>
</html>

