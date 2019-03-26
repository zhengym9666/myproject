/**
 * 
 */
(function(a){
    //获取路径 | | |
    var pathName=window.document.location.pathname;
	//截取，得到项目名称
    var projectName=pathName.substring(0 ,pathName.substr(1).indexOf('/')+1);
	
	loadCollege();
	
	function loadCollege(){
	  
	  $.ajax({
		  url:projectName+'/community/GetAllCollegeInfo.action',
		  type:'post',
		  data:{},
		  success:function(response){
			  if(response.resultFlag){
				  var n = response.count;
				  $.each(response.data,function(i,item){
					  if(n<4){
				  			width = Math.floor(930/n-43);
				  		  }else if(n<8){
				  			width = Math.floor((930*2)/n-43);  
				  		  }else{
				  	  		width = Math.floor((930*3)/n-43);
				  		  }
				  		  height = Math.floor(0.69*width);
				  		  titleWidth = Math.round(0.83*width);
				  		  titleHeight = Math.round(0.69*height);
				  		  titleLnHeight = Math.round(0.58*height);
				  		  $(".collegeMenu").append('<li style="width:'+width+'px;height:'+height+'px">'
				                    +'<a class="normal" id="math" href="'+item.url+'" title="'+item.intro+'">'
				                    +'<img src="'+item.image+'">'
				                    +'</a>'
				                  +'<div class="info">'
				                      +'<div class="inforCon">'
				                        +'<div class="title" id="1010000" style="width:'+titleWidth+'px;height:'+titleHeight+'px;line-height:'+titleLnHeight+'px;">'+item.abbr+'</div>'
				                      +'</div>'
				                  +'</div>'
				             +'</li>');
				  })
			  }else{
				  alert(response.Msg);
			  }
		  },
		  error:function(){
			  
		  }
	  })
		
/*	  var n = 12;
	  var ulWidth = $(".collegeMenu").css('width');
	  var widthNum = ulWidth.replace(/[^0-9]/ig,"");
  	  for(var i = 0;i<n;i++){
  		  if(n<4){
  			width = Math.floor(widthNum/n-43);
  		  }else if(n<8){
  			width = Math.floor((widthNum*2)/n-43);  
  		  }else{
  	  		width = Math.floor((widthNum*3)/n-43);
  		  }
  		  height = Math.floor(0.69*width);
  		  titleWidth = Math.round(0.83*width);
  		  titleHeight = Math.round(0.69*height);
  		  titleLnHeight = Math.round(0.58*height);
  		  $(".collegeMenu").append('<li style="width:'+width+'px;height:'+height+'px">'
                    +'<a class="normal" id="math" href="community/mathBuild.action?collegeId=" title="微梦景区光雕利用全息®光雕技术塑造大型立体景观效果营造亦真亦幻的视觉奇迹 ... ...">'
                    +'<img src="css/images/math.jpg">'
                    +'</a>'
                  +'<div class="info">'
                      +'<div class="inforCon">'
                        +'<div class="title" id="1010000" style="width:'+titleWidth+'px;height:'+titleHeight+'px;line-height:'+titleLnHeight+'px;">数院</div>'
                      +'</div>'
                  +'</div>'
             +'</li>');
  	  }*/
	}
	
	$("#math").on('click',function(){
		var collegeId = $(this).siblings(".info").find(".title").attr("id");
		var url=projectName+"/community/mathBuild.action?collegeId="+collegeId;
		var href = $(this).attr("href");
		$(this).attr("href",url);
		
/*		$.ajax({
			type: "get",
			url: url,
			success: function (data) {
				window.location.href = data;
			//成功后 执行的方法
				//$("#dowebok").scrollTop(100);
				$("#college").html(data);
				console.log(data);
				  $(".qxgd.style").animate({
	                  left: '0'
	                 },500,function(){
	                      $(this).addClass("skew")
	                 });    
			}
			});*/
	  });
})(jQuery)
