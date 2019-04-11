<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
	var rootPath = "<%=request.getContextPath()%>";
</script>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/receipt/receipt.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/front/receipt/css/load.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/calender/laydate.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/front/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/front/receipt/js/load-min.js"></script>
</head>
<body>
<div id="ReceiptInfoBox" style="display:none;">
		<div id="oneReceiptInfo"></div>
</div>
<div id="receiptwrapper" style="margin-left:180px;">
	<div class="title">
		<p>
		最新消息
		</p>
		<span>以下是你加入${clubName }以来的报销记录</span>
	</div>
	<div class="recordbox">
		<c:if test="${not empty PageOperLog }">
		<c:forEach items="${PageOperLog.data }" var="logItem"> 	
			<c:if test="${logItem.oper_type==0}">
				<div class="onerecord">
					<input type="hidden" value="${logItem.proc_inst_id }"/>
					<span>【提交通知】</span>
					${logItem.receipt_type }报销单已提交！提交时间：<fmt:formatDate value="${logItem.oper_time }" pattern="yyyy年MM月dd号 HH:mm:ss"/>
					<div class="operbox">
						<a href="${pageContext.request.contextPath }/receipt/lookOneReceipt.action?procInstId=${logItem.proc_inst_id }&backPage=1">查看</a>
						<c:if test="${logItem.receipt_state==0 }">
						<a class="revise" href="${pageContext.request.contextPath }/receipt/reviseOneReceipt.action?procInstId=${logItem.proc_inst_id }">修改</a>
						</c:if>
						<c:if test="${logItem.receipt_state>=0 && logItem.receipt_state!=4 }"><a class="revoke">撤销</a></c:if>
					</div>
				</div>
			</c:if>
			
			<c:if test="${logItem.oper_type==4 }">
				<div class="onerecord">
					<input type="hidden" value="${logItem.proc_inst_id }"/>
					<span>【修改通知】</span>
					${logItem.receipt_type }报销单已修改！修改时间：<fmt:formatDate value="${logItem.oper_time }" pattern="yyyy年MM月dd号 HH:mm:ss"/>
					<div class="operbox">
						<a href="${pageContext.request.contextPath }/receipt/lookOneReceipt.action?procInstId=${logItem.proc_inst_id }&backPage=1">查看</a>
						<c:if test="${logItem.receipt_state==0 }">
						<a class="revise" href="${pageContext.request.contextPath }/receipt/reviseOneReceipt.action?procInstId=${logItem.proc_inst_id }">修改</a>
						</c:if>
						<c:if test="${logItem.receipt_state>=0 && logItem.receipt_state!=4 }"><a class="revoke">撤销</a></c:if>
					</div>
				</div>
			</c:if>
			
			<c:if test="${logItem.oper_type==5 }">
				<div class="onerecord">
				<input type="hidden" value="${logItem.proc_inst_id }"/>
					<span>【撤销通知】</span>
					${logItem.receipt_type }报销单已撤销！撤销时间：<fmt:formatDate value="${logItem.oper_time }" pattern="yyyy年MM月dd号 HH:mm:ss"/>
					<div class="operbox">
						<a href="${pageContext.request.contextPath }/receipt/lookOneReceipt.action?procInstId=${logItem.proc_inst_id }&backPage=1">查看</a>
					</div>
				</div>
			</c:if>
			
			<c:if test="${logItem.oper_type==1 }">
				<div class="onerecord">
				<input type="hidden" value="${logItem.proc_inst_id }"/>
					<span>【审批通知】</span>
					${logItem.receipt_type }报销单已通过一级审批！审批时间：<fmt:formatDate value="${logItem.oper_time }" pattern="yyyy年MM月dd号 HH:mm:ss"/>
					<div class="operbox">
						<a href="${pageContext.request.contextPath }/receipt/lookOneReceipt.action?procInstId=${logItem.proc_inst_id }&backPage=1">查看</a>
					</div>
				</div>
			</c:if>
			
			<c:if test="${logItem.oper_type==-1 }">
				<div class="onerecord">
				<input type="hidden" value="${logItem.proc_inst_id }"/>
					<span>【审批通知】</span>
					${logItem.receipt_type }报销单一级审批未通过！审批时间：<fmt:formatDate value="${logItem.oper_time }" pattern="yyyy年MM月dd号 HH:mm:ss"/>
					<div class="operbox">
						<a href="${pageContext.request.contextPath }/receipt/lookOneReceipt.action?procInstId=${logItem.proc_inst_id }&backPage=1">查看</a>
					</div>
				</div>
			</c:if>
			
			<c:if test="${logItem.oper_type==2 }">
				<div class="onerecord">
				<input type="hidden" value="${logItem.proc_inst_id }"/>
					<span>【审批通知】</span>
					${logItem.receipt_type }报销单已通过二级审批！审批时间：<fmt:formatDate value="${logItem.oper_time }" pattern="yyyy年MM月dd号 HH:mm:ss"/>
					<div class="operbox">
						<a href="${pageContext.request.contextPath }/receipt/lookOneReceipt.action?procInstId=${logItem.proc_inst_id }&backPage=1">查看</a>
					</div>
				</div>
			</c:if>
			
			<c:if test="${logItem.oper_type==-2 }">
				<div class="onerecord">
				<input type="hidden" value="${logItem.proc_inst_id }"/>
					<span>【审批通知】</span>
					${logItem.receipt_type }报销单二级审批未通过！审批时间：<fmt:formatDate value="${logItem.oper_time }" pattern="yyyy年MM月dd号 HH:mm:ss"/>
					<div class="operbox">
						<a href="${pageContext.request.contextPath }/receipt/lookOneReceipt.action?procInstId=${logItem.proc_inst_id }&backPage=1">查看</a>
					</div>
				</div>
			</c:if>
			
			<c:if test="${logItem.oper_type==3 }">
				<div class="onerecord">
				<input type="hidden" value="${logItem.proc_inst_id }"/>
					<span>【审批通知】</span>
					${logItem.receipt_type }报销单已通过财务审批！审批时间：<fmt:formatDate value="${logItem.oper_time }" pattern="yyyy年MM月dd号 HH:mm:ss"/>
					<div class="operbox">
						<a href="${pageContext.request.contextPath }/receipt/lookOneReceipt.action?procInstId=${logItem.proc_inst_id }&backPage=1">查看</a>
					</div>
				</div>
			</c:if>
			
			<c:if test="${logItem.oper_type==-3 }">
				<div class="onerecord">
				<input type="hidden" value="${logItem.proc_inst_id }"/>
					<span>【审批通知】</span>
					${logItem.receipt_type }报销单最后审批未通过！审批时间：<fmt:formatDate value="${logItem.oper_time }" pattern="yyyy年MM月dd号 HH:mm:ss"/>
					<div class="operbox">
						<a href="${pageContext.request.contextPath }/receipt/lookOneReceipt.action?procInstId=${logItem.proc_inst_id }&backPage=1">查看</a>
					</div>
				</div>
			</c:if>
		</c:forEach>
		</c:if>
		<c:if test="${empty PageOperLog }">
			<p class="tips">暂无报销记录！</p>
		</c:if>
	<c:if test="${not empty sessionScope.rank && sessionScope.rank!=1 }">
	<div id="myAudit"><button>我的审核</button></div>
	</c:if>	
	<div id="receiptEntry"><button>我要报销</button></div>
	<div class="foot">
	<a id="firstPage" href="${pageContext.request.contextPath }/receipt/queryAllReceipt.action?currentPage=${PageOperLog.firstPage }">首页</a>&nbsp;
	<a id="prePage" href="${pageContext.request.contextPath }/receipt/queryAllReceipt.action?currentPage=${PageOperLog.prePage }">上一页</a>&nbsp;
	<a id="nextPage" href = "${pageContext.request.contextPath }/receipt/queryAllReceipt.action?currentPage=${PageOperLog.nextPage }">下一页</a>&nbsp;
	<a id="lastPage" href="${pageContext.request.contextPath }/receipt/queryAllReceipt.action?currentPage=${PageOperLog.totalPage }">末页</a>&nbsp;
	第${PageOperLog.currentPage }页/共${PageOperLog.totalPage }页&nbsp;一共有${PageOperLog.totalCount }条数据
	</div>
	</div>
