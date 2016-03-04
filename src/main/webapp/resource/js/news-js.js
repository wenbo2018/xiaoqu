$(document).ready(function(){
  $("#click_like").click(function(){
	  $.ajax({     
		    url:"/click_like",
			type:"POST",
			dataType:"text",
			data:{"id":$("#click_like").attr("name")},
			success:function(data){   
				if(data=="yes"){
					$("#times-like").text(parseInt($("#times-like").text())+1);
				}else{
					alert("网络异常");
				}
			},
			error:function(data){
			}
	 });
  });
  
  function setCampaignData(data){   
  	total_page=0;
  	$.each(data, function(){
  		 $("#list-item").append("<div class='row' id='news-item'>"+
		                 "<div class='col-md-12' id='news-item-context'>"+
		                     "<div class='row'>"+
			                        "<div class='col-md-3'>"+
			                           "<a href='/news/content/"+this.id+"'><img src='"+this.urlTitle+"' id='question-list-picture' class='img-rounded'></a>"+
			                        "</div>"+
			                        "<div class='col-md-9'>"+
				                            "<div class='row'>"+
							                   "<div class='col-md-12' id='item-title'><a href='/news/content/"+this.id+"'><h3>"+this.title+"</h3></a></div>"+
							                   "<div class='row'>"+
							                      "<div class='col-md-7'>"+
							                      "</div>"+
							                      "<div class='col-md-5' id='news-item-attach'>"+
							                          "<p><a  class='aw-user-name'>时光</a> •"+this.date+"</span>"+
							                      "</div>"+
							                   "</div>"+
							                "</div>"+
			                        "</div>"+
		                     "</div>"+
		                 "</div>"+
		             "</div>");
        /*   
  		 total_page=parseInt(((this.count%10)==0)?(this.count/10):(this.count/10+1));*/
  	});
  }
  
});