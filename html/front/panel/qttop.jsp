<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>翻转炫酷的导航栏</title>
<link href="../css/qttop/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../css/qttop/js/jquery.min.js"></script>
	<script language="javascript">
		$(document).ready(function() {
			/*	2nd example	*/
			
			$("#menu2 li a").wrapInner( '<span class="out"></span>' );
			
			$("#menu2 li a").each(function() {
				$( '<span class="over">' +  $(this).text() + '</span>' ).appendTo( this );
			});

			$("#menu2 li a").hover(function() {
				$(".out",	this).stop().animate({'top':	'40px'},	200); // move down - hide
				$(".over",	this).stop().animate({'top':	'0px'},		200); // move down - show

			}, function() {
				$(".out",	this).stop().animate({'top':	'0px'},		200); // move up - show
				$(".over",	this).stop().animate({'top':	'-40px'},	200); // move up - hide
			});

		});

	</script>
</head>

<body>
<div >
	<div id="topTitle">数院<span id="collegeId" style="display:none;">${collegeId }</span></div>
	
	
	<div id="menu2" class="topmenu">
		<div class="blank" style="position:absolute;left:0;"></div>
		<ul>
			<li><a id ="news">首页新闻</a></li>
			<li><a id="chat">畅聊空间</a></li>
			<li><a href="#">交会费</a></li>
			<li><a href="#">活动报销</a></li>
			<li class="sideline" style="left: 0px; width: 36px; overflow: hidden;"></li>
		</ul>
		<div id="login">登录</div>
		<div class="blank" style="position:absolute;right:0">欢迎您，郑永梅</div>
		<div class="loginbox" id="loginbox" style="display:none;">
			<form action="" id="loginform">
				<div class="row" style="margin-top:63px;">
					<span>学号：</span>
					<input type="text" id="username"/>
				</div>
				<div class="row">
					<span>密码：</span>
					<input type="password" id="password"/>
				</div>
				<div class="row">
					<span>选择社团：</span>
					<select id="clublist">
						<c:forEach items="${clublist }" var="club">
						<option>${club.name }</option>
						</c:forEach>
						<!-- <option>团委学生会</option>
						<option>青年志愿者协会</option>
						<option>红十字会</option> -->
					</select>
				</div>
				<div class="row">
					<span>验证码：</span>
					<input type="text" id="validate" style="width:60px;" />
					<img src="" alt=""/>
				</div>
				<div class="submitbtn">
					<input type="submit" id="loginsubmit" value="登录"/>
					<input type="reset" value="重置"/>
				</div>
			</form>
		
		</div>
	<div class="cls"></div>
	</div>
</div>

<iframe width="110%" height="100%" frameborder="0" src="./news/news.jsp" class="" name="content" id="content"
scrolling="no" style="position:fixed;top:115px;margin-left:-160px;">
                   	
</iframe>

</body>
<script>
/* $("a").on('click',function(){
	//获取路径 | | |
	var id = $(this).attr("id");
	var pathName=window.document.location.pathname;
	//截取，得到项目名称
	var projectName=pathName.substring(0 ,pathName.substr(1).indexOf('/')+1);
	var url=projectName+"/community/"+id+".action";
	var iframe = window.document.getElementById("content");
	iframe.src = url;
	/* $.ajax({
		type: "get",
		url: url,
		success: function (data) {
			
		//成功后 执行的方法
			//$("#dowebok").scrollTop(100);
			$("#content").html(data);
		}
		}); */
//}); 
$(function(){
	
});

$("#login").on('click',function(){
	$("#loginbox").slideToggle("slow");
});


</script>

</html>
