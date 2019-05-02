<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">
	var rootPath = "<%=request.getContextPath()%>";
</script>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/news/newscontent.css" />
<link rel="stylesheet" type="text/css" href="../css/news/yx_rotaion.css"/>
<link rel="stylesheet" href="../css/news/commentStyle.css">
<link rel="stylesheet" href="../css/news/comment.css">
<style type="text/css">
	.comment-show-con-img img{
		width:50px;
	}
	a.departContro{
		display:block;
		position:absolute;
		top:37px;
		font-size:12px;
		font-weight:600;
		color:#b2dbef59;
		cursor:pointer;
	}
	a.departContro:hover{
		color:#ff3535a6;
	}
</style>
</head>
<body>
<div style="width:98%;height:100%;position:absolute;top:10px;">
	<input type="hidden" id="newsId" value="${newsId }"/>
	<div class="head">
		<span>
			<%-- <%=request.getAttribute("head") %> --%>
			${clubName}
		</span>
		<input type="hidden" id="clubId" value="${clubId }"/>
		<%-- <a class="departContro" onclick="getDepartInfo(${clubId});">部门介绍</a> --%>
		<a class="departContro" target="blank" href="${pageContext.request.contextPath }/depart/getDepartList.action?clubId=${clubId}">部门介绍</a>
		<div class="curpos">
			<span>当前位置：</span>
			<span>${sessionScope.collegeName }</span><span style="font-size:18px;"> · </span>
			<span>${clubName }</span><span style="font-size:18px;"> · </span>
			<span>正文</span>
		</div>
	</div>
		
		<c:forEach items="${pageNews.data }" var="news">
		<div class="title">
		<p>
			<%-- <%=request.getAttribute("title") %> --%>
			${news.title }
		</p>
		<div class="info">
			<span>发布日期：</span><span>${news.submit_time }</span>
			<span style="margin-left:35px;">点击量：</span><span>${news.readcount } </span>
		</div>
		
		
	</div>
	<div class="newscontent" style="width:77%;">
		${news.content }
	</div>
	
	<!-- 热门新闻轮播图 模块-->
	<!--UL标签class属性必需，图片alt属性值即标题文字-->
	<div class="hotnews">
		<span class="title">*最近新闻*</span>
		<div class="yx-rotaion">
			<ul class="rotaion_list" >
				<li><a><img src="../css/news/images/3.jpg" alt="图片信息1"></a></li>
				<li><a></a></li>
				<li><a></a></li>
				<li><a></a></li>
				<li><a></a></li>
				<li><a></a></li>
		
			</ul>
		</div>
		<div>
			<ul class="newsList">
			</ul>
		</div>
	</div>
	
	<!-- 评论模块 -->
	<!-- 此评论textarea文本框部分使用的https://github.com/alexdunphy/flexText此插件-->
	<div class="commentAll">
		<span style="color: #026fe8;display: inline-block;margin-bottom: 10px;">精选留言</span>
	    <!--评论区域 begin-->
	    <div class="reviewArea clearfix">
	        <textarea class="content comment-input" placeholder="Please enter a comment&hellip;" onkeyup="keyUP(this)"></textarea>
	        <a href="javascript:;" class="plBtn">评论</a>
	    </div>
	    <!--评论区域 end-->
	    <!--回复区域 begin-->
	    <div class="comment-show">
	    <c:forEach items="${resultMap.dataList }" var="commentBlock">
	        <div class="comment-show-con clearfix">
	        	<c:if test="${commentBlock.mainComment.commentHead!='null'}">
	        		<div class="comment-show-con-img pull-left"><img src="/Cache/Img_Cache/${commentBlock.mainComment.commentHead }" alt=""></div>	
	        	</c:if>
	            <c:if test="${commentBlock.mainComment.commentHead=='null' }">
	            	<div class="comment-show-con-img pull-left"><img src="../css/news/images/header-img-comment_03.png" alt=""></div>
	            </c:if>
	            <div class="comment-show-con-list pull-left clearfix">
	                <div class="pl-text clearfix">
	                    <a href="#" class="comment-size-name">${commentBlock.mainComment.author }:</a>
	                    <span class="my-pl-con">&nbsp;${commentBlock.mainComment.content }</span>
	                </div>
	                <div class="date-dz">
	                    <span class="date-dz-left pull-left comment-time"><fmt:formatDate value="${commentBlock.mainComment.create_time }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
	                    <div class="date-dz-right pull-right comment-pl-block">
	                        <a href="javascript:;" class="removeBlock" id="${commentBlock.mainComment.comment_id }">删除</a>
	                        <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left" id="${commentBlock.mainComment.comment_id }">回复</a>
	                        <span class="pull-left date-dz-line">|</span>
	                        <a href="javascript:;" class="date-dz-z pull-left" id="${commentBlock.mainComment.comment_id }"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">${commentBlock.mainComment.belike }</i>)</a>
	                    </div>
	                </div>
	                
	                <div class="hf-list-con" id="">
	                	<c:if test="${commentBlock.responseList !=null}">
	                	<c:forEach items="${commentBlock.responseList}" var="response">
	         				<div class="all-pl-con"><div class="pl-text hfpl-text clearfix"><a href="#" class="comment-size-name">${response.author } : </a><span class="my-pl-con">回复<a href="#" class="atName">@${response.responseTo } </a> :  ${response.content }</span></div><div class="date-dz"> <span class="date-dz-left pull-left comment-time"><fmt:formatDate value="${response.create_time }" pattern="yyyy-MM-dd HH:mm:ss"/></span> <div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:;" class="removeBlock" id="${response.comment_id }">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left" id="${response.responseToCommentId }">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left" id="${response.comment_id }"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">${response.belike }</i>)</a> </div> </div></div>
	                	</c:forEach>
	                	</c:if>
	                	
	                </div>
	            </div>
	        </div>
	        </c:forEach>
	       
	    </div>
	    <!--回复区域 end-->
	</div>
	
	</c:forEach>
	
	<div class="foot">
	<a id="firstPage" href="${pageContext.request.contextPath }/news/queryNewsPage.action?currentPage=${pageNews.firstPage }&collegeId=${collegeId}&clubId=${clubId}">首页</a>&nbsp;
	<a id="prePage" href="${pageContext.request.contextPath }/news/queryNewsPage.action?currentPage=${pageNews.prePage }&collegeId=${collegeId}&clubId=${clubId}">上一页</a>&nbsp;
	<a id="nextPage" href = "${pageContext.request.contextPath }/news/queryNewsPage.action?currentPage=${pageNews.nextPage }&collegeId=${collegeId}&clubId=${clubId}">下一页</a>&nbsp;
	<a id="lastPage" href="${pageContext.request.contextPath }/news/queryNewsPage.action?currentPage=${pageNews.totalPage }&collegeId=${collegeId}&clubId=${clubId}">末页</a>&nbsp;
	第${pageNews.currentPage }页/共${pageNews.totalPage }页&nbsp;一共有${pageNews.totalCount }条数据
	</div>
