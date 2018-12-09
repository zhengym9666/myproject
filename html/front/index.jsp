<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/> --%>

<html>
<head>
    <title>学生社团管理系统</title>
    <!-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8"> -->
    <LINK href="./qtimages/style.css" type=text/css rel=stylesheet>
    <style type="text/css">
        <!--
        .STYLE1 {
            color: #FFFFFF;
            font-weight: bold;
        }
        .STYLE3 {color: #086BD6; font-weight: bold; }
        -->
    </style>
</head>
<body class = "ui-body">
<table width="1002"  border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
    <tr>
        <td><%@ include file="./panel/qttop.html"%></td>
    </tr>
    <tr>
        <td><table id="__01" width="1002" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td rowspan="2" valign="top">
                    <table id="__01" width="738" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td><table id="__01" width="738" height="319" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="738" height="62" background="qtimages/1_02_01_01_01.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="23%" align="center"><a href="news.jsp?lb=站内新闻"><span class="STYLE3">社团新闻</span></a></td>
                                            <td width="77%">&nbsp;</td>
                                        </tr>
                                    </table></td>
                                </tr>
                                <tr>
                                    <td><table id="__01" width="738" height="248" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td><table id="__01" width="325" height="248" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td><img src="qtimages/1_02_01_01_02_01_01.gif" width="10" height="248" alt=""></td>
                                                    <td width="304" height="248" background="qtimages/1_02_01_01_02_01_02.gif" align="center">
                                                        <%--                                 <SCRIPT type=text/javascript>
                                                        var focus_width=284;
                                                        var focus_height=211;
                                                        var text_height=20;
                                                        var swf_height = focus_height+text_height;
                                                        var pics="";
                                                        var links="";
                                                        var texts="";
                                                        <%
                                                            String sqlbht;
                                                            sqlbht="select  id,biaoti,shouyetupian from xinwentongzhi where shouyetupian<>'' and shouyetupian<>'null'  and shouyetupian  like '%.jpg'  order by id desc";
                                                            ResultSet RS_resultbht=connDbBean.executeQuery(sqlbht);
                                                            String idbht="";
                                                            String biaotibht="";
                                                            String shouyetupianbht="";
                                                            String ttbt="";
                                                            int bhti=0;
                                                             while(RS_resultbht.next()){
                                                             bhti=bhti+1;
                                                             if(bhti<=5)
                                                             {
                                                             ttbt=RS_resultbht.getString("biaoti");
                                                             ttbt=ttbt.replace("'","");
                                                             ttbt=ttbt.replace("\"","");
                                                             ttbt=ttbt.replace("(","");
                                                             ttbt=ttbt.replace(")","");
                                                             ttbt=ttbt.replace("%","");
                                                             ttbt=ttbt.replace("?","");
                                                         shouyetupianbht=shouyetupianbht+RS_resultbht.getString("shouyetupian")+"|";
                                                         idbht=idbht+"gg_detail.jsp?id="+RS_resultbht.getString("id")+"|";
                                                         biaotibht=biaotibht+ttbt+"|";
                                                         }
                                                         }
                                                         shouyetupianbht=shouyetupianbht.substring(0,shouyetupianbht.length()-1);
                                                         idbht=idbht.substring(0,idbht.length()-1);
                                                         biaotibht=biaotibht.substring(0,biaotibht.length()-1);
                                                        %>
                                                        pics="<%=shouyetupianbht%>";
                                                        links="<%=idbht%>";
                                                        texts="<%=biaotibht%>";
                                                        document.write('<embed src="qtimages/pixviewer.swf" wmode="opaque" FlashVars="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'" menu="false" bgcolor="#ffffff" quality="Best" width="'+ focus_width +'" height="'+ swf_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer">');

                                                                        </SCRIPT> --%>
                                                    </td>
                                                    <td><img src="qtimages/1_02_01_01_02_01_03.gif" width="11" height="248" alt=""></td>
                                                </tr>
                                            </table></td>
                                            <td width="413" height="248" valign="top" background="qtimages/1_02_01_01_02_02.gif"><table  cellspacing="0" cellpadding="0" width="98%"
                                                                                                                                         align="center" border="0" class="newsline">
                                                <%--                               <tbody>
                                                                                <%
                                                                            String sql="";
                                                                            sql="select  id,biaoti,addtime from xinwentongzhi where leibie='站内新闻' order by id desc";
                                                                             String id="";
                                                 String biaoti="";
                                                 String addtime="";
                                                 int i=0;
                                                  ResultSet RS_result=connDbBean.executeQuery(sql);
                                                                            while(RS_result.next()){
                                                 i=i+1;
                                                 if(i<=9)
                                                 {
                                                 id=RS_result.getString("id");
                                                biaoti=RS_result.getString("biaoti");
                                                if(biaoti.length() >=24)
                                                {
                                                biaoti=biaoti.substring(0,24);
                                                }
                                                 addtime=RS_result.getString("addtime");



                                                                            %>
                                                                                <tr>
                                                                                  <td width="4%" height="25" align="center" ><img src="qtimages/1.jpg" width="9" height="9" ></td>
                                                                                  <td width="73%" height="25"><a
                                                                        href="gg_detail.jsp?id=<%=id%>"><%=biaoti%></a> </td>
                                                                                  <td width="23%" height="25" align="center"><SPAN
                                                                        style="FONT-SIZE: 9pt; COLOR: #b5a073; FONT-FAMILY: 宋体">
                                                                                    <%
                                                out.print(addtime.substring(0,10));
                                                %>
                                                                                  </SPAN></td>
                                                                                </tr>
                                                                                <%
                                                                            }
                                                                            }
                                                                            %>
                                                                              </tbody> --%>
                                            </table></td>
                                        </tr>
                                    </table></td>
                                </tr>
                                <tr>
                                    <td><img src="qtimages/1_02_01_01_03.gif" width="738" height="9" alt=""></td>
                                </tr>
                            </table></td>
                        </tr>
                        <tr>
                            <td><table id="__01" width="738" height="225" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="738" height="41" background="qtimages/1_02_01_02_01.gif"><table width="100%" height="18" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="24%" align="center" valign="bottom"><span class="STYLE3">社员风彩</span></td>
                                            <td width="64%" valign="bottom">&nbsp;</td>
                                            <td width="12%" valign="bottom"><a href="sheyuanxinxilist.jsp" ><font class="STYLE3">更多&gt;&gt;</font></a></td>
                                        </tr>
                                    </table></td>
                                </tr>
                                <tr>
                                    <td width="738" height="174"><table id="__01" width="738" height="174" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="13" background="qtimages/1_02_01_02_02_01.gif">&nbsp;</td>
                                            <td width="714" height="100%"><table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                <%--                           <tr>
                                                                            <%
                                                                             id="";
                                                                             i=0;
                                                                      sql="SELECT id,zhaopian,xingming FROM sheyuanxinxi WHERE zhaopian<>'' LIMIT 0,4";
                                                                    RS_result=connDbBean.executeQuery(sql);
                                                                    String xingming="";String touxiang="";  addtime="";
                                                                     while(RS_result.next()){
                                                  id=RS_result.getString("id");
                                                 xingming=RS_result.getString("xingming");touxiang=RS_result.getString("zhaopian");


                                                                  %>
                                                                            <td align="center"><table width="150" height="161" border="0" cellpadding="0" cellspacing="0">
                                                                                <tr>
                                                                                  <td height="134" align="center"><a href="sheyuanxinxidetail.jsp?id=<%=id%>"><img src="<%=touxiang%>" width="129" height="134" border="0" /></a></td>
                                                                                </tr>
                                                                                <tr>
                                                                                  <td height="26" align="center"><%=xingming%></td>
                                                                                </tr>
                                                                            </table></td>
                                                                            <%
                                                                      }
                                                                  %>
                                                                          </tr>
                                                                        </table></td>
                                                                        <td width="11" background="qtimages/1_02_01_02_02_03.gif">&nbsp;</td>
                                                                      </tr>
                                                                    </table></td>
                                                                  </tr>
                                                                  <tr>
                                                                    <td><img src="qtimages/1_02_01_02_03.gif" width="738" height="10" alt=""></td>
                                                                  </tr>
                                                                </table></td>
                                                              </tr> --%>
                                                <tr>
                                                    <td><table id="__01" width="738" height="225" border="0" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td width="738" height="41" background="qtimages/1_02_01_02_01.gif"><table width="100%" height="18" border="0" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td width="24%" align="center" valign="bottom"><span class="STYLE3">社团信息</span></td>
                                                                    <td width="64%" valign="bottom">&nbsp;</td>
                                                                    <td width="12%" valign="bottom"><a href="shetuanxinxilist.jsp" ><font class="STYLE3">更多&gt;&gt;</font></a></td>
                                                                </tr>
                                                            </table></td>
                                                        </tr>
                                                        <tr>
                                                            <td width="738" height="174"><table id="__01" width="738" height="174" border="0" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td width="13" background="qtimages/1_02_01_02_02_01.gif">&nbsp;</td>
                                                                    <td width="714" height="100%" valign="top"><table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#007BCE" class="newsline" style="border-collapse:collapse">
                                                                        <tr>
                                                                            <td width="30" align="center" bgcolor="CCFFFF">序号</td>
                                                                            <td bgcolor='#CCFFFF'>社团名称</td>
                                                                            <td bgcolor='#CCFFFF'>性质</td>
                                                                            <td bgcolor='#CCFFFF'>创始人</td>
                                                                            <td bgcolor='#CCFFFF'>负责人</td>
                                                                            <td bgcolor='#CCFFFF' width='65' align='center'>创办日期</td>
                                                                            <td bgcolor='#CCFFFF'>挂靠单位</td>
                                                                            <td bgcolor='#CCFFFF'>人数</td>
                                                                            <td width="30" align="center" bgcolor="CCFFFF">详细</td>
                                                                        </tr>
                                                                        <%--  <%
                                               sql="SELECT * FROM shetuanxinxi LIMIT 0,6";

                                              /*  sql=sql+" order by id desc"; */
                                               RS_result=connDbBean.executeQuery(sql);
                                               id="";
                                              String shetuanmingcheng="";String jianjie="";String xingzhi="";String chuangshiren="";String fuzeren="";String chuangbanriqi="";String guakaodanwei="";String renshu="";
                                               addtime="";
                                               i=0;
                                              while(RS_result.next()){
                                              i=i+1;
                                              id=RS_result.getString("id");
                                             shetuanmingcheng=RS_result.getString("shetuanmingcheng");jianjie=RS_result.getString("jianjie");xingzhi=RS_result.getString("xingzhi");chuangshiren=RS_result.getString("chuangshiren");fuzeren=RS_result.getString("fuzeren");chuangbanriqi=RS_result.getString("chuangbanriqi");guakaodanwei=RS_result.getString("guakaodanwei");renshu=RS_result.getString("renshu");
                                              addtime=RS_result.getString("addtime");
                                             %>
                                                                         <tr>
                                                                           <td width="30" align="center"><%=i %></td>
                                                                           <td><%=shetuanmingcheng %></td>
                                                                           <td><%=xingzhi %></td>
                                                                           <td><%=chuangshiren %></td>
                                                                           <td><%=fuzeren %></td>
                                                                           <td><%=chuangbanriqi %></td>
                                                                           <td><%=guakaodanwei %></td>
                                                                           <td><%=renshu %></td>
                                                                           <td width="30" align="center"><a href="shetuanxinxidetail.jsp?id=<%=id%>" >详细</a></td>
                                                                         </tr>
                                                                         <%
                                               }
                                                %> --%>
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
                                            <%--  <td valign="top"><%@ include file="./panel/qtleft.jsp"%></td> --%>
                                        </tr>
                                    </table></td>
                                </tr>
                                <tr>
                                    <%-- <td><%@ include file="./panel/qtdown.jsp"%></td> --%>
                                </tr>
                            </table>
</body>
</html>