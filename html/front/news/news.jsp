<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/news/demo.css" />
		<link rel="stylesheet" type="text/css" href="../../css/news/style2.css" />
<script type="text/javascript">
    //获取路径 | | |
    var pathName=window.document.location.pathname;
    //截取，得到项目名称
    var projectName=pathName.substring(0 ,pathName.substr(1).indexOf('/')+1);
    //跳到测试结果:
    function jump(action)
     {
       var url=projectName+"/community/"+action;
       console.log(window.document.getElementById("content").src);
       window.document.getElementById("content").src = url;
	 }
</script>
</head>
<body style="width:99%;background:url(<%=request.getContextPath()%>/css/images/bg.png) no-repeat;background-position-y:12px;">
<input type="hidden" value="${sessionScope.collegeId }" id="collegeId">
	<div id="newsnav">
		<div id="header"> 
			<ul id="navigation">
			<c:forEach items="${sessionScope.clublist }" var="club">
				<li><a id="${club.clubId }">${club.clubName }</a></li>
			</c:forEach>
				<!-- <li><a id="volunteer">青年志愿者协会</a></li>
				<li><a id="redcross">红十字会</a></li>
				<li><a id="psychology">心理协会</a></li>
				<li><a id="hisayuki">尚行社</a></li>
				<li><a id="debate">辩论队</a></li> -->
				<!-- <li><a id="link-contact" href="#contact">Contact</a></li> -->
			</ul>

		</div>
	</div>
	<div id="content" style="width:85%;height:80%;position:absolute;top:10px;;left:135px;">
         <iframe width="110%" height="100%" frameborder="0" class="" src="" name="content" id="newscontent" style="overfolw-x:hidden">
                            	
		</iframe>                   	
    </div> 
	
                          <%--  <%@ include file="leftnav.html"%> --%>
                           <!--  <div id="newscontent" style="width:800px;height:500px;border:1px solid #fff;position:absolute;top:0;left:135px;">
                            	
                            </div> -->
     
</body>
<script type="text/javascript" src="../jquery-1.11.1.min.js"></script>
	<script>
 		$(function(){
 			$("li a").eq(0).css("background","#026fe8");
 			$("li a").eq(0).css("color","#fff");
			$("#navigation li").mouseover(function(){
				$(this).children("a").css("background","#026fe8");
				$(this).children("a").css("color","#fff");
				$(this).siblings().children("a").css("background","rgba(255, 255, 255, 0.9)");
				$(this).siblings().children("a").css("color","#333");
				
			});
			 //$("#league").on('click',function(){
				/* var title = "蜂蜜真的不会变质吗？看完我震惊了";
				var content = "<p>蜂蜜是我们日常生活中经常会吃到的食品。</p><p>它营养丰富，具有增强抵抗力，减肥，促进消化和吸收等功效。长期服用不仅能够强身健体还能美容养颜，是爱美、爱健康人士必不可少的滋补佳品。</p><p>在食用蜂蜜的过程中我们肯定也听别人说过“蜂蜜一万年也不会变质”的说法 ，意思是蜂蜜可以保持很久基本不会腐坏变质。</p><p>那么事实真的是这样吗？蜂蜜为什么不会变质呢，下面我们一起来看看吧。</p><p>那么事实真的是这样吗？蜂蜜为什么不会变质呢，下面我们一起来看看吧。</p><p>那么事实真的是这样吗？蜂蜜为什么不会变质呢，下面我们一起来看看吧。</p><p>那么事实真的是这样吗？蜂蜜为什么不会变质呢，下面我们一起来看看吧。</p>"
				 
				var id = $("a").eq(0).attr("id");
				var head = $("a").eq(0).text(); */
			    var pathName=window.document.location.pathname;
				//截取，得到项目名称
		        var projectName=pathName.substring(0 ,pathName.substr(1).indexOf('/')+1);
				var collegeId = $("#collegeId").val();
				var clubId = $("li a").eq(0).attr("id");
				var clubname = $("li a").eq(0).text();
				var url=projectName+"/news/queryNewsPage.action?currentPage=1&collegeId="+collegeId+"&clubId="+clubId+"&clubname="+clubname;
				console.log(url);		       
			    window.document.getElementById("newscontent").src = url;


				//})
			
			$("a").click(function(){
				
				var collegeId = $("#collegeId").val();
				var clubId = $(this).attr("id");
				clubname = $(this).text();
				url=projectName+"/news/queryNewsPage.action?currentPage=1&collegeId="+collegeId+"&clubId="+clubId+"&clubname="+clubname;
				window.document.getElementById("newscontent").src = url;
				
			});
			

			});
	</script>
</html>