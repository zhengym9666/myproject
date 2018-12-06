
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
    
    <title>财务记录</title><LINK href="css.css" type=text/css rel=stylesheet>
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
	if(document.form1.shetuanmingcheng.value==""){alert("请输入社团名称");document.form1.shetuanmingcheng.focus();return false;}if(document.form1.jine.value==""){alert("请输入金额");document.form1.jine.focus();return false;}if((/^(\+|-)?(0|[1-9]\d*)(\.\d*[1-9])?$/.test(document.form1.jine.value))){}else{alert("金额必需数字型");document.form1.jine.focus();return false;}if(document.form1.jingshouren.value==""){alert("请输入经手人");document.form1.jingshouren.focus();return false;}if(document.form1.xiangmumingcheng.value==""){alert("请输入项目名称");document.form1.xiangmumingcheng.focus();return false;}
}
function gow()
{
	document.location.href="caiwujilu_add.jsp?jihuabifffanhao="+document.form1.jihuabifffanhao.value;
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
  <form name="form1" id="form1" method="post" action="caiwujilu_add_post.jsp">
  添加财务记录:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">    <tr><td>社团名称：</td><td><input name='shetuanmingcheng' type='text' id='shetuanmingcheng' style='border:solid 1px #000000; color:#666666' value='<%=request.getSession().getAttribute("st")%>' />&nbsp;*</td></tr><tr><td>金额：</td><td><input name='jine' type='text' id='jine' value='' style='border:solid 1px #000000; color:#666666' />&nbsp;*&nbsp;&nbsp;必需数字型</td></tr><tr><td>收支：</td><td><select name='shouzhi' id='shouzhi'>
     <option value="收入">收入</option>
     <option value="支出">支出</option>
   </select></td></tr><tr><td>经手人：</td><td><input name='jingshouren' type='text' id='jingshouren' value='' style='border:solid 1px #000000; color:#666666' />&nbsp;*</td></tr><tr><td>项目名称：</td><td><input name='xiangmumingcheng' type='text' id='xiangmumingcheng' value='' size='50' style='border:solid 1px #000000; color:#666666' />&nbsp;*</td></tr><tr><td>日期：</td><td><input name='riqi' type='text' id='riqi' value='' readonly='readonly' onClick="getDate(document.form1.riqi,'2')" need='1' style='width:100px; height:16px; border:solid 1px #000000; color:#666666'/></td></tr><tr><td>备注：</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' style='border:solid 1px #000000; color:#666666'></textarea></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onClick="return check();" style='border:solid 1px #000000; color:#666666' />
      <input type="reset" name="Submit2" value="重置" style='border:solid 1px #000000; color:#666666' /></td>
    </tr>
  </table>
</form>

  </body>
</html>

