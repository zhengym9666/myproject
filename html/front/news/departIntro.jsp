<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">
	var rootPath = "<%=request.getContextPath()%>";
</script>
<title>${clubName }-部门简介</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/news/newscontent.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/news/commentStyle.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/news/comment.css">
</head>
<body>
<div style="width:98%;height:100%;position:absolute;top:10px;">	
	<div class="title">
		<p>
			部门简介
		</p>
		
		
	</div>
	<div class="departContent" style="width:77%;margin:0 auto;">
		<c:forEach items="${departList }" var="departInfo">
			<h2>${departInfo.name }</h2>
		<div>
			${departInfo.intro }
		</div>
		</c:forEach>	
	</div>
	
	

</html>