$(function(){
	
});

(function(obj){
	var NewMember={
		actionPath:rootPath+"/join/",
		loadClubList:function(){
			$("#clubul").html("");
			$.ajax({
				url:NewMember.actionPath+"queryAllClub.action",
				type:'post',
				data:{},
				dataType:'JSON',
				success:function(response){
					$.each(response.data,function(i,item){
	    				$("#clubul").append('<li value='+item.clubId+' onclick=NewMember.choseClub('+item.clubId+',"'+item.clubName+'")>'+item.clubName+'</li>');
					});
				},
				error:function(){
					
				}
			});
		},
		choseClub:function(clubId,clubName){
			$("#departmentul").html('');
			$("#clubName").val(clubName);
			$("#clubId").val(clubId);
			$("#clubul").hide();
			$.ajax({
				url:NewMember.actionPath+"queryDepartment.action",
				type:'post',
				data:{clubId:clubId},
				dataType:'JSON',
				success:function(response){
					$.each(response.data,function(i,item){
						$("#departmentul").append('<li value='+item.id+' onclick=NewMember.choseDepartment('+item.id+',"'+item.name+'")>'+item.name+'</li>');
					});
				},
				error:function(){
					
				}
			});
		},
		choseDepartment:function(departId,departName){
			$("#departId").val(departId);
			$("#departName").val(departName);
			$("#departmentul").hide();
		},
		loadImage:function(){
	    	
			
			$(".ImgStuNum").val($("#stuNum").val());
			
	    	   var myForm = new FormData($(".uploadForm")[0]);
	    	   console.log(myForm);
	    	   /*myForm.append('file',$(".uploadForm")[0]);
	    	   myForm.append('stuNum',$(".ImgStuNum").val());*/
	    	   //var Image = new FormData($(".uploadForm")[0]);
	    	   
	    		//console.log(uploadFile);
	    		$.ajax({
					url:NewMember.actionPath+"uploadHead.action",
					type:'POST',
					data:myForm,
					async: false,  
					cache: false, 
					contentType: false, //不设置内容类型
					processData: false, //不处理数据
					success:function(data){
						if(data.resultFlag){
		                   
						}else{
			                alert(data.msg);
						}
						
					},
					error:function(){

					}
				}); 
	       },	
		submitJoinInfo:function(){
			var stuNum = $("#stuNum").val();
        	var stuName = $("#stuName").val();
        	var profession = $("#profession").val();
        	var grade = $("#grade").val();
        	var phone = $("#phone").val();
        	var email = $("#email").val();
        	var clubName = $("#clubName").val();
        	var clubId = $("#clubId").val();
        	var departName = $("#departName").val();
        	var departId = $("#departId").val();
        	var interest = $("#interest").val();
        	var special = $("#special").val();
        	var gender = $("#gender").val();
        	
        	$.ajax({
        		url:NewMember.actionPath+"submitJoinInfo.action",
        		type:'post',
        		data:{
        			stuNum:stuNum,
            		stuName:stuName,
            		profession:profession,
            		grade:grade,
            		phone:phone,
            		email:email,
            		clubName:clubName,
            		clubId:clubId,
            		departName:departName,
            		departId:departId,
            		interest:interest,
            		special:special,
            		gender:gender
        		},
        		dataType:'JSON',
        		success:function(response){
        			if(response.resultFlag){
        				alert("提交成功");
        			}else{
        				alert(response.Msg);
        			}
        		},
        		error:function(){
        			alert("提交失败");
        		}
        	
        		
        	});
		}	
	}
	
	obj.NewMember = NewMember;
})(window);