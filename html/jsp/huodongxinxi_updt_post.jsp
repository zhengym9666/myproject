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
String huodongbianhao=request.getParameter("huodongbianhao");String huodongmingcheng=request.getParameter("huodongmingcheng");String huodongzhuti=request.getParameter("huodongzhuti");String fuzeren=request.getParameter("fuzeren");String zhubandanwei=request.getParameter("zhubandanwei");String chengbandanwei=request.getParameter("chengbandanwei");String huodongriqi=request.getParameter("huodongriqi");String wupinjieyong=request.getParameter("wupinjieyong");String shetuan=request.getParameter("shetuan");String beizhu=request.getParameter("beizhu");
String id=request.getParameter("id");
String sql="update huodongxinxi set huodongbianhao='"+huodongbianhao+"',huodongmingcheng='"+huodongmingcheng+"',huodongzhuti='"+huodongzhuti+"',fuzeren='"+fuzeren+"',zhubandanwei='"+zhubandanwei+"',chengbandanwei='"+chengbandanwei+"',huodongriqi='"+huodongriqi+"',wupinjieyong='"+wupinjieyong+"',shetuan='"+shetuan+"',beizhu='"+beizhu+"' where id= "+id;
connDbBean.executeUpdate(sql);
out.print("<script>alert('ÐÞ¸Ä³É¹¦!!');location.href='huodongxinxi_updt.jsp?id="+id+"';</script>");
%>
  </body>
</html>


