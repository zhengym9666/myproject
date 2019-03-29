<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查询用户任务</title>
<!-- <link rel="stylesheet" type="text/css" href="../../css/userTask/userTask.css"/> -->
<style type="text/css">
table{
	color:#040404;
	margin-left:23px;
	border-collapse: collapse;
	border:1px solid #babbbb;
	box-shadow:inset -1px -1px 11px 2px #a9d2e6;
}
h2{
	color:#d8d2d2;
}
#auditPage p{
	color:#4d49f5;
	font-size:18px;
	margin-left:-240px;
	font-weight:600;
}
#completedAudit{
	position:absolute;
	right:235px;
}
thead{
	background:#d1ecf7;
	color:#171717;
}
thead tr,tbody tr{
	height:35px;
}
#auditPage .tips{
	color:#026fe8;
	position:absolute;
	margin:18px 413px;
}
#auditPage .foot{
	color:#026fe8;
	position:absolute;
	margin:18px 413px;
}
a{
	text-decoration:none;
	color:#026fe8;
}
a:hover{
	cursor:pointer;
}
#auditPage table{
	width:80%;
}
#completedAudit:hover{
	cursor:pointer;
}
#backToAuditPage{
	width:58px;
	height:36px;
	display:inline-block;
	background:#2b7b05;
	line-height:36px;
	text-align:center;
	color:#f1f1f1;
	margin:10px 576px;
	border:none;
	border-radius:5px;
	font-size:14px;
}
</style>
</head>
<body>
	<div id="auditPage">
		<%-- <center><h2>查询用户任务</h2></center><hr/> --%>
		<p style="margin:0 588px;height:38px;">已审批任务</p>
		<c:if test="${not empty auditedList }">
		<table border="1">
			<thead>
				<tr>
					<th>报销人学号</th>
					<th>报销人姓名</th>
					<th>所在部门</th>
					<th>报销时间</th>
					<th>报销原因</th>
					<th>报销金额</th>
					<th>审核意见</th>
				</tr>	
			</thead>
			<tbody>
				<c:forEach items="${auditedList }" var="auditedItem">
					<tr>
						<td>${auditedItem.auditNum }</td>
						<td>${auditedItem.auditName }</td>
						<td>${auditedItem.department }</td>
						<td><fmt:formatDate value="${auditedItem.time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td>${auditedItem.reason }</td>
						<td>${auditedItem.total }</td>
						<td>
							<c:if test="${auditedItem.state<0 }"><span title="${auditedItem.audit_suggest }">未通过（${fn:substring(auditedItem.audit_suggest,0,5)}）</span></c:if>
							<c:if test="${auditedItem.state>0 && auditedItem.state<4 }"><span>通过</span></c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>	
			
		</table>
		</c:if>
		<c:if test="${auditedList==null }">
		<p class="tips">暂无已完成审批！</p>
		</c:if>
		<a id="backToAuditPage">返回</a>
		<div class="foot">
			<a id="firstPage" href="${pageContext.request.contextPath }/activiti/queryCompletedAuditTask.action?currentPage=${pageCompletedAudit.firstPage }&collegeId=${collegeId}&clubId=${clubId}">首页</a>&nbsp;
			<a id="prePage" href="${pageContext.request.contextPath }/activiti/queryCompletedAuditTask.action?currentPage=${pageCompletedAudit.prePage }&collegeId=${collegeId}&clubId=${clubId}">上一页</a>&nbsp;
			<a id="nextPage" href = "${pageContext.request.contextPath }/activiti/queryCompletedAuditTask.action?currentPage=${pageCompletedAudit.nextPage }&collegeId=${collegeId}&clubId=${clubId}">下一页</a>&nbsp;
			<a id="lastPage" href="${pageContext.request.contextPath }/activiti/queryCompletedAuditTask.action?currentPage=${pageCompletedAudit.totalPage }&collegeId=${collegeId}&clubId=${clubId}">末页</a>&nbsp;
			第${pageCompletedAudit.currentPage }页/共${pageCompletedAudit.totalPage }页&nbsp;一共有${pageCompletedAudit.totalCount }条数据
		</div>
	</div>
	
</body>
<script type="text/javascript" src="http://localhost:8080/gd_stu_dev/front/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#backToAuditPage").click(function(){
			 //获取路径 | | |
	        var pathName=window.document.location.pathname;
			//截取，得到项目名称
	        var projectName=pathName.substring(0 ,pathName.substr(1).indexOf('/')+1);
			var url = projectName+"/activiti/queryUserTask.action";
			$.ajax({
				type:'post',
				url:url,
				data:{},
				success:function(data){
					$("#auditPage").html(data);
				},
				error:function(){
					alert("响应失败！");
				}
			});
		});
	})
</script>

</html>