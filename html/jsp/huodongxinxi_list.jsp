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
    <title>活动信息</title><LINK href="css.css" type=text/css rel=stylesheet><script language="javascript" src="js/Calendar.js"></script>
  </head>
  <%
String sql;
ResultSet RS_result;
%>
  <body >
  <p>已有活动信息列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:&nbsp;&nbsp;活动编号：<input name="huodongbianhao" type="text" id="huodongbianhao" style='border:solid 1px #000000; color:#666666' size="12" />&nbsp;&nbsp;活动名称：<input name="huodongmingcheng" type="text" id="huodongmingcheng" style='border:solid 1px #000000; color:#666666' size="12" />&nbsp;&nbsp;活动主题：<input name="huodongzhuti" type="text" id="huodongzhuti" style='border:solid 1px #000000; color:#666666' size="12" />  活动日期：<input name="huodongriqi1" type="text" id="huodongriqi1"  value='' onclick="getDate(form1.huodongriqi1,'2')" need="1" size="10" />-<input name="huodongriqi2" type="text" id="huodongriqi2"  value='' onclick="getDate(form1.huodongriqi2,'2')" need="1" size="10"  />&nbsp;&nbsp;社团：<input name="shetuan" type="text" id="shetuan" style='border:solid 1px #000000; color:#666666' size="12" />
   <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="导出EXCEL" style='border:solid 1px #000000; color:#666666' onClick="javascript:location.href='huodongxinxi_listxls.jsp';" />
</form>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>活动编号</td><td bgcolor='#CCFFFF'>活动名称</td><td bgcolor='#CCFFFF'>活动主题</td><td bgcolor='#CCFFFF'>负责人</td><td bgcolor='#CCFFFF'>主办单位</td><td bgcolor='#CCFFFF'>承办单位</td><td bgcolor='#CCFFFF' width='65' align='center'>活动日期</td><td bgcolor='#CCFFFF'>物品借用</td><td bgcolor='#CCFFFF'>社团</td>
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
				String fysql="select count(id) as ss from huodongxinxi";
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
  sql="select top 10 * from huodongxinxi where 1=1";
}
else
{
  sql="select top "+page_record+" * from huodongxinxi where id not in (select top "+((curpage-1)*page_record)+" id from huodongxinxi order by id desc) ";
}

  if(request.getParameter("huodongbianhao")=="" ||request.getParameter("huodongbianhao")==null ){}else{sql=sql+" and huodongbianhao like '%"+new String(request.getParameter("huodongbianhao").getBytes("8859_1"))+"%'";}if(request.getParameter("huodongmingcheng")=="" ||request.getParameter("huodongmingcheng")==null ){}else{sql=sql+" and huodongmingcheng like '%"+new String(request.getParameter("huodongmingcheng").getBytes("8859_1"))+"%'";}if(request.getParameter("huodongzhuti")=="" ||request.getParameter("huodongzhuti")==null ){}else{sql=sql+" and huodongzhuti like '%"+new String(request.getParameter("huodongzhuti").getBytes("8859_1"))+"%'";}if (request.getParameter("huodongriqi1")==""  ||request.getParameter("huodongriqi1")==null ) {}else{sql=sql+" and huodongriqi >= '"+new String(request.getParameter("huodongriqi1").getBytes("8859_1"))+"'";}if (request.getParameter("huodongriqi2")==""  ||request.getParameter("huodongriqi2")==null ) {}else {sql=sql+" and huodongriqi <= '"+new String(request.getParameter("huodongriqi2").getBytes("8859_1"))+"'";}if(request.getParameter("shetuan")=="" ||request.getParameter("shetuan")==null ){}else{sql=sql+" and shetuan like '%"+new String(request.getParameter("shetuan").getBytes("8859_1"))+"%'";}
  sql=sql+" order by id desc";
  RS_result=connDbBean.executeQuery(sql);
 String id="";
 String huodongbianhao="";String huodongmingcheng="";String huodongzhuti="";String fuzeren="";String zhubandanwei="";String chengbandanwei="";String huodongriqi="";String wupinjieyong="";String shetuan="";String beizhu="";
 String addtime="";
 int i=0;
 //difengysfiqfgieuheze
 while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
huodongbianhao=RS_result.getString("huodongbianhao");huodongmingcheng=RS_result.getString("huodongmingcheng");huodongzhuti=RS_result.getString("huodongzhuti");fuzeren=RS_result.getString("fuzeren");zhubandanwei=RS_result.getString("zhubandanwei");chengbandanwei=RS_result.getString("chengbandanwei");huodongriqi=RS_result.getString("huodongriqi");wupinjieyong=RS_result.getString("wupinjieyong");shetuan=RS_result.getString("shetuan");beizhu=RS_result.getString("beizhu");
 addtime=RS_result.getString("addtime");
 //zoxngxetxoxngjxvi
%>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=huodongbianhao %></td><td><%=huodongmingcheng %></td><td><%=huodongzhuti %></td><td><%=fuzeren %></td><td><%=zhubandanwei %></td><td><%=chengbandanwei %></td><td><%=huodongriqi %></td><td><%=wupinjieyong %></td><td><%=shetuan %></td>
    <td width="138" align="center"><%=addtime %></td>
    <td width="90" align="center"><a href="huodongxinxi_updt.jsp?id=<%=id%>">修改</a>  <a href="del.jsp?id=<%=id %>&tablename=huodongxinxi" onclick="return confirm('真的要删除？')">删除</a> <a href="huodongxinxidetail.jsp?id=<%=id%>" target="_blank">详细</a></td>
  </tr>
  	<%
  }
   %>
</table>
<%//yougongzitongji%>
<br>
以上数据共<%=i %>条,<a style="cursor:hand" onclick="javascript:window.print();">打印本页</a>
<p align="center">&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record %>条/页　<a href="huodongxinxi_list.jsp?page=1">首页</a>　<a href="huodongxinxi_list.jsp?page=<%= curpage-1%>">上一页</a>　<A href="huodongxinxi_list.jsp?page=<%= curpage+1%>">下一页</A>　<a href="huodongxinxi_list.jsp?page=<%=zys %>">尾页</A>　当前第<FONT color=red><%=curpage %></FONT>页/共<FONT color=red><%=zys %></FONT>页</p>
  </body>
</html>
