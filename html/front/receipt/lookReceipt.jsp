<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/front/receipt/css/demo.css">
<style type="text/css">
	#ReceiptItem{
		color:#0c0c0c;
		margin-left:200px;
		margin-top:16px;
		font-size:13px;
	}
	span,p,th{
		font-size:16px;
		font-weight:700;
		color:#000;
	}
	#receiptmanInfo{
		font-size:13px;
		margin-bottom:20px;
	}
	#receiptmanInfo span{
		margin-right:8px;
		margin-left:159px;
	}
	#receiptDetail tbody{
		font-size:13px;
	}
	.receiptCol{
		height:30px;
	}
	.receiptCol{
		text-align:center;
	}
	#receiptTab{
		margin-left:122px;
	}
	#totalbox{
		width:200px;
		height:28px;
		margin-left:759px;
		margin-top:31px;
	}
	#receiptProc span{
		margin-left:48px;
	}
	.proc span{
		font-size:15px;
	}
	.backButton{
		width:58px;
		height:36px;
		display:inline-block;
		background:#2b7b05;
		line-height:36px;
		text-align:center;
		color:#f1f1f1;
		/* margin:17px 320px; */
		border:none;
		border-radius:5px;
		font-size:14px;
		text-decoration:none;
		position:absolute;
		bottom:8px;
		right:695px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="ReceiptItem">
		<div id = "receiptmanInfo">
			<span>学号:</span>${oneReceiptMap.stuNum }
			<span>姓名：</span>${oneReceiptMap.stuName }
			<span>所在社团：</span>${oneReceiptMap.clubName }
		</div>
	
	<div id="receiptReason">
		<span style="font-weight:700;font-size:17px;">报销原因：</span>${oneReceiptMap.reason }经费报销
	</div>
	<div id="receiptDetail">
		<p style="font-weight:700;font-size:17px;">报销明细</p>
		<table id="DetailTab">
			<thead>
				<tr>
					<th width="150px">时间</th>
					<th width="190px">用途</th>
					<th width="260px">内容</th>
					<th width="100px">金额</th> 
				</tr>
			</thead>
		<tbody>
			<c:forEach items="${detailList }" var="detailItem">
				<tr class="receiptCol">
					<td width="150px"><fmt:formatDate value="${detailItem.spend_time }" pattern="yyyy年MM月dd号"/></td>
					<td width="190px">${detailItem.reason }</td>
					<td width="339px">${detailItem.detail }</td>
					<td width="100px"><fmt:formatNumber value="${detailItem.cost }" type="number"/></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<div id="totalbox">总金额：<span>${oneReceiptMap.amount }元</span></div>
	</div>
	<div id="receiptProc">
		<p>报销进度</p>
		<c:if test="${oneReceiptMap.state<3 && oneReceiptMap.state>=0}">
		<div class="proc"><span>当前状态：</span>待审批</div>
		</c:if>
		<c:if test="${oneReceiptMap.state==3 }">
		<div class="proc"><span>当前状态：</span>已完成</div>
		</c:if>
		<c:if test="${oneReceiptMap.state==4 }">
		<div class="proc"><span>当前状态：</span>已撤销</div>
		</c:if>
		<c:if test="${oneReceiptMap.state<0 }">
		<div class="proc"><span>当前状态：</span>未批准</div>
		<div class="proc"><span>未通过原因：</span>${oneReceiptMap.audit_suggest }</div>
		</c:if>
		<c:if test="${not empty oneReceiptMap.next_autitor }">
		<div class="proc"><span>当前审批人：</span>${oneReceiptMap.next_autitor }</div>
		</c:if>
		<div class="proc"><span>第一审批人：</span>${oneReceiptMap.one_autitor }</div>
		<div class="proc"><span>第二审批人：</span>${oneReceiptMap.second_autitor }</div>
		<div class="proc"><span>财务审批：</span>${oneReceiptMap.third_autitor }</div>
	</div>
	<div id="receiptProImg" style="height:200px;position:relative;">
		<p>流程图：</p>
		<img id="diagram" style="" src="${pageContext.request.contextPath }/seeProcessdiagram.action?piId=${oneReceiptMap.procInstId}"/>
	</div>
	<c:if test="${backPageId==1 }">
		<a class="backButton" href="${pageContext.request.contextPath }/receipt/queryAllReceipt.action">返回</a>
	</c:if>
	<c:if test="${backPageId==2 }">
		<a class="backButton" href="${pageContext.request.contextPath }/activiti/queryUserTask.action">返回</a>
	</c:if>
	<div class="col-md-3" style="position:absolute;bottom:8px;right:305px;">
		<a class="btn btn-default jquery-word-export" href="javascript:void(0)" style="color: #035a75;">
			<span class="word-icon">W</span>
			导出为.doc文档
		</a>
	</div>
	</div>
</body>

<script type="text/javascript" src="<%=request.getContextPath() %>/front/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/front/receipt/js/FileSaver.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/front/receipt/js/jquery.wordexport.js"></script>
<script>
$(function(){
	function fake_click(obj) {
	    var ev = document.createEvent("MouseEvents");
	    ev.initMouseEvent(
	        "click", true, false, window, 0, 0, 0, 0, 0
	        , false, false, false, false, 0, null
	        );
	    obj.dispatchEvent(ev);
	}
	 
	function export_raw(name, data) {
	    var urlObject = window.URL || window.webkitURL || window;
	 
	    var export_blob = new Blob([data]);
	 
	    var save_link = document.createElementNS("http://www.w3.org/1999/xhtml", "a")
	    save_link.href = urlObject.createObjectURL(export_blob);
	    save_link.download = name;
	    fake_click(save_link);
	}
	 
	$("a.jquery-word-export").click(function(event) {
		$(".backButton").hide();
		$("a.jquery-word-export").hide();
		$("#ReceiptItem").wordExport();
		alert(11);
	    $(".backButton").show();
		$("a.jquery-word-export").show();
	});
});
	
</script>
</html>