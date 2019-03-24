<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/news/newscontent.css" />
</head>
<body>
<div style="width:98%;height:100%;position:absolute;top:10px;">

	<div class="head">
		<span>
			<%-- <%=request.getAttribute("head") %> --%>
			${clubName}
		</span>
		<div class="curpos">
			<span>当前位置：</span>
			<span>${sessionScope.collegeName }</span><span style="font-size:18px;"> · </span>
			<span>${clubName }</span><span style="font-size:18px;"> · </span>
			<span>正文</span>
		</div>
	</div>
		
		<c:forEach items="${pageNews.data }" var="news">
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
		<%--<img alt="" src="${news.image }">
			&lt;%&ndash; <%=request.getAttribute("content") %> &ndash;%&gt;
			${news.content }
		<img alt="" src="${news.image }">
			&lt;%&ndash; <%=request.getAttribute("content") %> &ndash;%&gt;
			${news.content }
		<img alt="" src="${news.image }">
		<p>
			&lt;%&ndash; <%=request.getAttribute("content") %> &ndash;%&gt;
			${news.content }
		</p>--%>
		${news.content }
	</div>
	</c:forEach>
	
	<div class="foot">
	<a id="firstPage" href="${pageContext.request.contextPath }/news/queryNewsPage.action?currentPage=${pageNews.firstPage }&collegeId=${collegeId}&clubId=${clubId}">首页</a>&nbsp;
	<a id="prePage" href="${pageContext.request.contextPath }/news/queryNewsPage.action?currentPage=${pageNews.prePage }&collegeId=${collegeId}&clubId=${clubId}">上一页</a>&nbsp;
	<a id="nextPage" href = "${pageContext.request.contextPath }/news/queryNewsPage.action?currentPage=${pageNews.nextPage }&collegeId=${collegeId}&clubId=${clubId}">下一页</a>&nbsp;
	<a id="lastPage" href="${pageContext.request.contextPath }/news/queryNewsPage.action?currentPage=${pageNews.totalPage }&collegeId=${collegeId}&clubId=${clubId}">末页</a>&nbsp;
	第${pageNews.currentPage }页/共${pageNews.totalPage }页&nbsp;一共有${pageNews.totalCount }条数据
	</div>
</div>

</body>
<script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
<script>
/* 	 $("a").click(function(){
		//获取路径 | | |
        var pathName=window.document.location.pathname;
		//截取，得到项目名称
        var projectName=pathName.substring(0 ,pathName.substr(1).indexOf('/')+1);
		var url=projectName+"/news/queryNewsPage.action";
		var currentPage;
		if($(this).attr("id")=="firstPage"){
			currentPage = ${pageNews.firstPage };
		}else if($(this).attr("id")=="prePage"){
			currentPage=${pageNews.prePage };
		}else if($(this).attr("id")=="nextPage"){
			currentPage=${pageNews.nextPage };
		}else if($(this).attr("id")=="lastPage"){
			currentPage=${pageNews.totalPage };
		}
		var collegeId = ${collegeId};
		var clubId = ${clubId};
		alert(collegeId);
		$.ajax({
			url:url,
			type:'get',
			dataType:"json",
			data:{
				"currentPage":currentPage,
				"collegeId":collegeId,
				"clubId":clubId
			},
			success:function(data){
				console.log(data);
			}
		});
	})  */
</script>
</html>