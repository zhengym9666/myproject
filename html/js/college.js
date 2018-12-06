/**
 * 
 */
(function(a){	
	$("#math").on('click',function(){
		
		var url="/gd_stu_dev/service/action/CollegeAction.action";
		alert(url); 
		$.ajax({
			type: "get",
			url: url,
			success: function (data) {
				$("#college").html(data);
			//成功后 执行的方法
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
