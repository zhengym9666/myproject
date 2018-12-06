<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 if ( request.getSession().getAttribute("username")==null || request.getSession().getAttribute("username").equals(""))
 {
	out.print("<script>javascript:alert('对不起，请您先登陆！');location.href='index.jsp';</script>");
 }
  if ( request.getSession().getAttribute("cx")=="社员")
  {}
  else
 {
	out.print("<script>javascript:alert('对不起，您不是社员，无权评论！');location.href='index.jsp';</script>");
 }
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>

<html>
<head>
<title>精品社团管理系统</title>
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
                        <td width="24%" align="center" valign="bottom"><span class="STYLE3">活动评价</span></td>
                        <td width="64%" valign="bottom">&nbsp;</td>
                        <td width="12%" valign="bottom"></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td width="738" height="174"><table id="__01" width="738" height="174" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="13" background="qtimages/1_02_01_02_02_01.gif">&nbsp;</td>
                        <td width="714" height="772" valign="top"><table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
                          <form name="form1" id="form1" method="post" action="pinglun_add_post.jsp">
                            <tr style="display:none">
                              <td>编号：</td>
                              <td><input name='xinwenID' type='text' id='xinwenID' value='<%=id%>' readonly="readonly" />
                                &nbsp;*</td>
                            </tr>
                            <tr>
                              <td>评分：</td>
                              <td><select name="pingfen" id="pingfen">
                                  <option value="1">1</option>
                                  <option value="2">2</option>
                                  <option value="3">3</option>
                                  <option value="4">4</option>
                                  <option value="5">5</option>
                                </select>
                              </td>
                            </tr>
                            <tr>
                              <td>评论内容：</td>
                              <td><textarea name='pinglunneirong' cols='50' rows='5' id='pinglunneirong'></textarea>
                                &nbsp;*</td>
                            </tr>
                            <tr>
                              <td>评论人：</td>
                              <td><input name='pinglunren' type='text' id='pinglunren' value="<%=request.getSession().getAttribute("username")%>" />
                                &nbsp;*</td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td><input type="submit" name="Submit5" value="提交" onClick="return check();" />
                                  <input type="reset" name="Submit22" value="重置" /></td>
                            </tr>
                          </form>
                        </table></td>
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