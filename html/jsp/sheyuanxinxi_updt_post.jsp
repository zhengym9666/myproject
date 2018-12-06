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
String id=request.getParameter("id");
String sql="update sheyuanxinxi set xuehao='"+xuehao+"',xingming='"+xingming+"',mima='"+mima+"',zhuanye='"+zhuanye+"',banji='"+banji+"',sushe='"+sushe+"',lianxifangshi='"+lianxifangshi+"',zhaopian='"+zhaopian+"',beizhu='"+beizhu+"',shetuan='"+shetuan+"',shifoushechang='"+shifoushechang+"' where id= "+id;
connDbBean.executeUpdate(sql);
out.print("<script>alert('ÐÞ¸Ä³É¹¦!!');location.href='sheyuanxinxi_updt.jsp?id="+id+"';</script>");
%>
  </body>
</html>


