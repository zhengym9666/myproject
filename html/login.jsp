<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<html>
<head>
    
<title>精品社团管理系统</title>
<style type="text/css">
<!--
*{overflow:hidden; font-size:9pt;}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-repeat: repeat-x;
	background-color: #033E66;
}
.STYLE6 {color: #FFFFFF}
.STYLE5 {color: #CCFFCC;
	font-size: 26pt;
}
.STYLE7 {color: #FFFFFF}
-->
</style>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
<script language="javascript">
function check()
{
	if(document.form1.username.value=="" || document.form1.pwd.value=="" || document.form1.rand.value=="")
	{
		alert('请输入完整');
		return false;
	}
}
function loadimage(){ 
document.getElementById("randImage").src = "image.jsp?"+Math.random(); 
} 
</script>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<p>&nbsp;</p>
<table width="64%" height="56" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="56"><div style="font-family:宋体; color:#FFFFFF; filter:Glow(Color=#000000,Strength=2); WIDTH: 100%; FONT-WEIGHT: bold; FONT-SIZE: 19pt; margin-top:5pt">
      <div align="center" class="STYLE5">精品社团管理系统</div>
    </div></td>
  </tr>
</table>
<table width="907" height="433" border="0" align="center" cellpadding="0" cellspacing="0" background="images/hsgbg2.jpg" id="__01">
  <tr>
    <td height="134" colspan="3">&nbsp;</td>
  </tr>
  <tr>
    <td width="317" rowspan="2">&nbsp;</td>
    <td width="252" height="152"><table width="195" border="0" align="right" cellpadding="0" cellspacing="0">
      <form name="form1" method="post" action="adminyanzheng.jsp">
        <tr>
          <td width="44" height="30"><span class="STYLE7">用户:</span></td>
          <td width="142" height="30"><input name="username" type="text" id="username" style="width:100px; height:16px; border:solid 1px #000000; color:#666666"></td>
        </tr>
        <tr>
          <td height="30"><span class="STYLE7">密码:</span></td>
          <td height="30"><input name="pwd" type="password" id="pwd" style="width:100px; height:16px; border:solid 1px #000000; color:#666666"></td>
        </tr>
        <tr style="display:none">
          <td height="30"><span class="STYLE7">权限:</span></td>
          <td height="30"><select name="cx" id="cx">
            <option value="管理员">管理员</option>
          </select>
                <input name="login" type="hidden" id="login" value="1"></td>
        </tr>
		 <tr>
          <td height="30"><span class="STYLE7">验证码:</span></td>
          <td height="30"><input type="text" name="rand" id="rand" size="5">
              <a href="javascript:loadimage();"><img alt="看不清请点我！" name="randImage" id="randImage" src="image.jsp" width="60" height="20" border="1" align="absmiddle"></a></tr>
        <tr>
          <td height="30" colspan="2"><input type="submit" name="Submit" value="登陆" onClick="return check();">
                <input type="reset" name="Submit2" value="重置"></td>
        </tr>
      </form>
    </table></td>
    <td width="338" rowspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>

