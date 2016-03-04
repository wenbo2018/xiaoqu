$(function(){
$(".subNav").click(function(){
			$(this).toggleClass("currentDd").siblings(".subNav").removeClass("currentDd")
			$(this).toggleClass("currentDt").siblings(".subNav").removeClass("currentDt")	
			// 修改数字控制速度， slideUp(500)控制卷起速度
			$(this).next(".navContent").slideToggle(500).siblings(".navContent").slideUp(500);
	})	
})

/***************************html编辑器初始化**********************************/
	$(function(){
	toolbar = [ 'title', 'bold', 'italic', 'underline', 'strikethrough',
	'color', '|', 'ol', 'ul', 'blockquote', 'code', 'table', '|',
	'link', 'image', 'hr', '|', 'indent', 'outdent' ];
	var editor = new Simditor( {
	textarea : $('#campaign_editor'),
	placeholder : '这里输入内容...',
	toolbar : toolbar, //工具栏
	upload : {
	url : 'ImgUpload', //文件上传的接口地址
	params: null, //键值对,指定文件上传接口的额外参数,上传的时候随文件一起提交
	fileKey: 'userPicture', //服务器端获取文件数据的参数名
	connectionCount: 3,
	leaveConfirm: '正在上传文件'
	}
	});
	})
/***************************html编辑器初始化**********************************/	



function getStr(id)
{
	    $("#table_id").empty();
	 	$("#campaign_list_div").hide();
	 	$("#campaign_add_div").hide();
	 	$("#campaign_verify_div").hide();
	 	$("#welcome").hide();
	 switch(id)
	 {
	 case 0:$("#welcome").show();
	       break;
	 case 1:$("#campaign_list_div").show();
		  break;
	 case 2:$("#campaign_add_div").show();
			break;
	 case 3:$("#campaign_verify_div").show();
	 break;
	 }
}


//定义分页全局变量
var total_page;
var cur_page=1;

$(document).ready(function() {  
	
	$("#0").each(function(){
        $(this).click(
            function(){   
            	getStr(0);
            });
    });
/*点击折叠面板时显示相应的面板*/
$("#112").on("click",function(){ 
	getStr(1);
    $.ajax({     
    url:"list",
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
});

//将campaigm数据显示到html中
function setCampaignData(data)
{   
	total_page=0;
	$("#table_id").empty();
	$("#table_id").html("<thead><th>ID</th><th>题目</th><th>所属板块</th><th>发布时间</th><th>状态</th><th>操作</th></thead>");
	$.each(data, function(){
		 $("#table_id").append("<tr><td>"+this.id+"</td><td><a href='/news/content/"+this.id+"' " +
		 		"target='_Blank' >"+this.title+"</a></td><td>"+this.classId+"</td><td>"+this.time+"</td><td>"+this.state+"</td>" +
		 				"<td><button type='button' id='campaignDelete'  name='"+this.id+"' class='btn btn-danger'>删除</button></td></tr>");
         
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



//类别选择时触发事件
$("#select_change").change(function(){$.ajax({     
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

//进入到发布咨询页面
$("#114").each(function(){$(this).click(function()
		{   
	       getStr(3);
	       
	    });
});



//发布campaign
$("#canmpaignManager_canmpaign_add").each(function()
{
    $(this).click(function()
    		{
            	$.ajax(
            			{     
						    url:"campaign_add",
							type:"POST",
							dataType:"text",
							data:{"title":$("#campaign_title").val(),"classId":$("#campaign_id").val(),"content":$('#campaign_editor').val()},
							success:function(data)
							{   
	                           alert("发布成功");
	                           $("#campaign_title").val("");
	                           editor = new Simditor({textarea: $('#campaign_editor')});
	        				   editor.setValue("");
						    }
					 });
           });
});

//将campaigm数据显示到html中
function setCampaignDataLast(data)
{
	$("#table_id").empty();
	var size=0;
	$("#table_id").html("<thead><th>ID</th><th>题目</th><th>所属板块</th><th>发布时间</th><th>状态</th><th>操作</th></thead>");
	$.each(data, function(){
		 $("#table_id").append("<tr><td>"+this.id+"</td><td><a href='/news/content/"+this.id+"' " +
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

function setPageNumberColor()
{
	 for(var i=1;i<=total_page;i++)
	$(".pagination li a").eq(i).css("background-color","#FFFFFF");
	$(".pagination li a").eq(cur_page).css("background-color","#00BFFF");
}

//活动删除
 $("#table_id").on("click","#campaignDelete",function(){
 	 $.ajax({     
 		    url:"campaign_delete",
 			type:"POST",
 			dataType:"text",
 			data:{"campaignId":parseInt($(this).attr("name"))},
 			success:function(data){   
 				if(data=="yes")
 				{
 					alert("删除成功");
					}else
					{
						alert("删除失败");
					}
 			   }
 	 });
   });
});







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