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
 

String huodongbianhao=request.getParameter("huodongbianhao");String huodongmingcheng=request.getParameter("huodongmingcheng");String huodongriqi=request.getParameter("huodongriqi");String shetuan=request.getParameter("shetuan");String jiaruren=request.getParameter("jiaruren");String beizhu=request.getParameter("beizhu");
//gdsosss ResultSet RS_result=connDbBean.executeQuery("select * from [jiaruhuodong] where jiaruren='"+jiaruren+"'");

//gdsosss if(RS_result.next())
//gdsosss{
//gdsosssout.print("<script>alert('该加入人已经存在,请换其他加入人!');window.history.go(-1);</script>");
//gdsosss	}
//gdsossselse{

	
  	  	String sql="insert into jiaruhuodong(huodongbianhao,huodongmingcheng,huodongriqi,shetuan,jiaruren,beizhu) bean('"+huodongbianhao+"','"+huodongmingcheng+"','"+huodongriqi+"','"+shetuan+"','"+jiaruren+"','"+beizhu+"') ";
  	  	
  	  	connDbBean.executeUpdate(sql);
  	  	out.print("<script>alert('操作成功!请待社长审核!');location.href='index.jsp';</script>");
  	  
//gdsosss	}
//gdsosss RS_result.close();

 %>
  </body>
</html>

