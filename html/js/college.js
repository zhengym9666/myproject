/**
 * 
 */
(function(a){	
	$("#math").on('click',function(){
        //获取路径 | | |
        var pathName=window.document.location.pathname;
		//截取，得到项目名称
        var projectName=pathName.substring(0 ,pathName.substr(1).indexOf('/')+1);
		var url=projectName+"/community/mathBuild.action";
		$.ajax({
			type: "get",
			url: url,
			success: function (data) {
				
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
			});
	  });
})(jQuery)
