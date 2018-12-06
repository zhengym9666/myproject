
<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=sheyuanxinxi.xls");
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>模块名称</title>
    

  </head>
<%
String sql;
ResultSet RS_result;
%>
  <body >
  <p>已有模块名称列表：</p>
  

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>学号</td><td bgcolor='#CCFFFF'>姓名</td><td bgcolor='#CCFFFF'>密码</td><td bgcolor='#CCFFFF'>专业</td><td bgcolor='#CCFFFF'>班级</td><td bgcolor='#CCFFFF'>联系方式</td><td bgcolor='#CCFFFF' width='90' align='center'>照片</td><td bgcolor='#CCFFFF'>社团</td><td bgcolor='#CCFFFF'>是否社长</td><td bgcolor='#CCFFFF' width='80' align='center'>是否审核</td>
    <td width="138" align="center" bgcolor="CCFFFF">添加时间</td>
    

  </tr>
  <%
 
   sql="";
  sql="select * from sheyuanxinxi  order by id desc";
  RS_result=connDbBean.executeQuery(sql);
 String id="";
 String xuehao="";String xingming="";String mima="";String zhuanye="";String banji="";String sushe="";String lianxifangshi="";String zhaopian="";String beizhu="";String shetuan="";String shifoushechang="";String issh="";
 String addtime="";
 int i=0;

 while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
xuehao=RS_result.getString("xuehao");xingming=RS_result.getString("xingming");mima=RS_result.getString("mima");zhuanye=RS_result.getString("zhuanye");banji=RS_result.getString("banji");sushe=RS_result.getString("sushe");lianxifangshi=RS_result.getString("lianxifangshi");zhaopian=RS_result.getString("zhaopian");beizhu=RS_result.getString("beizhu");shetuan=RS_result.getString("shetuan");shifoushechang=RS_result.getString("shifoushechang");issh=RS_result.getString("issh");
 addtime=RS_result.getString("addtime");
 
%>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=xuehao %></td><td><%=xingming %></td><td><%=mima %></td><td><%=zhuanye %></td><td><%=banji %></td><td><%=sushe %></td><td><%=lianxifangshi %></td><td width='90'><a href='<%=zhaopian %>' target='_blank'><img src='<%=zhaopian %>' width=88 height=99 border=0 /></a></td><td><%=shetuan %></td><td><%=shifoushechang %></td><td width='80' align='center'><a href="sh.jsp?id=<%=id%>&yuan=<%=issh%>&tablename=sheyuanxinxi" onclick="return confirm('您确定要执行此操作？')"><%=issh%></a></td>
    <td width="138" align="center"><%=addtime %></td>
  </tr>
  	<%
  }
   %>
</table>

<br>
以上数据共<%=i %>条
  </body>
</html>

