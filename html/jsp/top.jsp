
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
    
    <title>学生社团管理系统</title><script language="javascript" src="images/qkjs.js"></script>
   <style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {
	color: #43860c;
	font-size: 12px;
}
-->
</style>


  </head>

  <script type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="57" background="images/main_02.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="78" height="57" background="images/main_01.gif">&nbsp;</td>
        <td width="393"><table width="100%" height="51" border="0" align="left">
          <tr>
            <td><div style="font-family:宋体; color:#FFFFFF; filter:Glow(Color=#000000,Strength=2); WIDTH: 100%; FONT-WEIGHT: bold; FONT-SIZE: 19pt; margin-top:5pt">
                <div align="center" class="STYLE5">学生社团管理系统</div>
            </div></td>
          </tr>
        </table></td>
        <td width="812"><table width="743" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="28" background="images/main_03.gif">&nbsp;</td>
          </tr>
          <tr>
            <td height="29"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="145" height="29">&nbsp;</td>
                  <td width="60" background="images/main_06.gif"></td>
                  <td width="293" background="images/main_09.gif">&nbsp;</td>
                  <td width="39"><a href="logout.jsp" target="_parent"><img src="images/main_14.gif" name="Image7" width="39" height="29" border="0" id="Image7" onMouseOver="MM_swapImage('Image7','','images/main_14_1.gif',1)" onMouseOut="MM_swapImgRestore()" /></a></td>
                  <td width="44"><img src="images/main_15.gif" width="36" height="29" /></td>
                  <td width="43"><a href="#"></a></td>
                  <td width="44"><a href="#"></a></td>
                  <td width="39"><a href="#"></a></td>
                  <td width="36">&nbsp;</td>
                </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="54" background="images/main_05.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="26" background="images/main_18.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="175" height="26" background="images/main_16.gif">&nbsp;</td>
        <td width="924"><span class="STYLE1">当前时间：<SCRIPT language=javascript>setCalendar();</SCRIPT></span>  </td>
        <td width="312"><img src="images/user.gif" width="10" height="10" /> <span class="STYLE1">欢迎您:<%=request.getSession().getAttribute("username")%>  角色:<%=request.getSession().getAttribute("cx")%></span></td>
      </tr>
    </table></td>
  </tr>
</table>

</html>

