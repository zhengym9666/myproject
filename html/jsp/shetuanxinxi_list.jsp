<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>社团信息</title><LINK href="css.css" type=text/css rel=stylesheet><script language="javascript" src="js/Calendar.js"></script>
  </head>
  <%
String sql;
ResultSet RS_result;
%>
  <body >
  <p>已有社团信息列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:&nbsp;&nbsp;社团名称：<input name="shetuanmingcheng" type="text" id="shetuanmingcheng" style='border:solid 1px #000000; color:#666666' size="12" />&nbsp;&nbsp;负责人：<input name="fuzeren" type="text" id="fuzeren" style='border:solid 1px #000000; color:#666666' size="12" />  创办日期：<input name="chuangbanriqi1" type="text" id="chuangbanriqi1"  value='' onclick="getDate(form1.chuangbanriqi1,'2')" need="1" size="10" />-<input name="chuangbanriqi2" type="text" id="chuangbanriqi2"  value='' onclick="getDate(form1.chuangbanriqi2,'2')" need="1" size="10"  />&nbsp;&nbsp;挂靠单位：<input name="guakaodanwei" type="text" id="guakaodanwei" style='border:solid 1px #000000; color:#666666' size="12" />
   <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="导出EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='shetuanxinxi_listxls.jsp';" />
</form>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>社团名称</td><td bgcolor='#CCFFFF'>性质</td><td bgcolor='#CCFFFF'>创始人</td><td bgcolor='#CCFFFF'>负责人</td><td bgcolor='#CCFFFF' width='65' align='center'>创办日期</td><td bgcolor='#CCFFFF'>挂靠单位</td><td bgcolor='#CCFFFF'>人数</td>
    <td width="138" align="center" bgcolor="CCFFFF">添加时间</td>
    
    <td width="60" align="center" bgcolor="CCFFFF">操作</td>
  </tr>
  <%
   int curpage=1;//当前页
				int page_record=10;//每页显示的记录数
				int zgs=0;
				int zys=0;
				//用下面的方法（sql查询完成，速度快）
				String hsgnpage=request.getParameter("page");
				String fysql="select count(id) as ss from shetuanxinxi";
				ResultSet RS_resultfy=connDbBean.executeQuery(fysql);
  while(RS_resultfy.next()){
  zgs=Integer.parseInt(RS_resultfy.getString("ss"));
  zys=zgs/page_record+1;
  }
				if (hsgnpage!=null)
				{
				curpage=Integer.parseInt(request.getParameter("page"));//获取传递的值，需要显示的页
				}
				else
				{
				curpage=1;
				}
				if (curpage==0)
				{
					curpage=1;
				}
				if(curpage>zys)
				{
					curpage=zys;
				}
   sql="";
  
if ((curpage-1)*page_record==0 )
{
  sql="select top 10 * from shetuanxinxi where 1=1";
}
else
{
  sql="select top "+page_record+" * from shetuanxinxi where id not in (select top "+((curpage-1)*page_record)+" id from shetuanxinxi order by id desc) ";
}

  if(request.getParameter("shetuanmingcheng")=="" ||request.getParameter("shetuanmingcheng")==null ){}else{sql=sql+" and shetuanmingcheng like '%"+new String(request.getParameter("shetuanmingcheng").getBytes("8859_1"))+"%'";}if(request.getParameter("fuzeren")=="" ||request.getParameter("fuzeren")==null ){}else{sql=sql+" and fuzeren like '%"+new String(request.getParameter("fuzeren").getBytes("8859_1"))+"%'";}if (request.getParameter("chuangbanriqi1")==""  ||request.getParameter("chuangbanriqi1")==null ) {}else{sql=sql+" and chuangbanriqi >= '"+new String(request.getParameter("chuangbanriqi1").getBytes("8859_1"))+"'";}if (request.getParameter("chuangbanriqi2")==""  ||request.getParameter("chuangbanriqi2")==null ) {}else {sql=sql+" and chuangbanriqi <= '"+new String(request.getParameter("chuangbanriqi2").getBytes("8859_1"))+"'";}if(request.getParameter("guakaodanwei")=="" ||request.getParameter("guakaodanwei")==null ){}else{sql=sql+" and guakaodanwei like '%"+new String(request.getParameter("guakaodanwei").getBytes("8859_1"))+"%'";}
  sql=sql+" order by id desc";
  RS_result=connDbBean.executeQuery(sql);
 String id="";
 String shetuanmingcheng="";String jianjie="";String xingzhi="";String chuangshiren="";String fuzeren="";String chuangbanriqi="";String guakaodanwei="";String renshu="";
 String addtime="";
 int i=0;
 double renshuz=0;
 while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
shetuanmingcheng=RS_result.getString("shetuanmingcheng");jianjie=RS_result.getString("jianjie");xingzhi=RS_result.getString("xingzhi");chuangshiren=RS_result.getString("chuangshiren");fuzeren=RS_result.getString("fuzeren");chuangbanriqi=RS_result.getString("chuangbanriqi");guakaodanwei=RS_result.getString("guakaodanwei");renshu=RS_result.getString("renshu");
 addtime=RS_result.getString("addtime");
 renshuz=renshuz+Float.valueOf(renshu).floatValue();
%>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=shetuanmingcheng %></td><td><%=xingzhi %></td><td><%=chuangshiren %></td><td><%=fuzeren %></td><td><%=chuangbanriqi %></td><td><%=guakaodanwei %></td><td><%=renshu %></td>
    <td width="138" align="center"><%=addtime %></td>
    <td width="90" align="center"><a href="shetuanxinxi_updt.jsp?id=<%=id%>">修改</a>  <a href="del.jsp?id=<%=id %>&tablename=shetuanxinxi" onclick="return confirm('真的要删除？')">删除</a> <a href="shetuanxinxidetail.jsp?id=<%=id%>" target="_blank">详细</a></td>
  </tr>
  	<%
  }
   %>
</table>
<p>数据统计：共计人数:<%=renshuz%>；</p>
<br>
以上数据共<%=i %>条,<a style="cursor:hand" onclick="javascript:window.print();">打印本页</a>
<p align="center">&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record %>条/页　<a href="shetuanxinxi_list.jsp?page=1">首页</a>　<a href="shetuanxinxi_list.jsp?page=<%= curpage-1%>">上一页</a>　<A href="shetuanxinxi_list.jsp?page=<%= curpage+1%>">下一页</A>　<a href="shetuanxinxi_list.jsp?page=<%=zys %>">尾页</A>　当前第<FONT color=red><%=curpage %></FONT>页/共<FONT color=red><%=zys %></FONT>页</p>
  </body>
</html>
