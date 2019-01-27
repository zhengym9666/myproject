<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/receipt/receipt.css">
<script type="text/javascript" src="../../js/calender/laydate.js"></script>
</head>
<body>
<div id="receiptform" style="display:none;">
	<table border="1" align="center" width="80%" id="receiptTab">
		<tr >
			<th>时间</th>
			<th>报销原因</th>
			<th>报销内容</th>
			<th>金额</th> 
		</tr>
		<tbody>
		<tr id="receiptCol">
			<td>
				<div class="calender"><input class="laydate-icon" id="demo" style="width:55%;height:24px;"> </div>
			</td>
			<td><input type="text" /></td>
			<td><input type="text" /></td>
			<td><input type="text" class="oddAmount"/></td>
		</tr>
		</tbody>
	</table>
	<div id="totalbox">总计：<span id="total"></span><span style="display:inline-block;margin-left:82px;">元</span></div>
	<button id="addCol">添加一行</button>
	<div class="backOrsub">
		<button id="submitBtn">提交</button>
		<button id="backBtn">返回</button>
	</div>
</div>
<div id="submitResult" style="display:none;">
		<p class="resultTitle">提交成功！</p>
		<div>报销金额：<span id="amount"></span>当前审批人：<span id="currentAudit">李丽</span></div>
		<!-- <div class="auditFlow">
			<p>审批流程：</p>
			<div>第一审批人：<span id="firstAudit">狗蛋</span></div>
			<div>第二审批人：<span id="secAudit">狗娃</span></div>
			<div><span id="finalAudit">财务审核</span></div>
		</div> -->
		<p class="auditFlow">审批流程如下：</p>
		<center style="margin-top:-188px;">
			<img id="diagram"/>
		</center>
		<button id="finishBtn">返回</button>
</div>
<div id="receiptwrapper">
	<div class="title">
		<p>
		最新消息
		</p>
		<span>以下是你加入青年志愿者协会以来的报销记录</span>
	</div>
	<div class="recordbox">
		<div class="onerecord">
			<span>【提交通知】</span>
			全体大会活动报销类型：物资购买已提交！提交时间：2019年1月4号17:08:30
			<div class="operbox">
				<button>查看</button><button>修改</button><button>撤销</button>
			</div>
		</div>
		<div class="onerecord">
			<span>【修改通知】</span>
			全体大会活动报销类型：物资购买已修改！修改时间：2019年1月5号17:08:30
			<div class="operbox">
				<button>查看</button><button>修改</button><button>撤销</button>
			</div>
		</div>
		<div class="onerecord">
			<span>【审批通知】</span>
			全体大会活动报销类型：物资购买已通过一级审批！修改时间：2019年1月6号17:08:30
			<div class="operbox">
				<button>查看</button>
			</div>
		</div>
		<div class="onerecord">
			<span>【审批完成通知】</span>
			全体大会活动报销类型：物资购买已完成审批！修改时间：2019年1月7号17:08:30
			<div class="operbox">
				<button>查看</button>
			</div>
		</div>
	<div id="receiptEntry"><button>我要报销</button></div>
	<div class="foot">
	<a id="firstPage" href="${pageContext.request.contextPath }/news/queryNewsPage.action?currentPage=${pageNews.firstPage }&collegeId=${collegeId}&clubId=${clubId}">首页</a>&nbsp;
	<a id="prePage" href="${pageContext.request.contextPath }/news/queryNewsPage.action?currentPage=${pageNews.prePage }&collegeId=${collegeId}&clubId=${clubId}">上一页</a>&nbsp;
	<a id="nextPage" href = "${pageContext.request.contextPath }/news/queryNewsPage.action?currentPage=${pageNews.nextPage }&collegeId=${collegeId}&clubId=${clubId}">下一页</a>&nbsp;
	<a id="lastPage" href="${pageContext.request.contextPath }/news/queryNewsPage.action?currentPage=${pageNews.totalPage }&collegeId=${collegeId}&clubId=${clubId}">末页</a>&nbsp;
	第${pageNews.currentPage }页/共${pageNews.totalPage }页&nbsp;一共有${pageNews.totalCount }条数据
	</div>
	</div>
</div>

</body>

<script type="text/javascript" src="../jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#receiptEntry").click(function(){
			$("#receiptform").show();
			$("#receiptwrapper").hide();
			//openCal();
			$("#laydate_box").hide();
		});
		
		//显示日历
		$(".calender").click(function(){
			laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
			laydate({elem: '#demo'});//绑定元素
			$("#laydate_box").show();
			var index = $(".calender").index(this);
		    var top = $("#laydate_box").css('top');
		    if(index==0){
		    	$("#laydate_box").css('top',"76px");
		    }else{
			    topVal = parseInt(top.replace(/[^0-9]/ig,""));
			    top = topVal+34*index+"px";
			    $("#laydate_box").css('top',top);
		    }
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
			var opnew=$("#receiptCol").clone(true);//当为true时，连子节点也复制
			$("#receiptTab").append(opnew);
			var top = $("#totalbox").css('top');
			topVal = parseInt(top.replace(/[^0-9]/ig,""));
			top = topVal+32+"px";
			$("#totalbox").css('top',top);
		});
		
		//提交
		/* $("#submitBtn").click(function(){
			$("#receiptform").hide();
			$("#submitResult").show();
		}); */
		
		//提交成功返回报销首页
		$("#finishBtn").click(function(){
			$("#receiptform").hide();
			$("#submitResult").hide();
			$("#receiptwrapper").show();
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
			$("tbody tr").each(function(i){
				var receiptItem = {};
				receiptItem.spendTime = $(this).find("input").eq(0).val();
				receiptItem.reason = $(this).find("input").eq(1).val();
				receiptItem.detail = $(this).find("input").eq(2).val();
				receiptItem.cost = $(this).find("input").eq(3).val();
				if(receiptItem.spendTime=="" || receiptItem.reason=="" || receiptItem.detail=="" ||receiptItem.cost==""){
					alert("请填写完整后提交！");
					flag = 0;
				}
				receiptObj.push(receiptItem);
				/* $(this).find("input").each(function(){
					receiptItem.spendTime=$(this).val();
				}); */
			});
			var jsonObj = JSON.stringify(receiptObj);
			console.log(jsonObj);
						
			 //获取路径 | | |
	        var pathName=window.document.location.pathname;
			//截取，得到项目名称
	        var projectName=pathName.substring(0 ,pathName.substr(1).indexOf('/')+1);
			var url=projectName+"/process/startprocess.action?pdId=myProcess:14:17504";
			//var url = projectName+"/seeProcessdiagram.action?piId="+27501;
			if(flag==1){
				$.ajax({
					type:'post',
					url:url,
					data:{
						"receiptman_id":"1515200021",
						"receiptman_name":"郑永梅",
						"clubId":"1010100",
						"amount":$("#total").text(),
						"receiptObj":jsonObj
					},
					success:function(data){
						/* var jsonData = eval("("+data+")");
						console.log(jsonData.result);
						document.getElementById("diagram").src=projectName+"/seeProcessdiagram.action?piId="+jsonData.result;				
						$("#receiptform").hide();
						$("#submitResult").show();
						$("#amount").text($("#total").text()+"元"); */
					},
					error:function(data){
						alert("响应失败！");
					}
				});
			}
		});
	});


</script>
</html>