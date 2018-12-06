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
String shetuanmingcheng=request.getParameter("shetuanmingcheng");String jine=request.getParameter("jine");String shouzhi=request.getParameter("shouzhi");String jingshouren=request.getParameter("jingshouren");String xiangmumingcheng=request.getParameter("xiangmumingcheng");String riqi=request.getParameter("riqi");String beizhu=request.getParameter("beizhu");
String id=request.getParameter("id");
String sql="update caiwujilu set shetuanmingcheng='"+shetuanmingcheng+"',jine='"+jine+"',shouzhi='"+shouzhi+"',jingshouren='"+jingshouren+"',xiangmumingcheng='"+xiangmumingcheng+"',riqi='"+riqi+"',beizhu='"+beizhu+"' where id= "+id;
connDbBean.executeUpdate(sql);
out.print("<script>alert('ÐÞ¸Ä³É¹¦!!');location.href='caiwujilu_updt.jsp?id="+id+"';</script>");
%>
  </body>
</html>