</div>
	<div id="receiptform" style="display:none;">
	<div id="receiptReason" style="margin-bottom:12px;">
		<span>报销原因：</span><input id="receiptReasonVal" type="text" placeholder="如：超级数学声" style="width:274px;"/><span style="color:#f00;font-size:12px;">（请填写活动名称或社团工作等限20字以内）</span>
	</div>
	<div id="receiptItems">
	<p>报销条项：</p>
		<table border="1" align="center" width="80%" cellspacing="0" id="receiptTab">
			<tr>
				<th style="width:20%;">时间</th>
				<th style="width:26%;">原因</th>
				<th>内容</th>
				<th style="width:15%;">金额</th> 
			</tr>
			<tr class="receiptCol">
				<td>
					<div class="calender"><input class="laydate-icon" id="spendTime" style="width:55%;height:24px;"></div>
				</td>
				<td><input type="text" placeholder="如：购买物资"/></td>
				<td><input type="text" placeholder="如：气球，彩带"/></td>
				<td><input type="text" class="oddAmount"/></td>
			</tr>
		</table>
		<button id="addCol">添加一行</button>
		<div id="totalbox">总计：<span id="total"></span><span style="display:inline-block;margin-left:82px;">元</span></div>
	</div>
	<div class="backOrsub">
		<button id="submitBtn">提交</button>
		<button id="backBtn">返回</button>
	</div>
