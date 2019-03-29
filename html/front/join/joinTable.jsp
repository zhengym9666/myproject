<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<script type="text/javascript">
var rootPath = "<%=request.getContextPath()%>";
</script>

<style>
	span{
		color:#0a0a0a;
	}
	.head{
		height:39px;
	}
	.baseInfo{
		height:43px
	}
	.baseInfo input{
		height:23px;
		background-color:#fff;
	}
	.otherInfo{
		height:30px;
	}
	.textarea{
		width:920px;
	}
	.ui-down{
	background:url(down.png) no-repeat;
	background-size:14px;
	background-position-x:150px;
	background-position-y:9px;
	}
	#departName,#clubName,#gender{
	caret-color: transparent;
	}
	#departName:hover,#clubName:hover,#gender:hover{
	cursor:pointer;
	}
	#departmentul,#clubul,#genderul{
	position:  absolute;
    color: #000;
    border: 1px #a4a6a7 solid;
    width: 132px;
    background: #dce0e2;
    z-index: 99;
    display:none;
    margin-top:0;
	}
	#clubul{
		left:547px;
	}
	#departmentul{
		left:156px;
	}
	#genderul{
		left:124px;
	}
	ul li{
	list-style:none;
	height:23px;
	line-height:23px;
	color:#333;
	font-size:13px;
	margin-left:-40px;
	text-align:center;
	}
	ul li:hover{
	background:#d4cfcf;
	cursor:pointer;
	}
	#clubul{
	position:  absolute;
	}
	#submitBtn{
	display:  block;
	margin: 16px 522px;
	left: 20px;
	width:  58px;
	height: 36px;
	background: #318609;
	line-height:  36px;
	color: #e4e0e0;
	border-radius: 4px;
	border: none;
	}
	#submitBtn:hover{
	cursor:pointer;
	}
	.underline{
	padding-left:50px;
	}
	.underline input{
		border:none;
		background:none;
		border-bottom:1px solid #000;
	}
</style>

</head>
<body>

<div>
<table width="936" border="1" cellspacing="0" style="margin:0 129px;border:0.5px #08a5e638 solid;box-shadow:0px 2px 20px 7px #a9d2e6;">
		<tr class="head"><th colspan="3"><span>报名表</span></th></tr>
		<tr class="baseInfo">
			<td class="underline"><span>学号：</span><input type="text" id="stuNum"/></td>
			<td class="underline"><span>姓名：</span><input type="text" id="stuName" /></td>
			<td rowspan="4" width="144" style="border-bottom:none;"><div id="addCommodityIndex">
					             <!--input-group start-->
					            <div class="input-group row">
					
					                <div class="col-sm-9 big-photo">
					                	<div id="preview" style="text-align:center;">
					                		
					                        <img class="HeadPhoto" id="imghead" src="photo_icon.png" border="0" width="90" height="100" onclick="$('.previewImg').click();">
					                     </div>
					                     	<form class="uploadForm" method="post" action="" enctype="multipart/form-data">         
					                    	<input type="hidden" name="stuNum" class="ImgStuNum">
					                    	<input type="file" name="file" onchange="previewImage(this)" style="display: none;" class="previewImg">
					                	<!--<input id="uploaderInput" class="uploader__input" style="display: none;" type="file" accept="" multiple="">-->
					               			</form>
					                </div>
					            </div>
				         		<!--input-group end-->
							</div></td>
		</tr>
		<tr class="baseInfo">
			<td style="padding-left:50px;">
				<span>性别：</span>
				<input type="text" id="gender" value="请选择" class="ui-down"/>
				<ul id="genderul">
					<li>男</li>
					<li>女</li>
				</ul>
			</td>
			<td class="underline"><span>专业：</span><input type="text" id="profession"/></td>
		</tr>
		<tr class="baseInfo">			
			<td class="underline"><span>班级：</span><input type="text" id="grade"/></td>
			<td class="underline"><span>电话：</span><input type="text" id="phone"/></td>
		</tr>
		<tr class="baseInfo">			
			<td class="underline"><span>邮箱：</span><input type="text" id="email"/></td>
			<td  style="padding-left:50px;"><span>社团意向：</span>
			<input type="text" id="clubName" name="clubName" value="请选择" class="ui-down"/>
			<input type="hidden" id="clubId" name="clubId" class="ui-down"/>
			<ul id="clubul">

			</ul>
			</td>
		</tr>
		<tr class="baseInfo">
		
			<td  style="padding-left:50px;"><span>部门意向：</span>
			<input type="text" id="departName" name="departName" value="请选择" class="ui-down"/>
			<input type="hidden" id="departId" name="departId" class="ui-down"/>
			<ul id="departmentul">

			</ul>
			</td>
			<td></td>
			<td style="border-top:none;text-align:center;"><span style="font-size:14px;color:#f00;">请上传头像（图片大小不超过1M）</span></td>
		</tr>
		<tr class="otherInfo">
			<td colspan="3"><span>兴趣爱好</span></td>
		</tr>
		<tr>
			<td colspan="3"><textarea rows="8" cols="40" class="textarea" id="interest" placeholder="描述一下你的兴趣..."></textarea></td>
		</tr>
		<tr class="otherInfo">
			<td colspan="3"><span>特长</span></td>
		</tr>
		<tr>
			<td colspan="3"><textarea rows="8" cols="40" class="textarea" id="special" placeholder="描述一下你的特长..."></textarea></td>
		</tr>
	</table>
	<button onclick="NewMember.submitJoinInfo();" id="submitBtn">提交</button>
