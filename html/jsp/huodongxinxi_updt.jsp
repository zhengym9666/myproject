
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
    
    <title>活动信息</title><script language="javascript" src="js/Calendar.js"></script>
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
	if(document.form1.huodongbianhao.value==""){alert("请输入活动编号");document.form1.huodongbianhao.focus();return false;}if(document.form1.huodongmingcheng.value==""){alert("请输入活动名称");document.form1.huodongmingcheng.focus();return false;}if(document.form1.shetuan.value==""){alert("请输入社团");document.form1.shetuan.focus();return false;}
}
</script>
  <body >
  <%
  String id=request.getParameter("id");
   %>
  <form name="form1" id="form1" method="post" action="huodongxinxi_updt_post.jsp?id=<%=id %>">
  修改活动信息:
  <br><br>
  <%
  String sql="select * from huodongxinxi where id="+id;
  String huodongbianhao="";String huodongmingcheng="";String huodongzhuti="";String fuzeren="";String zhubandanwei="";String chengbandanwei="";String huodongriqi="";String wupinjieyong="";String shetuan="";String beizhu="";
  ResultSet RS_result=connDbBean.executeQuery(sql);
  while(RS_result.next()){
  huodongbianhao=RS_result.getString("huodongbianhao");huodongmingcheng=RS_result.getString("huodongmingcheng");huodongzhuti=RS_result.getString("huodongzhuti");fuzeren=RS_result.getString("fuzeren");zhubandanwei=RS_result.getString("zhubandanwei");chengbandanwei=RS_result.getString("chengbandanwei");huodongriqi=RS_result.getString("huodongriqi");wupinjieyong=RS_result.getString("wupinjieyong");shetuan=RS_result.getString("shetuan");beizhu=RS_result.getString("beizhu");
  }
   %>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     <tr><td>活动编号：</td><td><input name='huodongbianhao' type='text' id='huodongbianhao' value='<%= huodongbianhao%>' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>活动名称：</td><td><input name='huodongmingcheng' type='text' id='huodongmingcheng' size='50' value='<%=huodongmingcheng%>' style='border:solid 1px #000000; color:#666666'/></td></tr><tr><td>活动主题：</td><td><input name='huodongzhuti' type='text' id='huodongzhuti' size='50' value='<%=huodongzhuti%>' style='border:solid 1px #000000; color:#666666'/></td></tr><tr><td>负责人：</td><td><input name='fuzeren' type='text' id='fuzeren' value='<%= fuzeren%>' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>主办单位：</td><td><input name='zhubandanwei' type='text' id='zhubandanwei' size='50' value='<%=zhubandanwei%>' style='border:solid 1px #000000; color:#666666'/></td></tr><tr><td>承办单位：</td><td><input name='chengbandanwei' type='text' id='chengbandanwei' size='50' value='<%=chengbandanwei%>' style='border:solid 1px #000000; color:#666666'/></td></tr><tr><td>活动日期：</td><td><input name='huodongriqi' type='text' id='huodongriqi' value='<%= huodongriqi%>' onclick="getDate(form1.huodongriqi,'2')" need="1" readonly='readonly'  /></td></tr><tr><td>物品借用：</td><td><input name='wupinjieyong' type='text' id='wupinjieyong' size='50' value='<%=wupinjieyong%>' style='border:solid 1px #000000; color:#666666'/></td></tr><tr><td>社团：</td><td><input name='shetuan' type='text' id='shetuan' value='<%= shetuan%>' style='border:solid 1px #000000; color:#666666' /></td></tr><tr><td>备注：</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' style='border:solid 1px #000000; color:#666666'><%=beizhu%></textarea></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onclick="return check();" />
      <input type="reset" name="Submit2" value="重置" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