</div>

</body>
<script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>

<script type="text/javascript" src="<%=request.getContextPath() %>/front/news/jquery.min.js"></script>


<!-- 评论模块 -->
<script type="text/javascript" src="<%=request.getContextPath() %>/front/news/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/front/news/jquery.flexText.js"></script>
<!--textarea高度自适应-->
<script type="text/javascript">
    $(function () {
        $('.content').flexText();
    });
</script>
<!--textarea限制字数-->
<script type="text/javascript">
    function keyUP(t){
        var len = $(t).val().length;
        if(len > 139){
            $(t).val($(t).val().substring(0,140));
        }
    }
</script>
<!--点击评论创建评论条-->
<script type="text/javascript">
    $('.commentAll').on('click','.plBtn',function(){
        var myDate = new Date();
        //获取当前年
        var year=myDate.getFullYear();
        //获取当前月
        var month=myDate.getMonth()+1;
        //获取当前日
        var date=myDate.getDate();
        var h=myDate.getHours();       //获取当前小时数(0-23)
        var m=myDate.getMinutes();     //获取当前分钟数(0-59)
        if(m<10) m = '0' + m;
        var s=myDate.getSeconds();
        if(s<10) s = '0' + s;
        var now=year+'-'+month+"-"+date+" "+h+':'+m+":"+s;
        //获取输入内容
        var oSize = $(this).siblings('.flex-text-wrap').find('.comment-input').val();
        console.log(oSize);
        //动态创建评论模块
        var userName = "<%=session.getAttribute("userName")%>";
        var headImg = "<%=session.getAttribute("headImg")%>";
        var plName;
        var imgUrl;
        if(userName!="null"){
        	plName = userName;
        	imgUrl = "/Cache/Img_Cache/"+headImg;
        }else{
        	var timestamp=new Date().getTime();
        	plName = '游客'+timestamp;
        	imgUrl = "../css/news/images/header-img-comment_03.png";
        }
        var oHtml;
        $.ajax({
        	url:rootPath+"/news/CommentsPl.action",
        	type:'post',
        	data:{
        		newsId:$("#newsId").val(),
        		author:plName,
        		content:oSize,
        		headImg:headImg
        	},
        	async:false,
        	cache:false,
        	dataType:'JSON',
        	success:function(response){
        		if(response.resultFlag){
                    oHtml = '<div class="comment-show-con clearfix"><div class="comment-show-con-img pull-left"><img src="'+imgUrl+'" alt=""></div> <div class="comment-show-con-list pull-left clearfix"><div class="pl-text clearfix"> <a href="#" class="comment-size-name">'+plName+' : </a> <span class="my-pl-con">&nbsp;'+ oSize +'</span> </div> <div class="date-dz"> <span class="date-dz-left pull-left comment-time">'+now+'</span> <div class="date-dz-right pull-right comment-pl-block"><a href="javascript:;" class="removeBlock" id="'+response.commentId+'">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left" id="'+response.commentId+'">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left" id="'+response.commentId+'"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">0</i>)</a> </div> </div><div class="hf-list-con"></div></div> </div>';
        		}else{
        			alert(response.Msg)
        		}
        	},
        	error:function(){
        		alert("系统出错");
        	}
        })
        if(oSize.replace(/(^\s*)|(\s*$)/g, "") != ''){
            $(this).parents('.reviewArea ').siblings('.comment-show').prepend(oHtml);
            $(this).siblings('.flex-text-wrap').find('.comment-input').prop('value','').siblings('pre').find('span').text('');
        }

    });
