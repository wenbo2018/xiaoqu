$(document).ready(function() {  
	  $("#login_button").click(function()
		{
	       if($("#username").val()==""||$("#password").val()=="")
	       {
	      	   alert("用户名或密码不能为空");
	      	 }else{   
	      		 $.ajax({     
						    url:"/login",
							type:"POST",
							dataType:"text",
							data:{"username":$("#username").val(),"password":$("#password").val()},
							success:function(data)
							{   
								if(data=="isValid")
								{
									
									location.href="/";
								}else
								{
									$("#username").val("用户名或密码错误");
								}
							},
							error:function(data)
							{
								
							}
					 });
	           }
		  });
	  
	  
	  $("#login_admin_button").click(function(){
	       if($("#username").val()==""||$("#password").val()==""){
	      	   alert("用户名或密码不能为空");
	      	 }else{   
	      		 $.ajax({     
						    url:"login_admin",
							type:"POST",
							dataType:"json",
							data:{"username":$("#username").val(),"password":$("#password").val()},
							success:function(data){   
								if(data=="isValid")
								{
									alert("注册成功");
									location.href="/";
								}else
								{
									$("#username").val("用户名已经被占用");
								}
							},
							error:function(){
								alert("请求失败");
							}
					 });
	           }
		  });
	  
	  
		  $("#register_button").click(function(){
		         if($("#username").val()==""||$("#password").val()==""||$("#email").val()==""){
		        	   alert("用户名密码email不能为空");
		        	 }else{   
		        		 $.ajax({     
							    url:"register",
								type:"POST",
								dataType:"text",
								data:{"username":$("#username").val(),"password":$("#password").val(),"email":$("#email").val()},
								success:function(data){   
									if(data=="isValid")
									{
										alert("注册成功");
										location.href="/";
									}else
									{
										$("#username").val("用户名已经被占用");
									}
								},
								error:function(){
									alert("请求失败");
								}
						 });
		             }
			  });
	
	
	
	
$("#submit_comment").each(function(){
$(this).click(
    function(){   
    	       if($("#comment_text").val()=="")
    	    	   {
    	    	      alert("内容不能为空");
    	    	   }else{
            	   $.ajax({     
					    url:"comment_add",
						type:"POST",
						dataType:"json",
						data:{"campaign_id":$(this).attr("name"),"comment":$("#comment_text").val()},
					    success:function(data){ 
					    	 alert("评论成功");
					    	 $("#comment_list").prepend("<div id='list_there'><div id='list_there_img' ><img src='/scut/resource/img/ab.png'/></div><div id='list_there_content'><p>"+data.comment+"</p><b>发布时间："+data.date+"--发布者："+data.user+"</b></div></div>");
						},
						error:function(){
							alert("请求失败");
						}
			         });
    	    	   }
    	    });
     });

$("#load_more_button").each(function(){
	$(this).click(
	    function(){   
	            	$.ajax({     
						    url:"load_more",
							type:"POST",
							dataType:"json",
							data:{"campaign_id":$(this).attr("name"),"page_sum":$("#comment_list p").size()},
						    success:function(data){ 
						    	$.each(data, function(){
									 $("#comment_list").append("<div id='list_there'><div id='list_there_img' ><img src='<%=request.getContextPath()%>/resource/img/ab.png'/></div><div id='list_there_content'><p>"+this.content+"</p><b>发布时间："+this.date+"--发布者："+this.username+"</b></div></div>");
							    });
							},
							error:function(){
								alert("请求失败");
							}
				     });
	           });
	     });

$("#show_more_button").each(function(){
	$(this).click(
	    function(){   
	            	$.ajax({     
						    url:"show_more",
							type:"POST",
							dataType:"json",
							data:{"classId":$(this).attr("name"),"page_sum":$("#list img").size()},
						    success:function(data){ 
						    	$.each(data, function(){
									 $("#list").append(" <div id='list_item'><div id='list_item_img' ><a href='main_content?id="+this.id+"'><img src='/scut/resource/img/ab.png' /></a></div><div id='list_item_content'><h4><a href='main_content?id="+this.id+"'>"+this.title+"</a></h4><p>"+this.content+"</p></div></div>");
							    });
							},
							error:function(){
								alert("请求失败");
							}
				     });
	           });
	     });
});




