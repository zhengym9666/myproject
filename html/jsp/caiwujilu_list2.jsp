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
    <title>财务记录</title><LINK href="css.css" type=text/css rel=stylesheet><script language="javascript" src="js/Calendar.js"></script>
  </head>
  <%
String sql;
ResultSet RS_result;
%>
  <body >
  <p>已有财务记录列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:&nbsp;  收支：
   <select name='shouzhi' id='shouzhi'>
     <option value="">所有</option>
     <option value="收入">收入</option>
     <option value="支出">支出</option>
   </select>
   &nbsp;&nbsp;经手人：
   <input name="jingshouren" type="text" id="jingshouren" style='border:solid 1px #000000; color:#666666' size="12" />&nbsp;&nbsp;项目名称：<input name="xiangmumingcheng" type="text" id="xiangmumingcheng" style='border:solid 1px #000000; color:#666666' size="12" />  日期：<input name="riqi1" type="text" id="riqi1"  value='' onClick="getDate(form1.riqi1,'2')" need="1" size="10" />-<input name="riqi2" type="text" id="riqi2"  value='' onClick="getDate(form1.riqi2,'2')" need="1" size="10"  />
     <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>社团名称</td><td bgcolor='#CCFFFF'>金额</td><td bgcolor='#CCFFFF'>收支</td><td bgcolor='#CCFFFF'>经手人</td><td bgcolor='#CCFFFF'>项目名称</td><td bgcolor='#CCFFFF'>日期</td><td bgcolor='#CCFFFF'>备注</td>
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
				String fysql="select count(id) as ss from caiwujilu where shetuanmingcheng='"+request.getSession().getAttribute("st")+"'";
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
  sql="select top "+page_record+" * from caiwujilu where shetuanmingcheng='"+request.getSession().getAttribute("st")+"' and id not in (select top "+((curpage-1)*page_record)+" id from caiwujilu where shetuanmingcheng='"+request.getSession().getAttribute("st")+"' order by id desc) ";
  
if(request.getParameter("shetuanmingcheng")=="" ||request.getParameter("shetuanmingcheng")==null ){}else{sql=sql+" and shetuanmingcheng like '%"+new String(request.getParameter("shetuanmingcheng").getBytes("8859_1"))+"%'";}
if(request.getParameter("shouzhi")=="" ||request.getParameter("shouzhi")==null ){}else{sql=sql+" and shouzhi like '%"+new String(request.getParameter("shouzhi").getBytes("8859_1"))+"%'";}
if(request.getParameter("jingshouren")=="" ||request.getParameter("jingshouren")==null ){}else{sql=sql+" and jingshouren like '%"+new String(request.getParameter("jingshouren").getBytes("8859_1"))+"%'";}
if(request.getParameter("xiangmumingcheng")=="" ||request.getParameter("xiangmumingcheng")==null ){}else{sql=sql+" and xiangmumingcheng like '%"+new String(request.getParameter("xiangmumingcheng").getBytes("8859_1"))+"%'";}
if (request.getParameter("riqi1")==""  ||request.getParameter("riqi1")==null ) {}else{sql=sql+" and riqi >= '"+new String(request.getParameter("riqi1").getBytes("8859_1"))+"'";}
if (request.getParameter("riqi2")==""  ||request.getParameter("riqi2")==null ) {}else {sql=sql+" and riqi <= '"+new String(request.getParameter("riqi2").getBytes("8859_1"))+"'";}
  sql=sql+" order by id desc";
  RS_result=connDbBean.executeQuery(sql);
 String id="";
 String shetuanmingcheng="";String jine="";String shouzhi="";String jingshouren="";String xiangmumingcheng="";String riqi="";String beizhu="";
 String addtime="";
 int i=0;
 
 
 
 
 
 while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
shetuanmingcheng=RS_result.getString("shetuanmingcheng");jine=RS_result.getString("jine");shouzhi=RS_result.getString("shouzhi");jingshouren=RS_result.getString("jingshouren");xiangmumingcheng=RS_result.getString("xiangmumingcheng");riqi=RS_result.getString("riqi");beizhu=RS_result.getString("beizhu");
 addtime=RS_result.getString("addtime");
 
 
%>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=shetuanmingcheng %></td><td><%=jine %></td><td><%=shouzhi %></td><td><%=jingshouren %></td><td><%=xiangmumingcheng %></td><td><%=riqi %></td><td><%=beizhu %></td>
    <td width="138" align="center"><%=addtime %></td>
    <td width="90" align="center"><a href="caiwujilu_updt.jsp?id=<%=id%>">修改</a>  <a href="del.jsp?id=<%=id %>&tablename=caiwujilu" onClick="return confirm('真的要删除？')">删除</a> <a href="caiwujilu_detail.jsp?id=<%=id%>">详细</a></td>
  </tr>
  	<%
  }
   %>
</table><br>
以上数据共<%=i %>条,<a style="cursor:hand" onClick="javascript:window.print();">打印本页</a>
<p align="center">&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record %>条/页　<a href="caiwujilu_list2.jsp?page=1">首页</a>　<a href="caiwujilu_list2.jsp?page=<%= curpage-1%>">上一页</a>　<A href="caiwujilu_list2.jsp?page=<%= curpage+1%>">下一页</A>　<a href="caiwujilu_list2.jsp?page=<%=zys %>">尾页</A>　当前第<FONT color=red><%=curpage %></FONT>页/共<FONT color=red><%=zys %></FONT>页</p>

  </body>
</html>

