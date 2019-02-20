<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/receipt/receipt.css">
</head>
<body>
<div id="receiptwrapper">
	<iframe width="130%" height="100%" frameborder="0" class="" src="" name="content" id="receiptInfo" style="overfolw-x:hidden"></iframe>
</div>

</body>

<script type="text/javascript" src="../jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	$(function(){
			
		 //获取路径 | | |
        var pathName=window.document.location.pathname;
		//截取，得到项目名称
        var projectName=pathName.substring(0 ,pathName.substr(1).indexOf('/')+1);	
		var url = projectName+"/receipt/queryAllReceipt.action";
		window.document.getElementById("receiptInfo").src = url;
		
	});


</script>
</html>