</script>
<!--点击回复动态创建回复块-->
<script type="text/javascript">
    $('.comment-show').on('click','.pl-hf',function(){
        //获取回复人的名字
        var fhName = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
        //回复@
        var fhN = '回复@'+fhName;
        //var oInput = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.hf-con');
        var fhHtml = '<div class="hf-con pull-left"> <textarea class="content comment-input hf-input" placeholder="" onkeyup="keyUP(this)"></textarea> <a href="javascript:;" class="hf-pl" id="'+$(this).attr("id")+'">评论</a></div>';
        //显示回复
        if($(this).is('.hf-con-block')){
            $(this).parents('.date-dz-right').parents('.date-dz').append(fhHtml);
            $(this).removeClass('hf-con-block');
            $('.content').flexText();
            $(this).parents('.date-dz-right').siblings('.hf-con').find('.pre').css('padding','6px 15px');
            //console.log($(this).parents('.date-dz-right').siblings('.hf-con').find('.pre'))
            //input框自动聚焦
            $(this).parents('.date-dz-right').siblings('.hf-con').find('.hf-input').val('').focus().val(fhN);
        }else {
            $(this).addClass('hf-con-block');
            $(this).parents('.date-dz-right').siblings('.hf-con').remove();
        }
    });
</script>
<!--评论回复块创建-->
<script type="text/javascript">
    $('.comment-show').on('click','.hf-pl',function(){
        var oThis = $(this);
        var myDate = new Date();
        //获取当前年
        var year=myDate.getFullYear();
        //获取当前月
        var month=myDate.getMonth()+1;
        //获取当前日
        var date=myDate.getDate();
        var h=myDate.getHours();       //获取当前小时数(0-23)
        var m=myDate.getMinutes();     //获取当前分钟数(0-59)
        if(m<10) m = '0' + m;
        var s=myDate.getSeconds();
        if(s<10) s = '0' + s;
        var now=year+'-'+month+"-"+date+" "+h+':'+m+":"+s;
        //获取输入内容
        var oHfVal = $(this).siblings('.flex-text-wrap').find('.hf-input').val();
        console.log(oHfVal)
        var oHfName = $(this).parents('.hf-con').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
        var oAllVal = '回复@'+oHfName;
        var responseToCommentId = $(this).attr("id");
        if(oHfVal.replace(/^ +| +$/g,'') == '' || oHfVal == oAllVal){

        }else {
        	var jsonPath = rootPath+"/front/news/json";
            $.getJSON(jsonPath+"/pl.json",function(data){
                var oAt = '';
                var oHf = '';
                var atName;
                var content;
                $.each(data,function(n,v){
                    delete v.hfContent;
                    delete v.atName;
                    var arr;
                    var ohfNameArr;
                    if(oHfVal.indexOf("@") == -1){
                        data['atName'] = '';
                        data['hfContent'] = oHfVal;
                    }else {
                        arr = oHfVal.split(':');
                        ohfNameArr = arr[0].split('@');
                        data['hfContent'] = arr[1];
                        data['atName'] = ohfNameArr[1];
                    }

                    if(data.atName == ''){
                        oAt = data.hfContent;
                    }else {
                        oAt = '回复<a href="#" class="atName">@'+data.atName+'</a> : '+data.hfContent;
                    }
                    oHf = data.hfName;
                    atName = data.atName;
                    content = data.hfContent;
                 });
                var userName = "<%=session.getAttribute("userName")%>";
                var hfName;
                if(userName!="null"){
                	hfName = userName;
                }else{
                	var timestamp=new Date().getTime();
                	hfName = '游客'+timestamp;
                }
                var oHtml;
                 $.ajax({
                	url:rootPath+"/news/CommentsHf.action",
                	type:'post',
                	data:{
                		newsId:$("#newsId").val(),
                		author:hfName,
                		content:content,
                		responseToCommentId:responseToCommentId,
                		responseTo:atName
                	},
                	async:false,
                	cache:false,
                	dataType:'JSON',
                	success:function(response){
                		if(response.resultFlag){
                            oHtml = '<div class="all-pl-con"><div class="pl-text hfpl-text clearfix"><a href="#" class="comment-size-name">'+hfName+' : </a><span class="my-pl-con">'+oAt+'</span></div><div class="date-dz"> <span class="date-dz-left pull-left comment-time">'+now+'</span> <div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:;" class="removeBlock" id="'+response.commentId+'">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left" id="'+response.respToCom+'">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left" id="'+response.commentId+'"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">0</i>)</a> </div> </div></div>';
                		}else{
                			alert(response.Msg);
                		}
                	},
                	error:function(){
                		alert("系统出错");
                	}
                })
                oThis.parents('.hf-con').parents('.comment-show-con-list').find('.hf-list-con').css('display','block').prepend(oHtml) && oThis.parents('.hf-con').siblings('.date-dz-right').find('.pl-hf').addClass('hf-con-block') && oThis.parents('.hf-con').remove();
            });
        }
    });
