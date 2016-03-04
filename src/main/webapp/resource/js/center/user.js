
//定义分页全局变量
var total_page;
var cur_page=1;





$(document).ready(function() 
{  
	$.ajax({     
	    url:"user_list",
		type:"POST",
		dataType:"json",
		data:{},
			success:function(data){
			setCampaignData(data);
			$("#page").empty();
			setPage();
			setPageNumberColor();
			}
	     });
	
	
	//将campaigm数据显示到html中
	function setCampaignData(data)
	{   
		total_page=0;
		$("#table_id").empty();
		$("#table_user_list_id").html("<thead><th>ID</th><th>用户名</th><th>昵称</th><th>性别</th><th>用户类别</th><th>邮箱</th><th></th>操作</thead>");
		$.each(data, function(){
			 $("#table_id").append("<tr><td>"+this.id+"</td><td>"+this.username+"</td><td>"+this.nickname+"</td><td>"+this.sexClass+"</td><td>"+this.userClass+"</td><td>"+this.email+"</td><td><a href=''>禁用</td></tr>");
			 total_page=parseInt(((this.count%10)==0)?(this.count/10):(this.count/10+1));
		});
	}
	function setPage()
	{
		$("#page").append("<li><a id='pre' href='#'>上一页</a></li>");
		for(var i=1;i<=total_page;i++)
			$("#page").append("<li><a id='page_id' href='#' name='"+i+"' class='"+i+"'>"+i+"</a></li>");
		    $("#page").append("<li><a id='next' href='#'>下一页</a></li>");	
	}

	function setPageNumberColor()
	{
		 for(var i=1;i<=total_page;i++)
		$(".pagination li a").eq(i).css("background-color","#FFFFFF");
		$(".pagination li a").eq(cur_page).css("background-color","#00BFFF");
	}

	
	function setCampaignDataLast(data)
	{
		$("#table_id").empty();
		var size=0;
		$("#table_id").html("<thead><th>ID</th><th>题目</th><th>所属板块</th><th>发布时间</th><th>状态</th><th>操作</th></thead>");
		$("#table_user_list_id").html("<thead><th>ID</th><th>用户名</th><th>昵称</th><th>性别</th><th>用户类别</th><th>邮箱</th><th></th>操作</thead>");
		$.each(data, function(){
			 $("#table_id").append("<tr><td>"+this.id+"</td><td>"+this.username+"</td><td>"+this.nickname+"</td><td>"+this.sexClass+"</td><td>"+this.userClass+"</td><td>"+this.email+"</td><td><a href=''>禁用</td></tr>");
		});
	}
	
	

	//分页点击
	$("#page").on("click","#page_id",function(){
		 var imgid = $(this).attr("name");//获取当前页
		 cur_page=parseInt(imgid);
		 $.ajax({     
			    url:"userPageList",
				type:"POST",
				dataType:"json",
				data:{"curPage":$(this).attr("name"),"keyword":$("#userKeyWord").val()},
				success:function(data){   
					setCampaignDataLast(data);
					setPageNumberColor();
				}
		 });
	  });

	//分页点击
	$("#page").on("click","#next",function(){
		var page=parseInt(cur_page+1);
		if(parseInt(page)>parseInt(total_page))
		{
		  alert("已经是最后一页了");
		}else
		{
			cur_page=page;
			$.ajax({     
			    url:"userPageList",
				type:"POST",
				dataType:"json",
				data:{"curPage":page,"keyword":$("#userKeyWord").val()},success:function(data){ 
					setCampaignDataLast(data);
					setPageNumberColor();
					}});
		}
	  });


	//分页点击
	$("#page").on("click","#pre",function(){
		var page=parseInt(cur_page-1);
		if(parseInt(page)<=0)
		{
		  alert("已经是第一页了");
		}else
		{
			cur_page=page;
			$.ajax({     
			    url:"userPageList",
				type:"POST",
				dataType:"json",
				data:{"curPage":page,"keyword":$("#userKeyWord").val()},success:function(data){ 
					setCampaignDataLast(data);
					setPageNumberColor();
					}});
		}
	  });
	
	
	
});







