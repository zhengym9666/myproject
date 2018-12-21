<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/news/newscontent.css" />
</head>
<body>
<div style="width:75%;height:100%;position:absolute;top:10px;bottom:20px;">
	<div class="head">
		<span>
			<%=request.getAttribute("head") %>
		</span>
	</div>
	<div class="title">
		<p>
			<%=request.getAttribute("title") %>
		</p>
	</div>
	<div class="content">
		<img alt="" src="../css/news/images/fengmi.jpg">
		<p>
			<%=request.getAttribute("content") %>
		</p>
		<img alt="" src="../css/news/images/fengmi.jpg">
		<p>
			<%=request.getAttribute("content") %>
		</p>
		<img alt="" src="../css/news/images/fengmi.jpg">
		<p>
			<%=request.getAttribute("content") %>
		</p>
		
	</div>
	<div class="foot">
		<span>底部</span></div>
</div>

</body>
</html>