</script>
<!--删除评论块-->
<script type="text/javascript">
    $('.commentAll').on('click','.removeBlock',function(){
        var oT = $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con');
        if(oT.siblings('.all-pl-con').length >= 1){
            oT.remove();
        }else {
            $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con').parents('.hf-list-con').css('display','none')
            oT.remove();
        }
		var commentId = $(this).attr("id");
		$.ajax({
			url:rootPath+"/news/deleteComment.action",
			type:'post',
			async:false,
			cache:false,
			data:{
				commentId:commentId
			},
			dataType:'JSON',
			success:function(response){
				if(response.resultFlag){
				
				}else{
					alert(response.Msg);
				}
			},
			error:function(){
				alert("系统出错");
			}
		})
        $(this).parents('.date-dz-right').parents('.date-dz').parents('.comment-show-con-list').parents('.comment-show-con').remove();
    })
</script>
<!--点赞-->
<script type="text/javascript">
    $('.comment-show').on('click','.date-dz-z',function(){
        var zNum = $(this).find('.z-num').html();
        if($(this).is('.date-dz-z-click')){
            zNum--;
            $(this).removeClass('date-dz-z-click red');
            /* $(this).find('.z-num').html(zNum); */
            $(this).find('.date-dz-z-click-red').removeClass('red');
        }else {
            zNum++;
            $(this).addClass('date-dz-z-click');
            /* $(this).find('.z-num').html(zNum); */
            $(this).find('.date-dz-z-click-red').addClass('red');
        }
        var commentId = $(this).attr("id");
        $.ajax({
        	url:rootPath+"/news/CommentOnLike.action",
        	type:'post',
        	async:false,
        	cache:false,
        	data:{
        		commentId:commentId,
        		zNum:zNum
        	},
        	dataType:'JSON',
        	success:function(response){
        		if(response.resultFlag){
        			
        		}else{
        			alert(response.Msg);
        		}
        	},
        	error:function(){
        		alert("系统出错");
        	}
        });
        $(this).find('.z-num').html(zNum);
    })
