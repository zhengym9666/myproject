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
 ResultSet RS_result=connDbBean.executeQuery("select * from [shetuanxinxi] where shetuanmingcheng='"+shetuanmingcheng+"'");

 if(RS_result.next())
{
out.print("<script>alert('该社团名称已经存在,请换其他社团名称!');window.history.go(-1);</script>");
	}
else{

	
  	  	String sql="insert into shetuanxinxi(shetuanmingcheng,jianjie,xingzhi,chuangshiren,fuzeren,chuangbanriqi,guakaodanwei,renshu) bean('"+shetuanmingcheng+"','"+jianjie+"','"+xingzhi+"','"+chuangshiren+"','"+fuzeren+"','"+chuangbanriqi+"','"+guakaodanwei+"','"+renshu+"') ";
  	  	
  	  	connDbBean.executeUpdate(sql);
  	  	out.print("<script>alert('添加成功!!');location.href='shetuanxinxi_add.jsp';</script>");
  	  
	}
 RS_result.close();

 %>
  </body>
</html>

