<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/9
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" import="java.util.ResourceBundle" %>
<%
    ResourceBundle resource = ResourceBundle.getBundle("/admin/chat");
%>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">

        var getDataJsonFreq= "<%=resource.getString("ws_url")%>";
        alert(getDataJsonFreq);
    </script>
</head>
<body>
12312123
</body>
</html>