</script>
<!-- 获取新闻的所有评论 -->
<!-- <script type="text/javascript">
	$.ajax({
		url:rootPath+"/news/queryAllComments.action",
		type:'post',
		async:true,
		cache:false,
		data:{
			newsId:${newsId}
		},
		dataType:'JSON',
		success:function(response){
			if(response.resultFlag){
				$.each(response.dataList){
					
				}
			}
		},
		error:function(){
			
		}
	})
</script> -->
<%--加载最近的六篇文章的标题和链接--%>
<script type="text/javascript">
	var clubId = "<%=request.getAttribute("clubId")%>";
    $.ajax({
        url : rootPath+"/news/queryNewsRecently.action",
        type:'post',
        async:true,
        cache:false,
        data : {
            clubId:clubId
        },
        dataType:'JSON',
        success : function(response) {
            /* response=JSON.parse(response); */
            if(response.resultFlag){
                if(response.newslist !=null){
                    $.each(response.newslist,function(index,news){
                        $('.newsList').append("<li><a  target=\"_blank\" href='"+news.url+"'>"+news.title+"</a></li>");
                    });
                }
            }else{
                alert("获取最近的文章失败："+response.msg);
            }
        },
        error : function() {
            var obj = {};
            alert("系统出错")
            //operationTipsFailed(obj);
        }
    });
</script>
<%--加载最新的滚动图片和文章链接--%>
<script type="text/javascript">
        $.ajax({
            url : rootPath+"/news/queryNewsImgRecently.action",
            type:'post',
            async:false,
            cache:false,
            data :{
                clubId:${clubId}
            },
            dataType:'JSON',
            success : function(response) {
                /* response=JSON.parse(response); */
                var str="";
                if(response.resultFlag){
                    if(response.imglist !=null){

                        $.each(response.imglist,function(index,imagNew){
                            str+="<li><a  target=\"_blank\" href='"+imagNew.url+"'><img src='"+imagNew.urlImage+"'></a></li>";
                        });
                    }
                    $('.rotaion_list').html(str);

                }else{
                    alert("获取最近的图片失败："+response.msg);
                }
            },
            error : function() {
                alert("系统出错")
            }
        });


</script>
<!-- 轮播图 -->
<script type="text/javascript" src="<%=request.getContextPath() %>/front/news/jquery.yx_rotaion.js"></script>
<script type="text/javascript">
    //留到下面图片加载再处理
    $(".yx-rotaion").yx_rotaion({auto:true});
</script>
<!-- <script type="text/javascript">
	function getDepartInfo(clubId){
		$.ajax({
			url:rootPath+"/",
			type:'post',
			data:{
				clubId:clubId
			},
			 async:false,
	         cache:false,
	         dataType:'JSON',
	         success:function(){
	        	 
	         },
	         error:function(){
	        	 
	         }
		})
	}
</script> -->

</html>