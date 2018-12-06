<%@ page language="java"  pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户登录</title>
    <link href="images/skin.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {font-size: 12px}
.STYLE3 {font-size: 12px; font-weight: bold; }
.STYLE4 {
	color: #03515d;
	font-size: 12px;
}
-->
</style>

  </head>

  <body >
 <table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
  <tr>
    <td height="30" background="images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">欢迎登陆：精品社团管理系统 后台管理系统 </span></td>
              </tr>
            </table></td>
            <td width="54%">&nbsp;</td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="100%" valign="top"><table height="100%" width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="images/tab_12.gif">&nbsp;</td>
        <td><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td colspan="2" valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2" valign="top"><span class="left_bt">感谢您使用 精品社团管理系统 网站管理系统程序</span><br />
                <br />
                <span class="left_txt">&nbsp;<img src="images/ts.gif" width="16" height="16" /> 提示：客套话语，您请自便！<br />
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="left_txt"><br />
                    <br />
                  </span></td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2" valign="top"><!--JavaScript部分-->
                <table width="100%" border="0" cellpadding="0" cellspacing="0" id="secTable">
                  <tbody>
                    <tr align="middle" height="20">
                      <td align="center" class="sec1" >系统说明</td>
                    </tr>
                  </tbody>
                </table>
              <table class="main_tab" id="mainTable" cellspacing="0"
cellpadding="0" width="100%" border="0">
                  <!--关于TBODY标记-->
                  <tbody style="DISPLAY: block">
                    <tr>
                      <td valign="top" align="middle"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tbody>
                            <tr>
                              <td colspan="3"></td>
                            </tr>
                            <tr>
                              <td height="5" colspan="3"></td>
                            </tr>
                            <tr>
                              <td width="4%" background="images/news-title-bg.gif"></td>
                              <td width="91%" align="left" background="images/news-title-bg.gif" class="left_ts">程序说明：</td>
                              <td width="5%" background="images/news-title-bg.gif" class="left_txt">&nbsp;</td>
                            </tr>
                            <tr>
                              <td bgcolor="#FAFBFC">&nbsp;</td>
                              <td align="left" bgcolor="#FAFBFC" class="left_txt"><span class="left_ts">1、</span>系统作者：xxxxxxxxxxxxxx</td>
                              <td bgcolor="#FAFBFC" class="left_txt">&nbsp;</td>
                            </tr>
                            <tr>
                              <td bgcolor="#FAFBFC">&nbsp;</td>
                              <td align="left" bgcolor="#FAFBFC" class="left_txt"><span class="left_ts">2、技术支持</span></td>
                              <td bgcolor="#FAFBFC" class="left_txt">&nbsp;</td>
                            </tr>
                            <tr>
                              <td bgcolor="#FAFBFC">&nbsp;</td>
                              <td align="left" bgcolor="#FAFBFC" class="left_txt"><span class="left_ts">3、</span> 开发日期：<%
	  java.util.Date date = new java.util.Date();
java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd", java.util.Locale.CHINA);

String result = format.format(date);
out.print(result);
	  %></td>
                              <td bgcolor="#FAFBFC" class="left_txt">&nbsp;</td>
                            </tr>
                            <tr>
                              <td bgcolor="#FAFBFC">&nbsp;</td>
                              <td align="left" bgcolor="#FAFBFC" class="left_txt"><span class="left_ts">4、版权所有</span></td>
                              <td bgcolor="#FAFBFC" class="left_txt">&nbsp;</td>
                            </tr>
                            <tr>
                              <td height="5" colspan="3"></td>
                            </tr>
                          </tbody>
                      </table></td>
                    </tr>
                  </tbody>
              </table></td>
          </tr>
          <tr>
            <td height="40" colspan="2"><table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
                <tr>
                  <td></td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td width="2%">&nbsp;</td>
            <td width="51%" class="left_txt"><img src="images/icon-mail2.gif" width="16" height="11" /> 客户服务邮箱：xxxxxx@qq.com<br />
                <img src="images/icon-phone.gif" width="17" height="14" /> 官方网站：http://www.xxxxxxxx.com</td>
          </tr>
        </table></td>
        <td width="8" background="images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35" background="images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="images/tab_18.gif" width="12" height="35" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="STYLE4">&nbsp;&nbsp;我系统正在努力进步，希望您能多给宝贵意见，谢谢合作！</td>
            <td>&nbsp;</td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
  </body>
</html>