</div>	
</body>

<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="join.js"></script>
<script type="text/javascript">
	$(function(){
		$("#departName").click(function(){
			$("#departmentul").toggle();
		})
		
		$("#clubName").click(function(){
			$("#clubul").toggle();
		});
		$("#gender").click(function(){
			$("#genderul").toggle();
			$("#genderul li").click(function(){
				$("#gender").val($(this).text());
				$("#genderul").hide();
			})
		});
		
		NewMember.loadClubList();
		
	})
	
	
	//图片上传预览    IE是用了滤镜。
        function previewImage(file)
        {
		if($("#stuNum").val()==null || $("#stuNum").val()==''){
			alert("请先填写学号！");
	  	}else{
          var MAXWIDTH  = 125; 
          var MAXHEIGHT = 160;
          var div = document.getElementById('preview');
          $("#imghead").css("width","125px");
          $("#imghead").css("height","160px");
        
			  if (file.files && file.files[0])
	          {
	              div.innerHTML ='<img id=imghead onclick=$(".previewImg").click()>';
	              var img = document.getElementById('imghead');
	              img.onload = function(){
	                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
	                img.width  =  rect.width;
	                img.height =  rect.height;
//	                 img.style.marginLeft = rect.left+'px';
	                img.style.marginTop = rect.top+'px';
	              }
	              var reader = new FileReader();
	              reader.onload = function(evt){img.src = evt.target.result;}
	              reader.readAsDataURL(file.files[0]);
	          }
	          else //兼容IE
	          {
	            var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
	            file.select();
	            var src = document.selection.createRange().text;
	            div.innerHTML = '<img id=imghead>';
	            var img = document.getElementById('imghead');
	            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
	            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
	            status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
	            div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
	          }
	          NewMember.loadImage();
	        }
	}
          
        function clacImgZoomParam( maxWidth, maxHeight, width, height ){
            var param = {top:0, left:0, width:width, height:height};
            if( width>maxWidth || height>maxHeight ){
                rateWidth = width / maxWidth;
                rateHeight = height / maxHeight;
                
                if( rateWidth > rateHeight ){
                    param.width =  maxWidth;
                    param.height = Math.round(height / rateWidth);
                }else{
                    param.width = Math.round(width / rateHeight);
                    param.height = maxHeight;
                }
            }
            param.left = Math.round((maxWidth - param.width) / 2);
            param.top = Math.round((maxHeight - param.height) / 2);
            return param;
        }
</script>
