<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">
        var rootPath = "<%=request.getContextPath()%>";
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
	#paywrapper{
		width:735px;
		height:345px;
		background:#439cd826;
		border:1px solid #ddd;
		margin:55px auto;
		color:#da1a1a;
	}
	#wechatCode{
		float:left;
		margin-right:160px;
	}
	.tips{
		margin:27px;
		width:360px;
	}
</style>
</head>
<body>
<div id="paywrapper">
	<div id="codeBox">
		<div id="wechatCode"><img alt="微信支付码" width="200" src=""/></div>
		<div id="apayCode"><img alt="微信支付码" width="200" src=""/></div>
	</div>
	<div class="tips">
		欢迎加入xx学院xxx社团，入会需缴xx元会费,请扫上方微信或支付宝二维码进行缴纳。<br><br>
		<span>交费时请备注：学号+姓名+班级+我要加入</span><br>
	</div>
</div>
</body>

<script type="text/javascript" src="../jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url:rootPath+'/fee/queryCode.action',
			type:'post',
			data:{},
			dataType:'JSON',
			success:function(response){
				$("#wechatCode img").attr("src","/Cache/wechatcode/"+response.wechatCode);
				$("#apayCode img").attr("src","/Cache/apaycode/"+response.apayCode);
			},
			error:function(){
				
			}
		});
		
	});

</script>
</html>