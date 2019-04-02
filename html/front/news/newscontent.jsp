<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
</head>
<body>
<div style="width:98%;height:100%;position:absolute;top:10px;">

	<div class="head">
		<span>
			<%-- <%=request.getAttribute("head") %> --%>
			${clubName}
		</span>
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
		<%--<img alt="" src="${news.image }">
			&lt;%&ndash; <%=request.getAttribute("content") %> &ndash;%&gt;
			${news.content }
		<img alt="" src="${news.image }">
			&lt;%&ndash; <%=request.getAttribute("content") %> &ndash;%&gt;
			${news.content }
		<img alt="" src="${news.image }">
		<p>
			&lt;%&ndash; <%=request.getAttribute("content") %> &ndash;%&gt;
			${news.content }
		</p>--%>
		${news.content }
	</div>
	
	<!-- 热门新闻轮播图 模块-->
	<!--UL标签class属性必需，图片alt属性值即标题文字-->
	<div class="hotnews">
		<span class="title">*热门新闻*</span>
		<div class="yx-rotaion">
			<ul class="rotaion_list">
		
				<li><a href="http://www.jq22.com/"><img src="../css/news/images/1.jpg" alt="图片信息1"></a></li>
		
				<li><a href="http://www.jq22.com/"><img src="../css/news/images/2.jpg" alt="图片信息2"></a></li>
		
				<li><a href="http://www.jq22.com/"><img src="../css/news/images/3.jpg" alt="图片信息3"></a></li>
		
				<li><a href="http://www.jq22.com/"><img src="../css/news/images/4.jpg" alt="图片信息4"></a></li>
		
				<li><a href="http://www.jq22.com/"><img src="../css/news/images/5.jpg" alt="图片信息5"></a></li>
		
			</ul>
		</div>
		<div>
			<ul class="newsList">
					<li><a href="">蜂蜜真的不会变质吗？看完我震惊了</a></li>
					<li><a href="">蜂蜜真的不会变质吗？看完我震惊了</a></li>
					<li><a href="">蜂蜜真的不会变质吗？看完我震惊了</a></li>
					<li><a href="">蜂蜜真的不会变质吗？看完我震惊了</a></li>
					<li><a href="">蜂蜜真的不会变质吗？看完我震惊了</a></li>
					<li><a href="">蜂蜜真的不会变质吗？看完我震惊了</a></li>
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
	        <div class="comment-show-con clearfix">
	            <div class="comment-show-con-img pull-left"><img src="../css/news/images/header-img-comment_03.png" alt=""></div>
	            <div class="comment-show-con-list pull-left clearfix">
	                <div class="pl-text clearfix">
	                    <a href="#" class="comment-size-name">张三 : </a>
	                    <span class="my-pl-con">&nbsp;来啊 造作啊!</span>
	                </div>
	                <div class="date-dz">
	                    <span class="date-dz-left pull-left comment-time">2017-5-2 11:11:39</span>
	                    <div class="date-dz-right pull-right comment-pl-block">
	                        <a href="javascript:;" class="removeBlock">删除</a>
	                        <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>
	                        <span class="pull-left date-dz-line">|</span>
	                        <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a>
	                    </div>
	                </div>
	                <div class="hf-list-con"></div>
	            </div>
	        </div>
	        <div class="comment-show-con clearfix">
	            <div class="comment-show-con-img pull-left"><img src="../css/news/images/header-img-comment_03.png" alt=""></div>
	            <div class="comment-show-con-list pull-left clearfix">
	                <div class="pl-text clearfix">
	                    <a href="#" class="comment-size-name">张三 : </a>
	                    <span class="my-pl-con">&nbsp;来啊 造作啊!</span>
	                </div>
	                <div class="date-dz">
	                    <span class="date-dz-left pull-left comment-time">2017-5-2 11:11:39</span>
	                    <div class="date-dz-right pull-right comment-pl-block">
	                        <a href="javascript:;" class="removeBlock">删除</a>
	                        <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>
	                        <span class="pull-left date-dz-line">|</span>
	                        <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a>
	                    </div>
	                </div>
	                <div class="hf-list-con">
	                <div class="all-pl-con"><div class="pl-text hfpl-text clearfix"><a href="#" class="comment-size-name">我的名字 : </a><span class="my-pl-con">回复<a href="#" class="atName">@我的名字 </a> :  ddd</span></div><div class="date-dz"> <span class="date-dz-left pull-left comment-time">2019-4-2 7:23:48</span> <div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:;" class="removeBlock">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a> </div> </div></div>
	                <div class="all-pl-con"><div class="pl-text hfpl-text clearfix"><a href="#" class="comment-size-name">我的名字 : </a><span class="my-pl-con">回复<a href="#" class="atName">@我的名字 </a> :  ddd</span></div><div class="date-dz"> <span class="date-dz-left pull-left comment-time">2019-4-2 7:23:48</span> <div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:;" class="removeBlock">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a> </div> </div></div>
	                </div>
	            </div>
	        </div>
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
<!-- 轮播图 -->
<script type="text/javascript" src="<%=request.getContextPath() %>/front/news/jquery.yx_rotaion.js"></script>
<script type="text/javascript">
$(".yx-rotaion").yx_rotaion({auto:true});
</script>

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
        oHtml = '<div class="comment-show-con clearfix"><div class="comment-show-con-img pull-left"><img src="../css/news/images/header-img-comment_03.png" alt=""></div> <div class="comment-show-con-list pull-left clearfix"><div class="pl-text clearfix"> <a href="#" class="comment-size-name">David Beckham : </a> <span class="my-pl-con">&nbsp;'+ oSize +'</span> </div> <div class="date-dz"> <span class="date-dz-left pull-left comment-time">'+now+'</span> <div class="date-dz-right pull-right comment-pl-block"><a href="javascript:;" class="removeBlock">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a> </div> </div><div class="hf-list-con"></div></div> </div>';
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
        var fhHtml = '<div class="hf-con pull-left"> <textarea class="content comment-input hf-input" placeholder="" onkeyup="keyUP(this)"></textarea> <a href="javascript:;" class="hf-pl">评论</a></div>';
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
        if(oHfVal.replace(/^ +| +$/g,'') == '' || oHfVal == oAllVal){

        }else {
        	var jsonPath = rootPath+"/front/news/json";
            $.getJSON(jsonPath+"/pl.json",function(data){
                var oAt = '';
                var oHf = '';
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
                });

                var oHtml = '<div class="all-pl-con"><div class="pl-text hfpl-text clearfix"><a href="#" class="comment-size-name">我的名字 : </a><span class="my-pl-con">'+oAt+'</span></div><div class="date-dz"> <span class="date-dz-left pull-left comment-time">'+now+'</span> <div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:;" class="removeBlock">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a> </div> </div></div>';
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
            $(this).find('.z-num').html(zNum);
            $(this).find('.date-dz-z-click-red').removeClass('red');
        }else {
            zNum++;
            $(this).addClass('date-dz-z-click');
            $(this).find('.z-num').html(zNum);
            $(this).find('.date-dz-z-click-red').addClass('red');
        }
    })
</script>
</html>