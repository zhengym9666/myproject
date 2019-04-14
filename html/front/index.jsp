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
	<script type="text/javascript">
        var rootPath = "<%=request.getContextPath()%>";
    </script>
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
    <style type="text/css">
        
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
			background-color: hsla(0, 2%, 70%, 0);
		}

		.wrapper {
			font-size: 17px;
		}

		.head {
			min-width: 1200px;
			position: fixed;
			z-index: 100;
			left: 0;
			right: 0;
			background: rgba(7, 111, 136, 0.13);
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
        #mpanel2{
        	position:relative;
        }
        .verify-code{
        	position:absolute;
        	left:143px;
        }
        .verify-code-area{
        	width:69px;
        	margin-left:60px;
        	margin-top:-30px;
        }
        .verify-input-area input{
        	width:69px;
        	height:24px;
        }
        .verify-change-code{
        	cursor:pointer;
        }
        .sideline{
		position:absolute;
		border:0;
		height:2px;
		background:#48a5f4 !important;
		top:41px;
		}
    </style>
</head>
<body class = "wrapper">
        <div class="head">
          <div class="head-main clearfix">
            <div class="logo">
              <img src="${pageContext.request.contextPath}/css/images/logo.png" alt="">
            </div>
            <div class="menuDiv">
              <ul class="menu clearfix">
                <li> 
                  <a href="" class="active">
                  首页
                  </a>
                </li>
                <li>
					<a href="../login.jsp">后台</a>
                </li>
                <li>
                  <a href="http://www.gzhu.edu.cn/">
                    关于广大
                  </a>
                </li>
              </ul>
            </div>
            <div class="linkTel">
              联系电话 : 020-374273488
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
			<li><a id="join">我要加入</a></li>
			<li class="sideline" style="left: -769px; width: 92px; overflow: hidden;"></li>
		</ul>
		<div id="login">登录</div>
		<c:if test="${not empty sessionScope.userName }">
		<div class="blank" style="position:absolute;right:0">欢迎您，${sessionScope.userName }</div>	
		<div id="exit" onclick="Exit();" style="position:absolute;right:20px;top:7px;">
		<a style="cursor:pointer;color:#3779bf;">[退出]</a>
		</div>
		</c:if>
	<div class="cls"></div>
	</div>
<div class="loginbox" id="loginbox" style="display:none;">
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
				<li id="${club.clubId }">${club.clubName }</li>
				</c:forEach>
			</ul>
		</div>
		<div style="margin-left:10px;margin-top:28px;font-size:15px;color:#026fe8;">
			<span style="font-weight:800;">验证码：</span>
			<div id="mpanel2">
       		</div>
		</div>
		<div class="submitbtn">
			<input type="submit" id="check-btn" value="登录"/>
			<input type="reset" value="重置"/>
		</div>

</div>

<iframe width="100%" height="100%" frameborder="0" src="" class="" name="content" id="content"
scrolling="no" style="position:fixed;top:115px;">

</iframe>
	<script type="text/javascript" src="<%=request.getContextPath() %>/front/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="../verify/js/verify.js" ></script>
   	<script>
	var rootPath = '<%=request.getContextPath()%>';
	$(function(){
		//获取路径 | | |
        var pathName=window.document.location.pathname;
		//截取，得到项目名称
        var projectName=pathName.substring(0 ,pathName.substr(1).indexOf('/')+1);
		var clubId;
		//isLogin:0：不需要登录,不展开登录页面  1：需要登录，展开登录页面
        var isLogin=0;
        /* <c:if test="${! empty param.isLogin}">isLogin="${param.isLogin}"</c:if> */
        if(typeof isLogin == "undefined" || isLogin == null || isLogin == ""){
            isLogin=0;//默认不需要登录
        }
        if(isLogin==1){
            $("#loginbox").slideToggle("slow");
        }

		$("#login").on('mouseover',function(){
			$("#loginbox").slideToggle("slow");
		})


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

			// $("#loginform").attr("action", loginUrl);

            var username=$("#username").val();
            var password=$("#password").val();
            var clubId=$("#choseClubId").val();

            $.ajax({
                url : loginUrl,
                type:'post',
                async:true,
                cache:false,
                data : {
                    username:username,
                    password:password,
                    clubId:clubId
                },
                dataType:'JSON',
                success : function(response) {
                	response = eval("("+response+")");
                    /* response=JSON.parse(response); */
                    if(response.status){
                        window.location.href=rootPath+"/front/index.jsp";
                    }else{
                        alert("错误信息："+response.msg);
                    }
                },
                error : function() {
                    var obj = {};
                    obj["Ptext"] = "系统出错";
                    operationTipsFailed(obj);
                }
            });
		});

		var iframe = document.getElementById("content");
		var newsid = $(".topmenu a").eq(0).attr("id");
		iframe.src = "./"+newsid+"/"+newsid+".jsp";
		//获取对应选项的标签名称
		$(".topmenu a").click(function(){
			var navid = $(this).attr("id");
            /* <c:if test="${empty sessionScope.token}">window.location.href=rootPath+"/front/index.jsp?isLogin=1"</c:if>

			var navid = $(this).attr("id");*/
			if(navid=="receipt" || navid=="chat"){
				var sessionUser = "<%=session.getAttribute("userName")%>";
				if(sessionUser=="null"){
					alert("请先登录！");
					return;
					/* window.location.href=rootPath+"/front/index.jsp"; */
				}else if(navid=="receipt"){
					iframe.src="./"+navid+"/"+navid+".jsp";
				}else{
					 iframe.src="./"+navid+"/"+navid+".jsp?token=${sessionScope.token }";
				}
			}else{
				iframe.src="./"+navid+"/"+navid+".jsp";
			} 
			/* if(navid=="chat"){
                iframe.src="./"+navid+"/"+navid+".jsp?token=${sessionScope.token }";
            } */
			
			var index = $(".topmenu a").index(this);
			var slide = -769+160*index+"px";
			$(".sideline").animate({left:slide},200);
		});
		

	});

	$('#mpanel2').codeVerify({
		type : 1,
    	width : '100px',
    	height : '38px',
    	fontSize : '14px',
    	codeLength : 6,
    	btnId : 'check-btn',
    	ready : function() {
    	},
    	success : function() {
    		var loginUrl = rootPath+"/login/LoginAction.action";

			// $("#loginform").attr("action", loginUrl);

            var username=$("#username").val();
            var password=$("#password").val();
            var clubId=$("#choseClubId").val();

            $.ajax({
                url : loginUrl,
                type:'post',
                async:true,
                cache:false,
                data : {
                    username:username,
                    password:password,
                    clubId:clubId
                },
                dataType:'JSON',
                success : function(response) {
                    //response = eval("("+response+")");
                	console.log(response);
                    //response=JSON.parse(response);
                    console.log(response);
                    if(response.status){
                        window.location.href=rootPath+"/front/index.jsp";
                    }else{
                        alert("错误信息："+response.msg);
                    }
                },
                error : function() {
                    var obj = {};
                    obj["Ptext"] = "系统出错";
                    operationTipsFailed(obj);
                }
            });
    	},
    	error : function() {
    		alert('验证码不匹配！');
    	}
    });
	
	function Exit(){
		$.ajax({
			url:rootPath+"/login/exitAction.action",
			type:'post',
			data:{},
			async:false,
			cache:false,
			success:function(){
				console.log("退出成功")
			},
			error:function(){
				console.log("退出失败");
			}
		});
		window.location.href=rootPath+"/front/index.jsp";
	}
	</script>
</body>
</html>