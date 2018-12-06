<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>

<html>
<head>
<title>活动信息</title>
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
  String id=request.getParameter("id");
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
                        <td width="24%" align="center" valign="bottom"><span class="STYLE3">活动信息详细</span></td>
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
						
						
						
						
						
                         	<%
  String sql="select * from huodongxinxi where id="+id;
  String huodongbianhao="";String huodongmingcheng="";String huodongzhuti="";String fuzeren="";String zhubandanwei="";String chengbandanwei="";String huodongriqi="";String wupinjieyong="";String shetuan="";String beizhu="";
  ResultSet RS_result=connDbBean.executeQuery(sql);
  while(RS_result.next()){
  huodongbianhao=RS_result.getString("huodongbianhao");huodongmingcheng=RS_result.getString("huodongmingcheng");huodongzhuti=RS_result.getString("huodongzhuti");fuzeren=RS_result.getString("fuzeren");zhubandanwei=RS_result.getString("zhubandanwei");chengbandanwei=RS_result.getString("chengbandanwei");huodongriqi=RS_result.getString("huodongriqi");wupinjieyong=RS_result.getString("wupinjieyong");shetuan=RS_result.getString("shetuan");beizhu=RS_result.getString("beizhu");
  }
   %>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>活动编号：</td><td width='39%'><%=huodongbianhao%></td><td width='11%'>活动名称：</td><td width='39%'><%=huodongmingcheng%></td></tr><tr><td width='11%'>活动主题：</td><td width='39%'><%=huodongzhuti%></td><td width='11%'>负责人：</td><td width='39%'><%=fuzeren%></td></tr><tr><td width='11%'>主办单位：</td><td width='39%'><%=zhubandanwei%></td><td width='11%'>承办单位：</td><td width='39%'><%=chengbandanwei%></td></tr><tr><td width='11%'>活动日期：</td><td width='39%'><%=huodongriqi%></td><td width='11%'>物品借用：</td><td width='39%'><%=wupinjieyong%></td></tr><tr><td width='11%'>社团：</td><td width='39%'><%=shetuan%></td><td width='11%'>备注：</td><td width='39%'><%=beizhu%></td></tr>
     <tr>
       <td colspan=4 align=center><table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">
         <tr>
           <td width="30" align="center" bgcolor="CCFFFF">序号</td>
           <td width="471" bgcolor='#CCFFFF'>评论内容</td>
           <td width="88" bgcolor='#CCFFFF'>评分</td>
           <td width="88" bgcolor='#CCFFFF'>评论人</td>
           <td width="138" align="center" bgcolor="CCFFFF">评论时间</td>
         </tr>
         <%
  sql="select * from pinglun where xinwenID='"+id+"'";
  sql=sql+" order by id desc";
  RS_result=connDbBean.executeQuery(sql);
 String xinwenID="";String pinglunneirong="";String pinglunren="";
 String addtime="";
 String pingfen="";
 
 int i=0;
 
 double zf=0;
 while(RS_result.next()){
 i=i+1;
xinwenID=RS_result.getString("xinwenID");pinglunneirong=RS_result.getString("pinglunneirong");pinglunren=RS_result.getString("pinglunren");
 addtime=RS_result.getString("addtime");
 pingfen=RS_result.getString("pingfen");
 zf=zf+Float.valueOf(pingfen).floatValue();
%>
         
         <tr>
           <td width="30" align="center"><%=i %></td>
           <td><%=pinglunneirong %></td>
           <td><%=pingfen%></td>
           <td><%=pinglunren %></td>
           <td width="138" align="center"><%=addtime %></td>
         </tr>
         <%
  }
   %>
   <tr>
           <td colspan="5" align="center">以上评价共<%=i%>条，共计平均分：<%=zf/i%></td>
           </tr>
       </table></td>
     </tr>
     <tr><td colspan=4 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" style='border:solid 1px #000000; color:#666666' />
         <input type=button name=Submit52 value=打印 onClick='javascript:window.print()' style='border:solid 1px #000000; color:#666666' />
         <input type=button name=Submit522 value=评价 onClick="javascript:location.href='pinglunadd.jsp?id=<%=id%>';" style='border:solid 1px #000000; color:#666666' />
          <input type=button name=Submit5222 value=加入 onClick="javascript:location.href='jiaruhuodongadd.jsp?id=<%=id%>';" style='border:solid 1px #000000; color:#666666' /></td></tr>
  </table>
                         
						 
						 
						 
						 
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
