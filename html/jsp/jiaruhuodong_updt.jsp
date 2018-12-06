
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
    
    <title>加入活动</title><script language="javascript" src="js/Calendar.js"></script>
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
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>
<script language="javascript">
function check()
{
	if(document.form1.huodongbianhao.value==""){alert("请输入活动编号");document.form1.huodongbianhao.focus();return false;}if(document.form1.huodongmingcheng.value==""){alert("请输入活动名称");document.form1.huodongmingcheng.focus();return false;}
}
</script>
  <body >
  <%
  String id=request.getParameter("id");
   %>
  <form name="form1" id="form1" method="post" action="jiaruhuodong_updt_post.jsp?id=<%=id %>">
  修改加入活动:
  <br><br>
  <%
  String sql="select * from jiaruhuodong where id="+id;
  String huodongbianhao="";String huodongmingcheng="";String huodongriqi="";String shetuan="";String jiaruren="";String beizhu="";
  ResultSet RS_result=connDbBean.executeQuery(sql);
  while(RS_result.next()){
  huodongbianhao=RS_result.getString("huodongbianhao");huodongmingcheng=RS_result.getString("huodongmingcheng");huodongriqi=RS_result.getString("huodongriqi");shetuan=RS_result.getString("shetuan");jiaruren=RS_result.getString("jiaruren");beizhu=RS_result.getString("beizhu");
  }
   %>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     <tr><td>活动编号：</td><td><input name='huodongbianhao' type='text' id='huodongbianhao' value='<%= huodongbianhao%>' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>活动名称：</td><td><input name='huodongmingcheng' type='text' id='huodongmingcheng' size='50' value='<%=huodongmingcheng%>' style='border:solid 1px #000000; color:#666666'/></td></tr><tr><td>活动日期：</td><td><input name='huodongriqi' type='text' id='huodongriqi' value='<%= huodongriqi%>' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>社团：</td><td><input name='shetuan' type='text' id='shetuan' value='<%= shetuan%>' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>加入人：</td><td><input name='jiaruren' type='text' id='jiaruren' value='<%= jiaruren%>' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>备注：</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' style='border:solid 1px #000000; color:#666666'><%=beizhu%></textarea></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onclick="return check();" />
      <input type="reset" name="Submit2" value="重置" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