</div>
<div id="submitResult" style="display:none;">
		<p class="resultTitle">提交成功！</p>
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
		<button id="finishBtn">返回</button>
</div>
<div id="seeMyAudit"></div>
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
    window.onload = function () {
            //注意：使用前必须确保student表有 学生ID：123456，学生名：admin，密码：000000的学生管理员信息
            var adminObj = new anychat.AdminObj();
            adminObj.initAdminToken();
            talkMediator=adminObj.getTalkMediator();
        }
	$(function(){
		 //获取路径 | | |
        var pathName=window.document.location.pathname;
		//截取，得到项目名称
        var projectName=pathName.substring(0 ,pathName.substr(1).indexOf('/')+1);	
		
		
        var talkMediator=null;
        /*window.onload = function () {
            //注意：使用前必须确保student表有 学生ID：123456，学生名：admin，密码：000000的学生管理员信息
            var adminObj = new anychat.AdminObj();
            adminObj.initAdminToken();
            talkMediator=adminObj.getTalkMediator();
        }*/

        //注意：使用前必须确保student表有 学生ID：123456，学生名：admin，密码：000000的学生管理员信息
        var adminObj = new anychat.AdminObj();
        adminObj.initAdminToken();
        talkMediator=adminObj.getTalkMediator();

        function sendNotifyMessage(content,toType,toTypeId) {
            //content:发送的内容
            //toType：发送类型：1用户 2群组
            //toTypeId：接收的用户
            debugger;
            console.log("sendNotifyMessage 发送消息");
            if(talkMediator!=null && talkMediator!=undefined){
                loginChatProxy=talkMediator.onLogChatProxy();
                if(loginChatProxy!=null && loginChatProxy!=undefined){
                    loginChatProxy.sendMessage(content, 1, toTypeId);
                    console.log("sendNotifyMessage 发送过去了");
                }else{
                    console.error("loginChatProxy 不存在");
				}
            }else{
                console.error("talkMediator 不存在");
			}
        }
		
		$("#receiptEntry").click(function(){
			$("#receiptform").show();
			$("#receiptwrapper").hide();
			//openCal();
			$("#laydate_box").hide();
		});
		
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
		
		//未提交表单返回报销首页
		$("#backBtn").click(function(){
			$("#receiptform").hide();
			$("#receiptwrapper").show();
		});
		
		//添加一行
		$("#addCol").click(function(){
			var op=document.getElementById("receiptCol");
			var odiv=document.getElementById("receiptTab");
			var opnew=$(".receiptCol").clone(true);//当为true时，连子节点也复制
			$("#receiptTab").append(opnew);
			var top = $("#totalbox").css('top');
			topVal = parseInt(top.replace(/[^0-9]/ig,""));
			top = topVal+40+"px";
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
		
		//提交
		/* $("#submitBtn").click(function(){
			$("#receiptform").hide();
			$("#submitResult").show();
		}); */
		
		//提交成功返回报销首页
		$("#finishBtn").click(function(){
			/* $("#receiptform").hide();
			$("#submitResult").hide();
			$("#receiptwrapper").show(); */
			window.location.href = rootPath+"/receipt/queryAllReceipt.action";
		})
		
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
			$(this).css("background","#666765");
			$(this).attr("disabled","disabled");
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
				if(receiptItem.spendTime=="" || receiptItem.reason=="" || receiptItem.detail=="" ||receiptItem.cost==""){
					alert("请填写表格内容！");
					flag = 0;
				}
				receiptObj.push(receiptItem);
			});
			var jsonObj = JSON.stringify(receiptObj);
			console.log(jsonObj);
						
			var url=projectName+"/process/startprocess.action?pdId=myProcess:16:82504";
			//var url = projectName+"/seeProcessdiagram.action?piId="+27501;
			var stuNum = "<%=session.getAttribute("userId")%>";
			if(flag==1){
				$.mask_fullscreen();
				$.ajax({
					type:'post',
					url:url,
					dataType:'JSON',
					data:{
						"amount":$("#total").text(),
						"reason":$("#receiptReasonVal").val(),
						"receiptObj":jsonObj
					},
					success:function(data){
					    debugger;
						console.log(data.piId);
						document.getElementById("diagram").src=projectName+"/seeProcessdiagram.action?piId="+data.piId;				
						$.mask_close_all();
						$("#receiptform").hide();
						$("#submitResult").show();
						$("#amount").text($("#total").text()+"元"); 
						$("#currentAudit").text(data.oneAutName);
						sendNotifyMessage("您有一笔报销单已成功提交，<br>报销金额："+$("#total").text()+"元<br>请耐心等待一级审批...",1,stuNum);
					},
					error:function(data){
						$.mask_close_all();
						alert("响应失败！");
					}
				});
			}
		});
		
		//查看我的审核
		$("#myAudit").click(function(){
			/* $.mask_fullscreen(); */
			var url = projectName+"/activiti/queryUserTask.action";
			$.ajax({
				type:'post',
				url:url,
				data:{
					
				},
				success:function(data){
					/* $.mask_close_all(); */
					$("#receiptwrapper").hide();
					$("#seeMyAudit").html(data);
				},
				error:function(data){
					/* $.mask_close_all(); */
					alert("请求出错！");
				}
			});
		})
		
		//查看每一条报销信息
		/* $(".look").click(function(){
			var procInstId = $(this).parent().siblings("input").val();
			var url = projectName+"/receipt/lookOneReceipt.action";
			$.ajax({
				type:'post',
				url:url,
				data:{
					"procInstId":procInstId
				},
				success:function(data){
					$("#oneReceiptInfo").html(data);
					$("#receiptwrapper").hide();
					$("#ReceiptInfoBox").show();
				},
				error:function(){
					alert("响应失败！");
				}
			});
			//返回
			$("#ReceiptInfoBox button").click(function(){
				$("#ReceiptInfoBox").hide();
				$("#receiptwrapper").show();
			});
		}); */
		
		//修改报销信息
/* 		$(".revise").click(function(){
			var procInstId = $(this).parent().siblings("input").val();
			var url = projectName+"/receipt/reviseOneReceipt.action";
			$.ajax({
				type:'post',
				url:url,
				data:{
					"procInstId":procInstId
				},
				success:function(data){
					$("#oneReceiptInfo").html(data);
					$("#ReceiptInfoBox").show();
					$("#receiptwrapper").hide();
				},
				error:function(){
					alert("响应失败！");
				}
			});
			//返回
			$("#ReceiptInfoBox button").click(function(){
				$("#ReceiptInfoBox").hide();
				$("#receiptwrapper").show();
			});
		}) */
		
		//撤销报销信息
		$(".revoke").click(function(){
			var procInstId = $(this).parent().siblings("input").val();
			var url = projectName+"/receipt/revokeReceipt.action";
			$.ajax({
				type:'post',
				url:url,
				data:{
					"procInstId":procInstId
				},
				success:function(data){
					alert("撤销成功！");
					window.location.href = rootPath+"/receipt/queryAllReceipt.action";
					sendNotifyMessage("您已成功撤销一笔报销单",1,"123");
				},
				error:function(){
					alert("撤销失败！");
				}
			});
		});
		
		
		
	});
</script>
</html>