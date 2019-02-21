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
//gdsosss ResultSet RS_result=connDbBean.executeQuery("select * from [caiwujilu] where shetuanmingcheng='"+shetuanmingcheng+"'");

//gdsosss if(RS_result.next())
//gdsosss{
//gdsosssout.print("<script>alert('该社团名称已经存在,请换其他社团名称!');window.history.go(-1);</script>");
//gdsosss	}
//gdsossselse{

	
  	  	String sql="insert into caiwujilu(shetuanmingcheng,jine,shouzhi,jingshouren,xiangmumingcheng,riqi,beizhu) bean('"+shetuanmingcheng+"','"+jine+"','"+shouzhi+"','"+jingshouren+"','"+xiangmumingcheng+"','"+riqi+"','"+beizhu+"') ";
  	  	
  	  	connDbBean.executeUpdate(sql);
  	  	out.print("<script>alert('添加成功!!');location.href='caiwujilu_add.jsp';</script>");
  	  
//gdsosss	}
//gdsosss RS_result.close();

 %>
  </body>
</html>

