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
String shetuanmingcheng=request.getParameter("shetuanmingcheng");String jianjie=request.getParameter("jianjie");String xingzhi=request.getParameter("xingzhi");String chuangshiren=request.getParameter("chuangshiren");String fuzeren=request.getParameter("fuzeren");String chuangbanriqi=request.getParameter("chuangbanriqi");String guakaodanwei=request.getParameter("guakaodanwei");String renshu=request.getParameter("renshu");
String id=request.getParameter("id");
String sql="update shetuanxinxi set shetuanmingcheng='"+shetuanmingcheng+"',jianjie='"+jianjie+"',xingzhi='"+xingzhi+"',chuangshiren='"+chuangshiren+"',fuzeren='"+fuzeren+"',chuangbanriqi='"+chuangbanriqi+"',guakaodanwei='"+guakaodanwei+"',renshu='"+renshu+"' where id= "+id;
connDbBean.executeUpdate(sql);
out.print("<script>alert('ÐÞ¸Ä³É¹¦!!');location.href='shetuanxinxi_updt.jsp?id="+id+"';</script>");
%>
  </body>
</html>


