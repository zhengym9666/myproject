<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/news/newscontent.css" />
</head>
<body>
<div style="width:75%;height:100%;position:absolute;top:10px;">
<c:forEach items="${pageNews.data }" var="news">
	<div class="head">
		<span>
			<%-- <%=request.getAttribute("head") %> --%>
			${news.clubName }
		</span>
		<div class="curpos">
			<span>当前位置：</span>
			<span>${news.collegeName }</span><span style="font-size:18px;"> · </span>
			<span>${news.clubName }</span><span style="font-size:18px;"> · </span>
			<span>正文</span>
		</div>
	</div>
	
		<div class="title">
		<p>
			<%-- <%=request.getAttribute("title") %> --%>
			${news.title }
		</p>
		<div class="info">
			<span>发布日期：</span><span>${news.submit_time }</span>
			<span style="margin-left:35px;">点击量：</span><span>${news.readcount } </span>
		</div>
		
		
	</div>
	<div class="content">
		<img alt="" src="${news.image }">
			<%-- <%=request.getAttribute("content") %> --%>
			${news.content }
		<img alt="" src="${news.image }">
			<%-- <%=request.getAttribute("content") %> --%>
			${news.content }
		<img alt="" src="${news.image }">
		<p>
			<%-- <%=request.getAttribute("content") %> --%>
			${news.content }
		</p>
		
	</div>
	</c:forEach>
	
	<div class="foot">
	<a href = "${pageContext.request.contextPath }/news/queryNewsPage.action?currentPage=${pageNews.firstPage }&collegeId=${collegeId}&clubId=${clubId}">首页${pageNews.firstPage }</a>&nbsp;
	<a href = "${pageContext.request.contextPath }/news/queryNewsPage.action?currentPage=${pageNews.prePage }&collegeId=${collegeId}&clubId=${clubId}">上一页${pageNews.prePage }</a>&nbsp;
	<a href = "${pageContext.request.contextPath }/news/queryNewsPage.action?currentPage=${pageNews.nextPage }&collegeId=${collegeId}&clubId=${clubId}">下一页${pageNews.nextPage }</a>&nbsp;
	<a href = "${pageContext.request.contextPath }/news/queryNewsPage.action?currentPage=${pageNews.totalPage }&collegeId=${collegeId}&clubId=${clubId}">末页${pageNews.totalPage }</a>&nbsp;
	第${pageNews.currentPage }页/共${pageNews.totalPage }页&nbsp;一共有${pageNews.totalCount }条数据
	</div>
</div>

</body>
<script>
	/* $(".foot a").click(function(){
		//获取路径 | | |
        var pathName=window.document.location.pathname;
		//截取，得到项目名称
        var projectName=pathName.substring(0 ,pathName.substr(1).indexOf('/')+1);
		var url=projectName+"/news/queryNewsPage.action";
		
		$.ajax({
			url:url,
			type:'get',
			dataType:"json",
			data:{
				"currentPage":
			}
		})
	}) */
</script>
</html>