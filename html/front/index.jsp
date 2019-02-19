<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>学生社团管理系统</title>
    <!-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8"> -->
    <!-- <LINK href="././qtimages/style.css" type=text/css rel=stylesheet> -->
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
				$(".out",	this).stop().animate({'top':	'40px'},	300); // move down - hide
				$(".over",	this).stop().animate({'top':	'0px'},		300); // move down - show

			}, function() {
				$(".out",	this).stop().animate({'top':	'0px'},		300); // move up - show
				$(".over",	this).stop().animate({'top':	'-40px'},	300); // move up - hide
			});

		});

	</script>
    <style type="text/css">
        <!--
        .STYLE1 {
            color: #FFFFFF;
            font-weight: bold;
        }

		.STYLE3 {
			color: #086BD6;
			font-weight: bold;
		}

		.wrapper {
			min-width: 1200px;
		}

		.wrapper {
			background-size: 100% 100%;
			height: 100%;
			background-color: hsla(0, 0%, 10%, 1.00);
		}

		.wrapper {
			font-size: 16px;
		}

		.head {
			min-width: 1200px;
			position: fixed;
			z-index: 100;
			left: 0;
			right: 0;
			background: rgba(0, 0, 0, 0.5);
		}

		.head-main {
			width: 90%;
			margin: 8px auto;
		}

		.logo {
			float: left;
			width: 95px;
			height: 60px;
			position: relative;
			top: 5px;
		}

		.logo img {
			width: 100%;
			height: 100%;
		}

		.menuDiv {
			width: 750px;
			margin: 0 auto;
			position: relative;
			top: 10px;
			left: -55px;
		}

		.menu {
			width: 100%;
			display: flex;
			display: -webkit-box;
			display: -webkit-flex;
		}

		.menu > li {
			-webkit-box-flex: 1;
			-webkit-flex: 1;
			flex: 1;
			padding: 10px 0;
		}

		.menu > li > a {
			text-align: center;
			position: relative;
			color: #fff;
			display: block;
			justify-content: center;
			align-items: center;
			border-right: 1px solid #fff;
		}

		.menu li a:hover {
			color: #026fe8;
		}

		.menu > li:last-child a {
			border-right: none;
		}

		.menu li a.active {
			color: #026fe8;
		}

		.linkTel {
			float: right;
			color: #fff;
			position: relative;
			top: -20px;
		}

		ul, li, img, p {
			margin: 0;
			padding: 0;
			list-style: none;
			border: none;
		}

		a {
			color: #000;
			text-decoration: none;
		}

		#college {
			margin-left: 150px;
		}
        -->
    </style>
</head>
<body class = "wrapper">
<div class="head">
          <div class="head-main clearfix">
            <div class="logo">
              <img src="../css/images/logo.png" alt=""/>
            </div>
            <div class="menuDiv">
              <ul class="menu clearfix">
                <li>
                  <a href="" class="active">
                  首页
                  </a>
                </li>
                <li>
                  <a href="">
                    注册
                  </a>
                </li>
                <li>
                  <a href="">
                    关于微梦
                  </a>
                </li>
              </ul>
            </div>
            <div class="linkTel">
              联系电话 : 203-88257936
            </div>
          </div>
        </div>
<%-- <div id="college"><%@ include file="./panel/qttop.jsp"%></div> --%>
	<div id="topTitle">${sessionScope.collegeName }</div>
	<div id="menu2" class="topmenu">
		<div class="blank" style="position:absolute;left:0;"></div>
		<ul>
			<li><a id ="news">首页新闻</a></li>
			<li><a id="chat">畅聊空间</a></li>
			<li><a id="pay">交会费</a></li>
			<li><a id="receipt">活动报销</a></li>
			<li><a href="./login.jsp">后台</a></li>
		</ul>
		<div id="login">登录</div>
		<c:if test="${not empty sessionScope.userName }">
		<div class="blank" style="position:absolute;right:0">欢迎您，<span id="userName">${sessionScope.userName }</span></div>
		</c:if>
	<div class="cls"></div>
	</div>
<div class="loginbox" id="loginbox" style="display:none;">
	<form action="" id="loginform">
		<div class="row" style="margin-top:57px;">
			<span>学号：</span>
			<input type="text" id="username" name="userId"/>
		</div>
		<div class="row">
			<span>密码：</span>
			<input type="password" id="password" name="password"/>
		</div>
		<div class="row">
			<span>选择社团：</span>
			<input type="text" id="choseClubName" name="clubName" value="请选择" class="ui-down"/>
			<input type="hidden" id="choseClubId" name="clubId" class="ui-down"/>
			<ul id="clublist" style="display:none;">
				<c:forEach items="${sessionScope.clublist }" var="club">
				<li id="${club.id }">${club.name }</li>
				</c:forEach>
<!-- 				<option>团委学生会</option>
				<option>青年志愿者协会</option>
				<option>红十字会</option> -->
			</ul>
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

<iframe width="100%" height="100%" frameborder="0" src="" class="" name="content" id="content"
scrolling="no" style="position:fixed;top:115px;">

</iframe>
   	<script>
	$(function(){
		//获取路径 | | |
        var pathName=window.document.location.pathname;
		//截取，得到项目名称
        var projectName=pathName.substring(0 ,pathName.substr(1).indexOf('/')+1);

		$("#login").click(function(){
			$("#loginbox").slideToggle("slow");
		});


		$("#choseClubName").click(function(){
			if($(this).hasClass("ui-down")){
				$(this).toggleClass("ui-up");
			}else{
				$(this).toggleClass("ui-down");
			}
			$("#clublist").toggle();
		});

		$("#clublist li").click(function(){
			$("#choseClubName").val($(this).text());
			$("#clublist").toggle();
			$("#choseClubName").toggleClass("ui-up");
			$("#choseClubId").val($(this).attr("id"));
		});

		$("#loginsubmit").click(function(){
			var loginUrl = projectName+"/login/LoginAction.action";
			$("#loginform").attr("action", loginUrl);
		});

		var iframe = document.getElementById("content");
		var newsid = $(".topmenu a").eq(0).attr("id");
		iframe.src = "./"+newsid+"/"+newsid+".jsp";
		//获取对应选项的标签名称
		$(".topmenu a").click(function(){
			var navid = $(this).attr("id");
			if(navid=="receipt"){
				var sessionUser = $("#userName").text();
				if(sessionUser==""){
					alert("请先登录！");
					return;
				}else{
					iframe.src="./"+navid+"/"+navid+".jsp";
				}
			}
			if(navid=="chat"){
                iframe.src="./"+navid+"/"+navid+".jsp?token=c4926be8b8bd40b1b84ec20c8121fda9";
            }
			
		});

	});


	</script>
</body>
</html>