$(document).ready(function(){     
	
	function setQuestionLabel(id)
	{
		switch(id)
		{
		case 0:$("#question-label").text("全部问题");
		break;
		case 1:$("#question-label").text("约球");
		break;
		case 2:$("#question-label").text("失误招领");
		break;
		case 3:$("#question-label").text("考试求助");
		break;
		case 4:$("#question-label").text("二手买卖");
		break;
		}
	}
	
	
	$("#add_question").click(function(){
		  if($("#title")==""||$("#content")=="")
			  {
			    alert("内容不能为空");
			  }
        		 $.ajax({     
					    url:"/question_square/add",
						type:"POST",
						dataType:"text",
						data:{"title":$("#title").val(),"content": $('#editor').val(),"question_Id":$("#question_Id").val()},
						success:function(data){   
							if(data=="isValid"){
								alert("发布成功");
							   location.href="/question_square";
							}else{
								alert("发布失败");
							}
						},
						error:function(){
							alert("请求失败");
						}
				 });  
	  });

	 /* $("ul li").click(function(){
		  var id=parseInt($(this).attr('id'));
		  setQuestionLabel(id);
		  $.ajax({     
			    url:"/question_square/list",
				type:"POST",
				dataType:"json",
				data:{"question_Id":$(this).attr('id')},
				success:function(data){   
					$("#list_item").empty();
					$.each(data, function(){
			        $("#list_item").append("<div class='row' id='question-list'><div class='col-md-12'><div class='row'><div class='col-md-2'>" +
			        "<img src='../../resource/img/user/"+this.profile+"' id='question-list-picture'  class='img-rounded'></div>" +
			        "<div class='col-md-10'><div class='row'><div class='col-md-12' id='question-title'><h4><a href='question_square/questions/"+this.id+"'  target='_Blank'>"+this.title+"</a>" +
			        		"</h4></div></div><div class='row'><div class='col-md-12' id='question-attach'><p>" +
			        "<a class='aw-question-tags'>默认分类</a>•<a href='' class='aw-user-name'>"+this.user+"</a> " +
			        		"<span class='text-color-999'>发起了问题 • 1 人关注 •"+this.comment_size+"个回复 • "+this.clickTimes+"次浏览 • "+this.date+"</span></div></div></div></div></div></div>");			
						
				         question_id=this.question_Id;
					});
				},
				error:function(){
					alert("请求失败");
				}
		 });  
        		 
	  });*/
	  
	  $("#release_question").click(function(){location.href="/question_square/add";});
	  
	  
		$("#add_Comment").click(function(){
			  if($('#editor').val()==""){
				    alert("内容不能为空");
				  }else {
					  $.ajax({     
						    url:"/question_square/addComment",
							type:"POST",
							dataType:"text",
							data:{"content": $('#editor').val(),"id":$("#question-content").attr('name')},
							success:function(data){   
								if(data=="isValid"){
									 alert("评论成功");
									 location.reload() ;
								}else{
									alert("发布失败");
								}
							},
							error:function(){
								alert("请求失败");
							}
					 });  
				  }
	        		
		  });
		
$("#show-look-more").click(function(){
    		 $.ajax({     
				    url:"/question_square/loadMore",
					type:"POST",
					dataType:"json",
					data:{"question_id":$("#show-look-more").attr("name"),"curPage": curPage},
					success:function(data){
						if(data!=null){
						     setQuestionData(data);
						     curPage=curPage+1;
						}else
							{
							  alert("没有更多了");
							}
					},
					error:function(){
						alert("加载失败");
					}
			 });  
  });		
		
		
function setQuestionData(data)
{
	$.each(data, function(){
		 $("#list_item").append("<div class='row' id='question-list'><div class='col-md-12'><div class='row'><div class='col-md-2'>" +
			        "<img src='../../resource/img/user/"+this.profile+"' id='question-list-picture'  class='img-rounded'></div>" +
			        "<div class='col-md-10'><div class='row'><div class='col-md-12' id='question-title'><h4><a href='question_square/questions/"+this.id+"'  target='_Blank'>"+this.title+"</a>" +
			        		"</h4></div></div><div class='row'><div class='col-md-12' id='question-attach'><p>" +
			        "<a class='aw-question-tags'>默认分类</a>•<a href='' class='aw-user-name'>"+this.user+"</a> " +
			        		"<span class='text-color-999'>发起了问题 • 1 人关注 •"+this.comment_size+"个回复 • "+this.clickTimes+"次浏览 • "+this.date+"</span></div></div></div></div></div></div>");			
   });
}

$("#Attention").click(function(){
	 $.ajax({     
		    url:"/question_square/addAttention",
			type:"POST",
			dataType:"json",
			data:{"question_id":quection_id},
			success:function(data)
			{
				    if(data=="isValid")
					{
					   
					}
			},
			error:function(){
				alert("加载失败");
			}
	 });  
});	


$("#user_like").click(function(){
	$.ajax({     
		    url:"/question_square/like",
			type:"POST",
			dataType:"text",
			data:{"id":$("#question-big-title").attr("name")},
			success:function(data){
					   $("#userlike").text(data);
			},
			error:function(){
				alert("加载失败");
			}
	 });  
});	

});