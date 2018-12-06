
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
    
    <title>精品社团管理系统</title><script src="js/menu.js"></script><link rel="stylesheet" href="CSS.css" type="text/css">

<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
body,td,th {
	font-size: 12px;
}
-->
</style>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>

  <body >
<table width="171" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0"  style="table-layout:fixed;">
      <tr>
        <td style="width:3px; background:#0a5c8e;">&nbsp;</td>
        <td><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed;">
          <tr>
            <td height="5" style="line-height:5px; background:#0a5c8e;">&nbsp;</td>
          </tr>
          <tr>
            <td height="23" background="images/main_29.gif" onClick="show(1)" style="cursor:hand"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="40%">&nbsp;</td>
                <td width="49%"><font style="height:1;font-size:9pt; color:#bfdbeb;filter:glow(color=#1070a3,strength=1)">个人资料管理</font></td>
                <td width="11%">&nbsp;</td>
              </tr>
            </table></td>
          </tr>
          <tr  id="show1">
            <td valign="top" bgcolor="#e5f4fd"><table width="145" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="22" height="35"><div align="center"><img src="images/edt.gif" width="16" height="16" ></div></td>
                      <td width="108" height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'">&nbsp;<a href="sheyuanxinxi_updt2.jsp" target="hsgmain">个人资料管理</a></td>
                          </tr>
                      </table></td>
                    </tr>
					
                </table></td>
              </tr>
            </table></td>
          </tr>
		  
		  
		  <tr>
            <td height="23" background="images/main_29.gif" onClick="show(2)" style="cursor:hand"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="40%">&nbsp;</td>
                <td width="47%"><font style="height:1;font-size:9pt; color:#bfdbeb;filter:glow(color=#1070a3,strength=1)">所在社团查看</font></td>
                <td width="13%">&nbsp;</td>
              </tr>
            </table></td>
          </tr>
          <tr  id="show2" style="display:none">
            <td valign="top" bgcolor="#e5f4fd"><table width="145" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
                     <tr>
                      <td width="22" height="35"><div align="center"><img src="images/edt.gif" width="16" height="16" ></div></td>
                      <td width="108" height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'">&nbsp;<a href="sheyuanxinxi_updtlb2.jsp" target="hsgmain">所在社团查看</a></td>
                          </tr>
                      </table></td>
                    </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
		  
		  <tr>
            <td height="23" background="images/main_29.gif" onClick="show(3)" style="cursor:hand"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="40%">&nbsp;</td>
                <td width="47%"><font style="height:1;font-size:9pt; color:#bfdbeb;filter:glow(color=#1070a3,strength=1)">社长申请</font></td>
                <td width="13%">&nbsp;</td>
              </tr>
            </table></td>
          </tr>
          <tr  id="show3" style="display:none">
            <td valign="top" bgcolor="#e5f4fd"><table width="145" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
                     <tr>
                      <td width="22" height="35"><div align="center"><img src="images/edt.gif" width="16" height="16" ></div></td>
                      <td width="108" height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'">&nbsp;<a href="shechangshenqing_add.jsp" target="hsgmain">社长申请</a></td>
                          </tr>
                      </table></td>
                    </tr>
					<tr>
                      <td width="22" height="35"><div align="center"><img src="images/edt.gif" width="16" height="16" ></div></td>
                      <td width="108" height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'">&nbsp;<a href="shechangshenqing_list2.jsp" target="hsgmain">申请结果查看</a></td>
                          </tr>
                      </table></td>
                    </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
		  
		  <tr>
            <td height="23" background="images/main_29.gif" onClick="show(12)" style="cursor:hand"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="40%">&nbsp;</td>
                <td width="47%"><font style="height:1;font-size:9pt; color:#bfdbeb;filter:glow(color=#1070a3,strength=1)">活动信息管理</font></td>
                <td width="13%">&nbsp;</td>
              </tr>
            </table></td>
          </tr>
          <tr  id="show12" style="display:none">
            <td valign="top" bgcolor="#e5f4fd"><table width="145" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
                     <tr>
                      <td width="22" height="35"><div align="center"><img src="images/edt.gif" width="16" height="16" ></div></td>
                      <td width="108" height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'">&nbsp;<a href="jiaruhuodong_list2.jsp" target="hsgmain">活动加入查看</a></td>
                          </tr>
                      </table></td>
                    </tr>
					
                </table></td>
              </tr>
            </table></td>
          </tr>
		  
		<!--   <tr>
            <td height="23" background="images/main_29.gif" onClick="show(13)" style="cursor:hand"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="40%">&nbsp;</td>
                <td width="47%"><font style="height:1;font-size:9pt; color:#bfdbeb;filter:glow(color=#1070a3,strength=1)">系统管理</font></td>
                <td width="13%">&nbsp;</td>
              </tr>
            </table></td>
          </tr>
          <tr  id="show13" style="display:none">
            <td valign="top" bgcolor="#e5f4fd"><table width="145" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
                     <tr>
                      <td width="22" height="35"><div align="center"><img src="images/edt.gif" width="16" height="16" ></div></td>
                      <td width="108" height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'">&nbsp;<a href="databack.jsp" target="hsgmain">数据备份</a></td>
                          </tr>
                      </table></td>
                    </tr>
					<tr>
                      <td width="22" height="35"><div align="center"><img src="images/edt.gif" width="16" height="16" ></div></td>
                      <td width="108" height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'">&nbsp;<a href="youqinglianjie_add.jsp" target="hsgmain">友情连接添加</a></td>
                          </tr>
                      </table></td>
                    </tr>
					<tr>
                      <td width="22" height="35"><div align="center"><img src="images/edt.gif" width="16" height="16" ></div></td>
                      <td width="108" height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'">&nbsp;<a href="youqinglianjie_list.jsp" target="hsgmain">友情连接查询</a></td>
                          </tr>
                      </table></td>
                    </tr>
					<tr>
                      <td width="22" height="35"><div align="center"><img src="images/edt.gif" width="16" height="16" ></div></td>
                      <td width="108" height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'">&nbsp;<a href="dx.jsp?lb=系统简介" target="hsgmain">系统简介</a></td>
                          </tr>
                      </table></td>
                    </tr>
					<tr>
                      <td width="22" height="35"><div align="center"><img src="images/edt.gif" width="16" height="16" ></div></td>
                      <td width="108" height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="23" style="cursor:hand" onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'">&nbsp;<a href="dx.jsp?lb=系统公告" target="hsgmain">系统公告</a></td>
                          </tr>
                      </table></td>
                    </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>-->
		  
		  
		  
          <tr>
            <td height="23" background="images/main_45.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="18%">&nbsp;</td>
                <td width="64%"><div align="center"><font style="height:1;font-size:9pt; color:#bfdbeb;filter:glow(color=#1070a3,strength=1)">版本<%
	  java.util.Date date = new java.util.Date();
java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd", java.util.Locale.CHINA);

String result = format.format(date);
out.print(result.substring(0,4));
	  %>  V1.0 </font></div></td>
                <td width="18%">&nbsp;</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="9" style="line-height:9px; background:#0a5c8e;">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>

