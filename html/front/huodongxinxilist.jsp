<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>

<html>
<head>
<title>活动信息</title><script language="javascript" src="js/Calendar.js"></script>
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
		<td><%@ include file="./panel/qttop.jsp"%></td>
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
                        <td width="24%" align="center" valign="bottom"><span class="STYLE3">活动信息</span></td>
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
   搜索: 活动编号：<input name="huodongbianhao" type="text" id="huodongbianhao"  style='border:solid 1px #000000; color:#666666' size="12"  /> 活动名称：<input name="huodongmingcheng" type="text" id="huodongmingcheng"  style='border:solid 1px #000000; color:#666666' size="12"  /> 活动主题：<input name="huodongzhuti" type="text" id="huodongzhuti"  style='border:solid 1px #000000; color:#666666' size="12"  />  活动日期：<input name="huodongriqi1" type="text" id="huodongriqi1"  value='' onClick="getDate(form1.huodongriqi1,'2')" need="1" size="10" />-<input name="huodongriqi2" type="text" id="huodongriqi2"  value='' onClick="getDate(form1.huodongriqi2,'2')" need="1" size="10"  /> 社团：<input name="shetuan" type="text" id="shetuan"  style='border:solid 1px #000000; color:#666666' size="12"  />
   <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' />
                          </form>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>活动编号</td><td bgcolor='#CCFFFF'>活动名称</td><td bgcolor='#CCFFFF'>活动主题</td><td bgcolor='#CCFFFF'>主办单位</td><td bgcolor='#CCFFFF'>承办单位</td><td bgcolor='#CCFFFF' width='65' align='center'>活动日期</td><td bgcolor='#CCFFFF'>社团</td>
    <td width="30" align="center" bgcolor="CCFFFF">详细</td>
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
  sql="select top "+page_record+" * from huodongxinxi where id not in (select top "+((curpage-1)*page_record)+" id from huodongxinxi order by id desc) ";
  
if(request.getParameter("huodongbianhao")=="" ||request.getParameter("huodongbianhao")==null ){}else{sql=sql+" and huodongbianhao like '%"+new String(request.getParameter("huodongbianhao").getBytes("8859_1"))+"%'";}
if(request.getParameter("huodongmingcheng")=="" ||request.getParameter("huodongmingcheng")==null ){}else{sql=sql+" and huodongmingcheng like '%"+new String(request.getParameter("huodongmingcheng").getBytes("8859_1"))+"%'";}
if(request.getParameter("huodongzhuti")=="" ||request.getParameter("huodongzhuti")==null ){}else{sql=sql+" and huodongzhuti like '%"+new String(request.getParameter("huodongzhuti").getBytes("8859_1"))+"%'";}
if (request.getParameter("huodongriqi1")==""  ||request.getParameter("huodongriqi1")==null ) {}else{sql=sql+" and huodongriqi >= '"+new String(request.getParameter("huodongriqi1").getBytes("8859_1"))+"'";}
if (request.getParameter("huodongriqi2")==""  ||request.getParameter("huodongriqi2")==null ) {}else {sql=sql+" and huodongriqi <= '"+new String(request.getParameter("huodongriqi2").getBytes("8859_1"))+"'";}
if(request.getParameter("shetuan")=="" ||request.getParameter("shetuan")==null ){}else{sql=sql+" and shetuan like '%"+new String(request.getParameter("shetuan").getBytes("8859_1"))+"%'";}
  sql=sql+" order by id desc";
  RS_result=connDbBean.executeQuery(sql);
 String id="";
 String huodongbianhao="";String huodongmingcheng="";String huodongzhuti="";String fuzeren="";String zhubandanwei="";String chengbandanwei="";String huodongriqi="";String wupinjieyong="";String shetuan="";String beizhu="";
 String addtime="";
 int i=0;
 while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
huodongbianhao=RS_result.getString("huodongbianhao");huodongmingcheng=RS_result.getString("huodongmingcheng");huodongzhuti=RS_result.getString("huodongzhuti");fuzeren=RS_result.getString("fuzeren");zhubandanwei=RS_result.getString("zhubandanwei");chengbandanwei=RS_result.getString("chengbandanwei");huodongriqi=RS_result.getString("huodongriqi");wupinjieyong=RS_result.getString("wupinjieyong");shetuan=RS_result.getString("shetuan");beizhu=RS_result.getString("beizhu");
 addtime=RS_result.getString("addtime");
%>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=huodongbianhao %></td><td><%=huodongmingcheng %></td><td><%=huodongzhuti %></td><td><%=zhubandanwei %></td><td><%=chengbandanwei %></td><td><%=huodongriqi %></td><td><%=shetuan %></td>
    <td width="30" align="center"> <a href="huodongxinxidetail.jsp?id=<%=id%>" >详细</a></td>
  </tr>
  	<%
  }
   %>
</table>
<br>
以上数据共<%=i %>条,<a style="cursor:hand" onClick="javascript:window.print();">打印本页</a>
<p align="center">&nbsp;共<%=zgs%>条记录&nbsp;&nbsp;<%=page_record %>条/页　<a href="huodongxinxilist.jsp?page=1">首页</a>　<a href="huodongxinxilist.jsp?page=<%= curpage-1%>">上一页</a>　<A href="huodongxinxilist.jsp?page=<%= curpage+1%>">下一页</A>　<a href="huodongxinxilist.jsp?page=<%=zys %>">尾页</A>　当前第<FONT color=red><%=curpage %></FONT>页/共<FONT color=red><%=zys %></FONT>页</p>
						
                         
						 
						 
						 
						 
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
            <td valign="top"><%@ include file="./panel/qtleft.jsp"%></td>
          </tr>
        </table></td>
	</tr>
	<tr>
		<td><%@ include file="./panel/qtdown.jsp"%></td>
	</tr>
</table>
</body>
</html>
