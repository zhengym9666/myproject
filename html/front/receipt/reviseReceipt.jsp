<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/gd_stu_dev/css/receipt/receipt.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/front/receipt/css/load.css">
<script type="text/javascript" src="http://localhost:8080/gd_stu_dev/js/calender/laydate.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/front/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/front/receipt/js/load-min.js"></script>
</head>
<body>
	<div id="receiptform">
	<input type="hidden" value="${procInstId }" id="procInstId"/>
	<div id="receiptReason" style="margin-bottom:12px;">
		<span>报销原因：</span><input id="receiptReasonVal" type="text" style="width:274px;background:#d2d1d1;border:none;" readonly="readonly" value="${oneReceiptInfo.reason }"/>
	</div>
	<div id="receiptItems">
	<p>报销条项：</p>
		<table border="1" align="center" width="80%" id="receiptTab"> 
			<tr >
				<th style="width:20%;">时间</th>
				<th style="width:26%;">原因</th>
				<th>内容</th>
				<th style="width:15%;">金额</th> 
			</tr>
			<c:forEach items="${detailList }" var="detailItem">
				<tr class="receiptCol">
					<td>
						<div class="calender"><input class="laydate-icon" id="spendTime" value='<fmt:formatDate value="${detailItem.spend_time }" pattern='yyyy-MM-dd'/>' style="width:55%;height:24px;"></div>
					</td>
					<td><input type="text" value="${detailItem.reason }"/></td>
					<td><input type="text" value="${detailItem.detail }"/></td>
					<td><input type="text" value="${detailItem.cost }" class="oddAmount"/></td>
					<td style="display:none;"><input type="text" value="${detailItem.receipt_item_id }" class="receiptItemId"/></td>
				</tr>
			</c:forEach>
		</table>
		<button id="addCol">添加一行</button>
		<div id="totalbox">总计：<span id="total">${oneReceiptInfo.amount }</span><span style="display:inline-block;">元</span></div>
		
	</div>
		<div class="backOrsub">
		<button id="submitBtn">提交</button>
		<a id="backToHomePage" href="${pageContext.request.contextPath }/receipt/queryAllReceipt.action" style="margin-left:74px;">返回</a>
	</div>	
	</div>
	
	<div id="submitResult" style="display:none;margin-left:390px;">
		<p class="resultTitle">修改成功！</p>
		<div>报销金额：<span id="amount"></span>当前审批人：<span id="currentAudit"></span></div>
		<!-- <div class="auditFlow">
			<p>审批流程 ：</p>
			<div>第一审批人：<span id="firstAudit">狗蛋</span></div>
			<div>第二审批人：<span id="secAudit">狗娃</span></div>
			<div><span id="finalAudit">财务审核</span></div>
		</div> -->
		<p class="auditFlow">审批流程如下：</p>
		<div style="position:absolute;">
			<img id="diagram"/>
		</div>
		<a id="backToHomePage" href="${pageContext.request.contextPath }/receipt/queryAllReceipt.action" style="margin-left:200px;margin-top:118px;">返回</a>
		
	</div>
