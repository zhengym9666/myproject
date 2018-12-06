
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
    
    <title>活动信息</title><LINK href="css.css" type=text/css rel=stylesheet>
    <script language="javascript" src="js/Calendar.js"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	    <script type="text/javascript">
	    function up(tt)
	    {
	        var pop=new Popup({ contentType:1,isReloadOnClose:false,width:300,height:50});
            pop.setContent("contentUrl","upload.jsp?Result="+tt);
            pop.setContent("title","文件上传");
            pop.build();
            pop.show();
	    }
	</script>
  </head>
<script language="javascript">
function check()
{
	if(document.form1.huodongbianhao.value==""){alert("请输入活动编号");document.form1.huodongbianhao.focus();return false;}if(document.form1.huodongmingcheng.value==""){alert("请输入活动名称");document.form1.huodongmingcheng.focus();return false;}if(document.form1.shetuan.value==""){alert("请输入社团");document.form1.shetuan.focus();return false;}
}
function gow()
{
	document.location.href="huodongxinxi_add.jsp?jihuabifffanhao="+document.form1.jihuabifffanhao.value;
}
</script>
  <body >
    <%
  String sql;
  ResultSet RS_result;
 //islbdq String id=request.getParameter("id");
 //islbdq sql="select * from melieibaoduqubiaoiguo where id="+id;
 //islbdq gogogogogo
 //islbdq RS_result=connDbBean.executeQuery(sql);
 //islbdq while(RS_result.next()){
 //islbdq lelelelelele
 //islbdq }
   %>
  <form name="form1" id="form1" method="post" action="huodongxinxi_add_post.jsp">
  添加活动信息:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">    <tr><td>活动编号：</td><td><input name='huodongbianhao' type='text' id='huodongbianhao' value='' style='border:solid 1px #000000; color:#666666' />&nbsp;*</td></tr><tr><td>活动名称：</td><td><input name='huodongmingcheng' type='text' id='huodongmingcheng' value='' size='50' style='border:solid 1px #000000; color:#666666' />&nbsp;*</td></tr><tr><td>活动主题：</td><td><input name='huodongzhuti' type='text' id='huodongzhuti' value='' size='50' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>负责人：</td><td><input name='fuzeren' type='text' id='fuzeren' value='' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>主办单位：</td><td><input name='zhubandanwei' type='text' id='zhubandanwei' value='' size='50' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>承办单位：</td><td><input name='chengbandanwei' type='text' id='chengbandanwei' value='' size='50' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>活动日期：</td><td><input name='huodongriqi' type='text' id='huodongriqi' value='' readonly='readonly' onClick="getDate(document.form1.huodongriqi,'2')" need='1' style='width:100px; height:16px; border:solid 1px #000000; color:#666666'/></td></tr><tr><td>物品借用：</td><td><input name='wupinjieyong' type='text' id='wupinjieyong' value='' size='50' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>社团：</td><td><input name='shetuan' type='text' id='shetuan' style='border:solid 1px #000000; color:#666666' value='<%=request.getSession().getAttribute("st")%>' />&nbsp;*</td></tr><tr><td>备注：</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' style='border:solid 1px #000000; color:#666666'></textarea></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onClick="return check();" style='border:solid 1px #000000; color:#666666' />
      <input type="reset" name="Submit2" value="重置" style='border:solid 1px #000000; color:#666666' /></td>
    </tr>
  </table>
</form>

  </body>
</html>

