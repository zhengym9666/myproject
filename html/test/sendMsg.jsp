<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/23
  Time: 0:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script ></script>
<head>
    <title>Title</title>
</head>
<body>
<input id="toTypeId" type="text" placeholder="请输入发送的ID" value="">
<input id="content" type="text" placeholder="请输入发送的内容" value="">
<button id="sendChat1"  onclick="test('测试', 1, '123')">发短信</button>


</body>
<!--juggle库 small require-->
<script src="<%=request.getContextPath()%>/stuchat/js/lib/juggle-help.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/stuchat/js/lib//juggle-event.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/stuchat/js/lib//juggle-all.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/stuchat/js/lib//juggle-http.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/stuchat/js/lib/juggle-mv.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/stuchat/js/lib/juggle-websocket.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/stuchat/js/lib/jquery.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/stuchat/js/anychat/dist/chatUtils.js" type="text/javascript" charset="UTF-8"></script>
<%@ page contentType="text/html;charset=UTF-8" import="java.util.ResourceBundle" %>
<%
    ResourceBundle resource = ResourceBundle.getBundle("/admin/chat");
%>
<script type="text/javascript">

    //获取请求admin的地址
    var oriIdentityUrl= "<%=resource.getString("oriIdentityUrl")%>";
    //获取请求admin的地址
    var ws_url= "<%=resource.getString("ws_url")%>";

    var talkMediator=null;
    window.onload = function () {
        //注意：使用前必须确保student表有 学生ID：123456，学生名：admin，密码：000000的学生管理员信息
        var adminObj = new anychat.AdminObj;
        //oriIdentityUrl,ws_url
        adminObj.initAdminToken();
        talkMediator=adminObj.getTalkMediator();
    }

    function test(content,toType,toTypeId) {
        toTypeId=$("#toTypeId").val();
        content=$("#content").val();
        //content:发送的内容
        //toType：发送类型：1用户 2群组
        //toTypeId：接收的用户
        if(talkMediator!=null && talkMediator!=undefined){
            loginChatProxy=talkMediator.onLogChatProxy();
            if(loginChatProxy!=null && loginChatProxy!=undefined){
                loginChatProxy.sendMessage(content, 1, toTypeId);
            }
        }
    }


</script>


</html>