</body>
<!--juggle库 small require-->
<script src="<%=request.getContextPath()%>/stuchat/js/lib/juggle-help.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/stuchat/js/lib//juggle-event.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/stuchat/js/lib//juggle-all.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/stuchat/js/lib//juggle-http.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/stuchat/js/lib/juggle-mv.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/stuchat/js/lib/juggle-websocket.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/stuchat/js/anychat/dist/chatUtils.js" type="text/javascript" charset="UTF-8"></script>
<script type="text/javascript">
	$(function(){
		
		 //获取路径 | | |
        var pathName=window.document.location.pathname;
		//截取，得到项目名称
        var projectName=pathName.substring(0 ,pathName.substr(1).indexOf('/')+1);	
		
        var adminObj = new anychat.AdminObj;
        adminObj.initAdminToken();
        talkMediator=adminObj.getTalkMediator();
		
        function sendNotifyMessage(content,toType,toTypeId) {
        	var adminObj = new anychat.AdminObj;
            adminObj.initAdminToken();
            talkMediator=adminObj.getTalkMediator();
            //content:发送的内容
            //toType：发送类型：1用户 2群组
            //toTypeId：接收的用户
            debugger;
            if(talkMediator!=null && talkMediator!=undefined){
                loginChatProxy=talkMediator.onLogChatProxy();
                if(loginChatProxy!=null && loginChatProxy!=undefined){
                    loginChatProxy.sendMessage(content, 1, toTypeId);
                }
            }
        }
		
      //显示日历
		$(".calender").click(function(){
			var index = $(".calender").index(this);
			
			var index = $(".calender").index(this);
			var calInput = $(this).find("input");
			var id = "spendTime"+index;
			calInput.attr("id",id);
			
			laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
			laydate({elem: '#'+id});//绑定元素
			$("#laydate_box").show();	
		});
      
		//添加一行
		$("#addCol").click(function(){
			var length = $(".receiptCol").length;
			var opnew=$(".receiptCol").eq(length-1).clone(true);//当为true时，连子节点也复制
			$("#receiptTab").append(opnew);
			$(".receiptItemId").eq(length).val('');
			var top = $("#totalbox").css('top');
			topVal = parseInt(top.replace(/[^0-9]/ig,""));
			top = topVal+32+"px";
			$("#totalbox").css('top',top);
			var sum = 0;
			$(".oddAmount").each(function(i){
				var value = $(this).val();
				if(value==null || value==""){
					value = 0;
				}
				sum = Math.round((sum+parseFloat(value))*100)/100;
			});
			$("#total").text(sum);
		});
		
		//计算金额总数
		$(".oddAmount").on('input',function(){
			var sum = 0;
			$(".oddAmount").each(function(i){
				var value = $(this).val();
				if(value==null || value==""){
					value = 0;
				}
				sum = Math.round((sum+parseFloat(value))*100)/100;
			});
			$("#total").text(sum);
		});
		
		//提交
		$("#submitBtn").click(function(){
			var flag = 1;
			var receiptObj = [];
			/* var sessionuser = ${sessionScope.userId};
			alert(sessionuser); */
			var stuNum = "<%=session.getAttribute("userId")%>";
			if(($("#receiptReasonVal").val())==""){
				alert("请填写报销原因！");
				return;
			}
			$(".receiptCol").each(function(i){
				var receiptItem = {};
				receiptItem.spendTime = $(this).find("input").eq(0).val();
				receiptItem.reason = $(this).find("input").eq(1).val();
				receiptItem.detail = $(this).find("input").eq(2).val();
				receiptItem.cost = $(this).find("input").eq(3).val();
				receiptItem.receiptItemId = $(this).find("input").eq(4).val();
				if(receiptItem.spendTime=="" || receiptItem.reason=="" || receiptItem.detail=="" ||receiptItem.cost==""){
					alert("请填写表格内容！");
					flag = 0;
				}
				receiptObj.push(receiptItem);
				/* $(this).find("input").each(function(){
					receiptItem.spendTime=$(this).val();
				}); */
			});
			var jsonObj = JSON.stringify(receiptObj);
			console.log(jsonObj);
						
			var url=projectName+"/receipt/submitReviseReceipt.action";
			if(flag==1){
				$.mask_fullscreen();
				$.ajax({
					type:'post',
					url:url,
					data:{
						"procInstId":$("#procInstId").val(),
						"amount":$("#total").text(),
						"reason":$("#receiptReasonVal").val(),
						"receiptObj":jsonObj
					},
					success:function(data){
						var jsonData = eval("("+data+")");
						console.log(jsonData.piId);
						document.getElementById("diagram").src=projectName+"/seeProcessdiagram.action?piId="+jsonData.piId;				
						$.mask_close_all();
						$("#receiptform").hide();
						$("#submitResult").show();
						$("#amount").text(jsonData.amount+"元"); 
						$("#currentAudit").text(jsonData.oneAuditor);
						sendNotifyMessage("您已成功修改一笔报销单<br>报销金额："+jsonData.amount+"元<br>请耐心等待一级审批...",1,stuNum);
					},
					error:function(data){
						$.mask_close_asll();
						alert("响应失败！");
					}
				});
			}
		});
		
	});
</script>
</html>