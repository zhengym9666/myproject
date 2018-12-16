<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/news/demo.css" />
		<link rel="stylesheet" type="text/css" href="../../css/news/style2.css" />
		<link href='http://fonts.googleapis.com/css?family=Electrolize' rel='stylesheet' type='text/css' />
</head>
<body>
	<div id="newsnav">
		<div id="header">
			<ul id="navigation">
				<li><a id="link-home" style="background:#026fe8;" href="#home">Home</a></li>
				<li><a id="link-portfolio" href="#portfolio">Portfolio</a></li>
				<li><a id="link-about" href="#about">About Me</a></li>
				<li><a id="link-contact" href="#contact">Contact</a></li>
				<li><a id="link-contact" href="#contact">Contact</a></li>
				<li><a id="link-contact" href="#contact">Contact</a></li>
				<li><a id="link-contact" href="#contact">Contact</a></li>
			</ul>

		</div>
	</div>
	<div id="newscontent" style="width:800px;height:500px;border:1px solid #fff;position:absolute;top:0;left:135px;">
         <iframe width="80%" height="100%" frameborder="0" scrolling="no" class="" src="newscontent.jsp" name="content" id="content">
                            	
		</iframe>                   	
    </div> 
	
                          <%--  <%@ include file="leftnav.html"%> --%>
                           <!--  <div id="newscontent" style="width:800px;height:500px;border:1px solid #fff;position:absolute;top:0;left:135px;">
                            	
                            </div> -->
     
</body>
<script type="text/javascript" src="../../js/jquery-1.11.1.min.js"></script>
	<script>
 		$(function(){
			$("#navigation li").mouseover(function(){
				$(this).children("a").css("background","#026fe8");
				$(this).siblings().children("a").css("background","rgba(255, 255, 255, 0.9)");
				
			});
			
			/* var pathName=window.document.location.pathname;
			//截取，得到项目名称
	        var projectName=pathName.substring(0 ,pathName.substr(1).indexOf('/')+1);
			var url=projectName+"/community/news.action";
			$.ajax({
				type: "get",
				url: url,
				success: function (data) {
					$("#newscontent").html(data);
		});  */
			});
	</script>
</html>