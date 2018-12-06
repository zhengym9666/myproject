<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>

<html>
<head>
<title>财务记录</title><script language="javascript" src="js/Calendar.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><LINK href="qtimages/style.css" type=text/css rel=stylesheet>
<style type="text/css">
<!--
.STYLE1 {
	color: #FFFFFF;
	font-weight: bold;
}
.STYLE3 {color: #086BD6; font-weight: bold; }
.STYLE8 {color: #185838;
	font-weight: bold;
}
-->
</style>
</head>
  <%
String sql;
ResultSet RS_result;
%>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="1002" height="1176" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
	<tr>
		<td><%@ include file="qttop.jsp"%></td>
	</tr>
	<tr>
		<td><table id="__01" width="1002" height="830" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td rowspan="2" valign="top"><table id="__01" width="738" height="830" border="0" cellpadding="0" cellspacing="0">
              
              <tr>
                <td valign="top"><table id="__01" width="738" height="225" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="738" height="41" background="qtimages/1_02_01_02_01.gif"><table width="100%" height="18" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="24%" align="center" valign="bottom"><span class="STYLE3">财务记录</span></td>
                        <td width="64%" valign="bottom">&nbsp;</td>
                        <td width="12%" valign="bottom"></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td width="738" height="174"><table id="__01" width="738" height="174" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="13" background="qtimages/1_02_01_02_02_01.gif">&nbsp;</td>
                        <td width="714" height="772" valign="top">
						
						
						
						
						
                          <form name="form1" id="form1" method="post" action="">
   社团
     <input name="shetuanmingcheng" type="text" id="shetuanmingcheng"  style='border:solid 1px #000000; color:#666666' size="12"  />
收支
<select name='shouzhi' id='shouzhi'><option value="">所有</option></select>
经手人
<input name="jingshouren" type="text" id="jingshouren"  style='border:solid 1px #000000; color:#666666' size="8"  />
项目
<input name="xiangmumingcheng" type="text" id="xiangmumingcheng"  style='border:solid 1px #000000; color:#666666' size="12"  />
日期
<input name="riqi1" type="text" id="riqi1"  value='' onClick="getDate(form1.riqi1,'2')" need="1" size="10" />-<input name="riqi2" type="text" id="riqi2"  value='' onClick="getDate(form1.riqi2,'2')" need="1" size="10"  />
   <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' />
                          </form>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>社团名称</td><td bgcolor='#CCFFFF'>金额</td><td bgcolor='#CCFFFF'>收支</td><td bgcolor='#CCFFFF'>经手人</td><td bgcolor='#CCFFFF'>项目名称</td><td bgcolor='#CCFFFF' width='65' align='center'>日期</td>
    </tr>
  <%
   int curpage=1;//当前页
				int page_record=10;//每页显示的记录数
				int zgs=0;
				int zys=0;
				//用下面的方法（sql查询完成，速度快）
				String hsgnpage=request.getParameter("page");
				String fysql="select count(id) as ss from caiwujilu";
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
  sql="select top "+page_record+" * from caiwujilu where id not in (select top "+((curpage-1)*page_record)+" id from caiwujilu order by id desc) ";
  
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
    <td><%=shetuanmingcheng %></td><td><%=jine %></td><td><%=shouzhi %></td><td><%=jingshouren %></td><td><%=xiangmumingcheng %></td><td><%=riqi %></td>
    </tr>
  	<%
  }
   %>
</table>
<br>
以上数据共<%=i %>条,<a style="cursor:hand" onClick="javascript:window.print();">打印本页</a>
<p align="center">&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record %>条/页　<a href="caiwujilulist.jsp?page=1">首页</a>　<a href="caiwujilulist.jsp?page=<%= curpage-1%>">上一页</a>　<A href="caiwujilulist.jsp?page=<%= curpage+1%>">下一页</A>　<a href="caiwujilulist.jsp?page=<%=zys %>">尾页</A>　当前第<FONT color=red><%=curpage %></FONT>页/共<FONT color=red><%=zys %></FONT>页</p>
						
                         
						 
						 
						 
						 
						 </td>
                        <td width="11" background="qtimages/1_02_01_02_02_03.gif">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><img src="qtimages/1_02_01_02_03.gif" width="738" height="10" alt=""></td>
                  </tr>
                </table></td>
              </tr>
              
            </table></td>
            <td><img src="qtimages/1_02_02.gif" width="264" height="8" alt=""></td>
          </tr>
          <tr>
            <td valign="top"><%@ include file="qtleft.jsp"%></td>
          </tr>
        </table></td>
	</tr>
	<tr>
		<td><%@ include file="qtdown.jsp"%></td>
	</tr>
</table>
</body>
</html>
