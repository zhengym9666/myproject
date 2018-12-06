<%@ page language ="java" import = "java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312" session = "true"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>Insert title here</title>

<META content="MSHTML 6.00.2800.1106" name=GENERATOR>
<script language="javascript"> 
function loadimage(){ 
document.getElementById("randImage").src = "image.jsp?"+Math.random(); 
} 
function checkuserlog()
{
	if(document.formlog.username.value=="" || document.formlog.pwd1.value=="" || document.formlog.rand.value=="")
	{
		alert('请输入完整');
		return false;
	}
}
</script> 
</HEAD>
<table id="__01" width="264" height="822" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td><table id="__01" width="264" height="235" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="264" height="39" background="qtimages/1_02_03_01_01.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="41%" align="center"><span class="STYLE1">系统公告</span></td>
                        <td width="59%">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><table id="__01" width="264" height="187" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="10" background="qtimages/1_02_03_01_02_01.gif">&nbsp;</td>
                        <td width="241" height="188" valign="middle"><marquee border="0" direction="up" height="170" onMouseOut="start()" onMouseOver="stop()"
                scrollamount="1" scrolldelay="50"><TABLE width="92%" height="100%" 
            border=0 align=center 
      cellPadding=0 cellSpacing=5>
           <TBODY><TR>
