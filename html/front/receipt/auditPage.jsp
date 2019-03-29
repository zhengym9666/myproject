<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
#auditPage p,.tips{
	color:#4d49f5;
	font-size:18px;
	margin-left:-240px;
	font-weight:600;
}
#completedAudit{
	position:absolute;
	right:270px;
}
#auditPage thead{
	background:#d1ecf7;
	color:#171717;
}
thead tr,tbody tr{
	height:35px;
}
#auditPage .tips{
	margin:20px 680px;
	color:#f12626;
	font-size:16px;
	font-weight:500;
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
#completedAudit:hover{
	cursor:pointer;
}
#auditPage table{
	width:80%;
}
#unpassReason{
    width: 500px;
    height: 300px;
    margin-top: 60px;
    margin-left: 25px;
}
#audit_suggest::-webkit-textarea-placeholder{color:red;}
#audit_suggest{
	font-size:14px;
	color:#000;
	background:#eee;
}
#unpassReason button,#ReceiptInfoBox button{
	width:58px;
	height:36px;
	background:#318609;
	color:#e4e0e0;
	margin-left:136px;
	margin-top:20px;
	border:none;
	border-radius:4px;
}
#backToHomePage{
	width:58px;
	height:36px;
	display:inline-block;
	background:#2b7b05;
	line-height:36px;
	text-align:center;
	color:#f9f9f9;
	margin:10px 576px;
	border:none;
	border-radius:5px;
	font-size:14px;
}
#completedAudit{
	width:88px;
	height:30px;
	display:inline-block;
	background:#2b7b05;
	line-height:30px;
	text-align:center;
	color:#fdfcfc;
	margin:0 20px;
	border:none;
	border-radius:5px;
	font-size:13px;
}
</style>
</head>
<body>
	<div id="ReceiptInfoBox" style="display:none;">
		<div id="oneReceiptInfo"></div>
	</div>
	<div id="auditPage">
		<%-- <center><h2>查询用户任务</h2></center><hr/> --%>
		<div><a href="${pageContext.request.contextPath }/activiti/queryCompletedAuditTask.action" id="completedAudit">已完成审批</a></div>
		<p style="margin:0 588px;height:38px;">待审批任务</p>
		<c:if test="${not empty auditList }">
		<table border="1" align="center" cellspacing="0">
			<thead>
				<tr>
					<th>报销人学号</th>
					<th>报销人姓名</th>
					<th>所在部门</th>
					<th>报销时间</th>
					<th>报销原因</th>
					<th>报销金额</th>
					<th colspan="3">操作</th>
				</tr>	
			</thead>
			<tbody>
				<c:forEach items="${auditList }" var="auditItem">
					<tr>
						<td style="display:none"><input type="hidden" value="${auditItem.taskId }"/></td>
						<td>${auditItem.auditNum }</td>
						<td>${auditItem.auditName }</td>
						<td>${auditItem.department }</td>
						<td><fmt:formatDate value="${auditItem.time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td>${auditItem.reason }</td>
						<td>${auditItem.total }</td>
						<td>
							<a class="pass">
							<input type="hidden" value="${auditItem.taskId }"/>
							<input type="hidden" value="${auditItem.state}"/>通过
							</a>
						</td>
						<td><a class="unpass">不通过</a></td>
						<td><a class="look" href="${pageContext.request.contextPath }/receipt/lookOneReceipt.action?procInstId=${auditItem.procInstId }&backPage=2">查看</a></td>
						<td style="display:none;" class="procInstId"><input type="hidden" value="${auditItem.procInstId }"></td>
					</tr>
				</c:forEach>
			</tbody>	
			
		</table>
		</c:if>
		<c:if test="${auditList==null }">
		<p class="tips">暂无审批！</p>
		</c:if>
		<a id="backToHomePage" href="${pageContext.request.contextPath }/receipt/queryAllReceipt.action">返回</a>
		<div class="foot">
			<a id="firstPage" href="${pageContext.request.contextPath }/activiti/queryUserTask.action?currentPage=${pageAudit.firstPage }">首页</a>&nbsp;
			<a id="prePage" href="${pageContext.request.contextPath }/activiti/queryUserTask.action?currentPage=${pageAudit.prePage }">上一页</a>&nbsp;
			<a id="nextPage" href = "${pageContext.request.contextPath }/activiti/queryUserTask.action?currentPage=${pageAudit.nextPage }">下一页</a>&nbsp;
			<a id="lastPage" href="${pageContext.request.contextPath }/activiti/queryUserTask.action?currentPage=${pageAudit.totalPage }">末页</a>&nbsp;
			第${pageAudit.currentPage }页/共${pageAudit.totalPage }页&nbsp;一共有${pageAudit.totalCount }条数据
		</div>
		
		<div id="unpassReason" style="display:none;">
			 <textarea id="audit_suggest" placeholder="请填写不批准原因（不超过100字,必填...）" autofocus="autofocus" rows="5" cols="65"></textarea>
			 <button id="submitReject">确定</button>
			 <button id="cancel" style="margin-left:39px;background:#2c730b;">取消</button>
		</div>
	</div>
	
</body>
<script type="text/javascript" src="http://localhost:8080/gd_stu_dev/front/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		//获取路径 | | |
        var pathName=window.document.location.pathname;
		//截取，得到项目名称
        var projectName=pathName.substring(0 ,pathName.substr(1).indexOf('/')+1);
		//查看已审核报销单
		/* $("#completedAudit").click(function(){
			var url = projectName+"/activiti/queryCompletedAuditTask.action";
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
		}); */
		
		//审核通过
		$(".pass").click(function(){
			var url = projectName+"/activiti/completeAudit.action";
			var tid = $(this).find("input").eq(0).val();
			var state = $(this).find("input").eq(1).val();
 			$.ajax({
				type:'post',
				url:url,
				data:{
					"tid":tid,
					"state":state
				},
				success:function(data){
					alert("已提交审核！");
					$("#auditPage").html(data);
				},
				error:function(){
					alert("审核出错！");
				}
				
			}); 			
		});
		
		//审核不通过
		$(".unpass").click(function(){
			var procInstId = $(this).parent().siblings(".procInstId").find("input").val();
			$("#unpassReason").show();
			$("#submitReject").click(function(){
				if($("#audit_suggest").val()=="" || $("#audit_suggest").val()==null){
					alert("不批准原因必填！");
				}else{
				var url = projectName+"/receipt/rejectReceipt.action";
					 $.ajax({
						type:'post',
						url:url,
						data:{
							"procInstId":procInstId,
							"audit_suggest":$("#audit_suggest").val()
						},
						success:function(){
							alert("已提交审核！");
							$("#unpassReason").hide();
							$("#auditPage").html(data);
						},
						error:function(){
							alert("审核出错！");
						}
					}); 
				}
			});
			$("#cancel").click(function(){
				$("#unpassReason").hide();
			});
		});
		
		
		//查看报销单
		/* $(".look").click(function(){
			var procInstId = $(this).parent().siblings(".procInstId").find("input").val();
			var url = projectName+"/receipt/lookOneReceipt.action";
			$.ajax({
				type:'post',
				url:url,
				data:{
					"procInstId":procInstId
				},
				success:function(data){
					$("#oneReceiptInfo").html(data);
					$("#auditPage").hide();
					$("#ReceiptInfoBox").show();
					
				},
				error:function(){
					alert("响应失败！");
					
				}
			});
			//返回
			$("#ReceiptInfoBox button").click(function(){
				
				$("#ReceiptInfoBox").hide();
				$("#auditPage").show();
			});
		}); */
		
	})
</script>

</html>