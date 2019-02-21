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
//gdsosss ResultSet RS_result=connDbBean.executeQuery("select * from [huodongxinxi] where shetuan='"+shetuan+"'");

//gdsosss if(RS_result.next())
//gdsosss{
//gdsosssout.print("<script>alert('该社团已经存在,请换其他社团!');window.history.go(-1);</script>");
//gdsosss	}
//gdsossselse{

	
  	  	String sql="insert into huodongxinxi(huodongbianhao,huodongmingcheng,huodongzhuti,fuzeren,zhubandanwei,chengbandanwei,huodongriqi,wupinjieyong,shetuan,beizhu) bean('"+huodongbianhao+"','"+huodongmingcheng+"','"+huodongzhuti+"','"+fuzeren+"','"+zhubandanwei+"','"+chengbandanwei+"','"+huodongriqi+"','"+wupinjieyong+"','"+shetuan+"','"+beizhu+"') ";
  	  	
  	  	connDbBean.executeUpdate(sql);
  	  	out.print("<script>alert('添加成功!!');location.href='huodongxinxi_add.jsp';</script>");
  	  
//gdsosss	}
//gdsosss RS_result.close();

 %>
  </body>
</html>