<%--            <TD><%
			String sqlxtgg="select * from dx where leibie='系统公告'";
			 ResultSet RS_resultxtgg=connDbBean.executeQuery(sqlxtgg);
			 while(RS_resultxtgg.next())
			 {
			 out.print(RS_resultxtgg.getString("content"));
			 }
			%></TD> --%>
			</TR>
			</TBODY></TABLE></marquee></td>
                        <td width="13" background="qtimages/1_02_03_01_02_03.gif">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><img src="qtimages/1_02_03_01_03.gif" width="264" height="9" alt=""></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td><table id="__01" width="264" height="200" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="264" height="39" background="qtimages/1_02_03_01_01.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="41%" align="center"><span class="STYLE1">用户登陆</span></td>
                          <td width="59%">&nbsp;</td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><table id="__01" width="264" height="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="10" background="qtimages/1_02_03_01_02_01.gif">&nbsp;</td>
                          <td width="241" height="150"><%

	
	if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")=="")
	{
	 %>
                            <table width="91%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#EFCE7B" style="border-collapse:collapse" >
                              <form name="formlog" method="post" action="userlog_post.jsp">
                                <tr>
                                  <td width="28%" height="30">用户名</td>
                                  <td width="72%" height="30"><input name="username" type="text" id="username" Style="border-right: #cadcb2 1px solid;
                        border-top: #cadcb2 1px solid; font-size: 12px; border-left: #cadcb2 1px solid;
                        width: 80px; color: #81b432; border-bottom: #cadcb2 1px solid; height: 18px" size="12"></td>
                                </tr>
                                <tr>
                                  <td height="30">密码</td>
                                  <td height="30"><input name="pwd1" type="password" id="pwd1" Style="border-right: #cadcb2 1px solid;
                        border-top: #cadcb2 1px solid; font-size: 12px; border-left: #cadcb2 1px solid;
                        width: 80px; color: #81b432; border-bottom: #cadcb2 1px solid; height: 18px"></td>
                                </tr>
                                <tr style="display:none">
                                  <td height="30">权限</td>
                                  <td height="30"><select name="cx" id="cx" Style="border-right: #cadcb2 1px solid;
                        border-top: #cadcb2 1px solid; font-size: 12px; border-left: #cadcb2 1px solid;
                        width: 100px; color: #81b432; border-bottom: #cadcb2 1px solid; height: 18px">
                                      <option value="注册用户">注册用户</option>
                                    </select>
                                  </td>
                                </tr>
                                <tr>
                                  <td height="30">验证码</td>
                                  <td height="30"><input type="text" name="rand" id="rand" size="5">
                                    <a href="javascript:loadimage();"><img alt="看不清请点我！" name="randImage" id="randImage" src="image.jsp" width="60" height="20" border="1" align="absmiddle"></a></td>
                                </tr>
                                <tr>
                                  <td height="30">&nbsp;</td>
                                  <td height="30"><input type="submit" name="Submit" value="登陆" style=" height:19px; border:solid 1px #000000; color:#666666" onClick="return checkuserlog()">
                                      <input type="reset" name="Submit2" value="重置" style=" height:19px; border:solid 1px #000000; color:#666666"></td>
                                </tr>
                              </form>
                            </table>
                            <%
					}
					else
					{
					%>
                            <table width="90%" height="82%" border="0" align="center" cellpadding="0" cellspacing="0">
                              <tr>
                                <td width="31%" height="30">用户名</td>
                                <td width="69%" height="30"><%=request.getSession().getAttribute("username")%></td>
                              </tr>
                              <tr>
                                <td height="30">权限</td>
                                <td height="30"><%=request.getSession().getAttribute("cx")%> </td>
                              </tr>
                              <tr>
                                <td height="30" colspan="2" align="center"><input type="button" name="Submit3" value="退出" onClick="javascript:location.href='logout.jsp';" style=" height:19px; border:solid 1px #000000; color:#666666">
                                    <input type="button" name="Submit32" value="个人后台" onClick="javascript:location.href='main.jsp';" style=" height:19px; border:solid 1px #000000; color:#666666">
                                </td>
                              </tr>
                            </table>
                          <%
					}
					%></td>
                          <td width="13" background="qtimages/1_02_03_01_02_03.gif">&nbsp;</td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><img src="qtimages/1_02_03_01_03.gif" width="264" height="9" alt=""></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td><table id="__01" width="264" height="165" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="264" height="39" background="qtimages/1_02_03_01_01.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="41%" align="center"><span class="STYLE1">站内搜索</span></td>
                          <td width="59%">&nbsp;</td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="100%"><table id="__01" width="264" height="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="10" background="qtimages/1_02_03_01_02_01.gif">&nbsp;</td>
                          <td width="241" height="100%"><table width="90%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <form action="news.jsp" method="post" name="formsearch" id="formsearch" >
                              <tr>
                                <td width="19%" height="30">标题</td>
                                <td width="81%" height="30"><input name="keyword" type="text" id="keyword" size="18" style=" height:19px; border:solid 1px #000000; color:#666666" /></td>
                              </tr>
                              <tr>
                                <td height="30">类别</td>
                                <td height="30"><select name="lb" style=" height:19px; border:solid 1px #000000; color:#666666">
                                    <option value="站内新闻">站内新闻</option>
                                  </select>
                                </td>
                              </tr>
                              <tr>
                                <td height="30">&nbsp;</td>
                                <td height="30"><input type="submit" name="Submit4" value="提交" style=" height:19px; border:solid 1px #000000; color:#666666" /></td>
                              </tr>
                            </form>
                          </table></td>
                          <td width="13" background="qtimages/1_02_03_01_02_03.gif">&nbsp;</td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><img src="qtimages/1_02_03_01_03.gif" width="264" height="9" alt=""></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td><table id="__01" width="264" height="172" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="264" height="39" background="qtimages/1_02_03_01_01.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="41%" align="center"><span class="STYLE1">友情链接</span></td>
                          <td width="59%">&nbsp;</td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><table id="__01" width="264" height="170" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="10" background="qtimages/1_02_03_01_02_01.gif">&nbsp;</td>
                          <td width="241" height="100%" valign="middle"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="newsline">
                            <%-- <%
        String sql2="";
  sql2="select * from youqinglianjie where 1=1 limit 0,5";
  /* sql2=sql2+" order by id desc"; */
 ResultSet RS_result2=connDbBean.executeQuery(sql2);
 String wangzhanmingcheng="";String wangzhi="";
 //int i=0;
 while(RS_result2.next()){
 //i=i+1;
wangzhanmingcheng=RS_result2.getString("wangzhanmingcheng");wangzhi=RS_result2.getString("wangzhi");

         %> --%>
                            <%-- <tr valign="middle">
                              <td width="12%" height="30" align="center" class="STYLE2"><img src="qtimages/1.jpg" ></td>
                              <td width="18%" height="30" align="left"><a href="<%= wangzhi%>" class="b" target="_blank"><%= wangzhanmingcheng%></a></td>
                              <td width="70%" align="left"><a href="<%= wangzhi%>" class="b" target="_blank"><%= wangzhi%></a></td>
                            </tr>
                            <%} %>
                          </table></td>
                          <td width="13" background="qtimages/1_02_03_01_02_03.gif">&nbsp;</td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><img src="qtimages/1_02_03_01_03.gif" width="264" height="9" alt=""></td>
                  </tr>
                </table></td>
              </tr>
            </table> --%>