//类别选择时触发事件
/*$("#select_change").change(function(){$.ajax({     
			    url:"list_select",
				type:"POST",
				dataType:"json",
				data:{"id":$("#select_change").val()},
				success:function(data){
						setCampaignData(data);
						$("#page").empty();
						if(total_page!=0){
							setPage();
							cur_page=1;
							setPageNumberColor();
						}
						
					}
		 });
}); 
//搜索信息
$("#select_list_submit").each(function()
		{$(this).click(function(){ $.ajax({     
						    url:"list_search",
							type:"POST",
							dataType:"json",
							data:{"keyword":$("#select_list_input").val()},
								success:function(data){
									setCampaignData(data);
									$("#page").empty();
									setPage();
									setPageNumberColor();
									cur_page=1;
									}
						  });
	        });
	});





//进入到发布咨询页面
$("#113").each(function(){$(this).click(function(){   
	                    	getStr(2);
	                    });
	            });



//将campaigm数据显示到html中
function setCampaignDataLast(data)
{
	$("#table_id").empty();
	var size=0;
	$("#table_id").html("<thead><th>ID</th><th>题目</th><th>所属板块</th><th>发布时间</th><th>状态</th><th>操作</th></thead>");
	$.each(data, function(){
		 $("#table_id").append("<tr><td>"+this.id+"</td><td><a href='/scut/main_content?id="+this.id+"' " +
		 		"target='_Blank' >"+this.title+"</a></td><td>"+this.classId+"</td><td>"+this.time+"</td><td>"+this.state+"</td>" +
		 				"<td><button type='button' id='campaignDelete'  name='"+this.id+"' class='btn btn-danger'>删除</button></td></tr>");
	});
}

//分页点击
$("#page").on("click","#page_id",function(){
	 var imgid = $(this).attr("name");//获取当前页
	 cur_page=parseInt(imgid);
	 $.ajax({     
		    url:"page_list",
			type:"POST",
			dataType:"json",
			data:{"curPage":$(this).attr("name"),"keyword":$("#select_list_input").val(),"id":$("#select_change").val()},
			success:function(data){   
				setCampaignDataLast(data);
				setPageNumberColor();
			}
	 });
  });

//分页点击
$("#page").on("click","#next",function(){
	var page=parseInt(cur_page+1);
	if(parseInt(page)>parseInt(total_page))
	{
	  alert("已经是最后一页了");
	}else
	{
		cur_page=page;
		$.ajax({     
		    url:"page_list",
			type:"POST",
			dataType:"json",
			data:{"curPage":page,"keyword":$("#select_list_input").val(),"id":$("#select_change").val()},success:function(data){ 
				setCampaignDataLast(data);
				setPageNumberColor();
				}});
	}
  });


//分页点击
$("#page").on("click","#pre",function(){
	var page=parseInt(cur_page-1);
	if(parseInt(page)<=0)
	{
	  alert("已经是第一页了");
	}else
	{
		cur_page=page;
		$.ajax({     
		    url:"page_list",
			type:"POST",
			dataType:"json",
			data:{"curPage":page,"keyword":$("#select_list_input").val(),"id":$("#select_change").val()},success:function(data){ 
				setCampaignDataLast(data);
				setPageNumberColor();
				}});
	}
  });



//活动删除
 $("#table_id").on("click","#campaignDelete",function(){
 	 $.ajax({     
 		    url:"campaign_delete",
 			type:"POST",
 			dataType:"json",
 			data:{"campaignId":parseInt($(this).attr("name"))},
 			success:function(data){   
 				if(data.isI=="1"){
 					alert("删除成功");
					}else
					{
						alert("删除失败");
					}
 			}
 	 });
   });
});
*/






 /***********************************************************************************************************************************************/
 
 
 /*$("#114").each(function(){
     $(this).click(
         function(){   
        	 getStr(3);
                 	$.ajax({     
							    url:"user_list",
								type:"POST",
								dataType:"json",
								data:{"username":$("#user_select_input").val()},
								success:function(data){ 
									$("#table_user_list_id").html("<thead><th>ID</th><th>用户名</th><th>昵称</th><th>性别</th><th>用户类别</th><th>邮箱</th><th></th>操作</thead>");
									$.each(data, function(){
										 $("#table_user_list_id").append("<tr><td>"+this.id+"</td><td>"+this.username+"</td><td>"+this.nickname+"</td><td>"+this.sexClass+"</td><td>"+this.userClass+"</td><td>"+this.email+"</td><td><a href=''>禁用</td></tr>");
								    });
								}
						 });
         });
 });
 
 

 点击折叠面板时显示相应的面板
 $("#115").each(function(){
 		                $(this).click(
 		                		
 		                    function(){   
 		                    	getStr(5);
 				                    	$.ajax({     
 											    url:"column_list",
 												type:"POST",
 												dataType:"json",
 												data:{},
 												success:function(data){   
 													$("#column_table_id").html("<thead><th>ID</th><th>主题</th><th>介绍</th><th>操作</th></thead>");
 													$.each(data, function(){
 														 $("#column_table_id").append("<tr><td>"+this.id+"</td><td>"+this.columnName+"</td><td>"+this.introduction+"</td><td>修改</td></tr>");
 												    });
 												}
 										 });
 		                    });
 		            });
 
 
 
 点击折叠面板时显示相应的面板
 $("#116").each(function(){
 		                $(this).click(
 		                    function(){   
 		                    	getStr(7);
 				                    	$.ajax({     
 											    url:"question_list",
 												type:"POST",
 												dataType:"json",
 												data:{},
 												success:function(data)
 												{   
 													var size;
 													$("#question_table_id").html("<thead><th>ID</th><th>主题</th><th>发布者</th><th>发布时间</th><th>操作</th></thead>");
 													$.each(data, function(){
 														 $("#question_table_id").append("<tr><td>"+this.id+"</td><td>"+this.title+"</td><td>"+this.user+"</td><td>"+this.date+"</td><td><a href=''>删除</a></td></tr>");
 												          size=size+1;
 													});
 													$("#page").append("<li><a href='#'>&laquo;</a></li>");
 													for(var i=1;i<=size;i++)
 														$("#page").append("<li><a href='#'>"+i+"</a></li>");
 													$("#page").append("<li><a href='#'>&raquo;</a></li>");
 												}
 										 });
 		                    });
 		            });
});
*/