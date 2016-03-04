<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>		     
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>小趣-阅读</title>
 <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery-1.11.3.min.js"></script>
<script src="<%=request.getContextPath()%>/resource/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/news-style.css" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/news-js.js"></script>
<style type="text/css">
#show-look-more{
width:200px;margin-top:20px;
}
</style>
<script type="text/javascript">
//初始化记载页面
var totalPage;
var curPage;
window.onload = function (){ 
	var totalPage=parseInt($("#list-item").attr("name"));
	if(totalPage>10){
		curPage=9;
	}else{
		$("#look-dis").hide();
	}
} 
</script>
</head>
<body>
<%@ include file="../../jsp/nav.jsp"%>
<div class="container" id="news-main-content">
    <div class="row">
		   <div class="col-md-8" id="news-item-list">
		             <div id="list-item" name="${itemsize}">
		             <c:forEach items="${campaignlist}" var="c">
		             <div class="row" id="news-item" style="padding:0px;">
		                 <div class="col-md-12" id="news-item-context">
		                     <div class="row" >
			                        <div class="col-md-3">
			                           <a href="/news/content/${c.id}"><img src="${c.urlTitle}" id="question-list-picture" alt="..." class="img-rounded "></a>
			                        </div>
			                        <div class="col-md-9" style="height:180px;">
				                            <div class="row" style="height:80px;padding:0px;"> <!-- 标题行 -->
							                   <div class="col-md-12" id="item-title" ><a href="/news/content/${c.id}"><h3>${c.title}</h3></a></div>
							                </div>
							                
							                <div class="row" style="height:70px;">
							                    <div class="col-md-12"></div>
							                </div>
							                
							                <div class="row" style="height:30px;padding:0px;">
								                      <div class="col-md-7" ></div>
								                      <div class="col-md-5" id="news-item-attach" style="padding:0px;">
								                          <p><a href="" class="aw-user-name">时光</a> •${c.time}</span>
								                      </div>
							                 </div>
							                
			                        </div>
		                     </div>
		                 </div>
		             </div>
		             </c:forEach>
		             </div>
		             <div  class="row">
		                <div class="col-md-4"></div>
		                <div class="col-md-4" id="look-dis">
		                   <p class="text-center"><button class=" btn btn-success" id="show-look-more">更多</button></p>
		                </div>
		             </div>
			 </div>
	        <div class="col-md-4" id="recommend">
			       <div class="col-md-12" id="nav-question-class">
	                   <p class="text-center"><a>问答Top10</a></p>
	               </div>
	               <div class="col-md-12" id="question-top10">
	                   <p class="text-left"><a>10套超漂亮的Bootstrap UI KIT(已转Html格式) | 设计达人</a></p>
	                   <p class="text-left"><a>10套超漂亮的Bootstrap UI KIT(已转Html格式) | 设计达人</a></p>
	                   <p class="text-left"><a>10套超漂亮的Bootstrap UI KIT(已转Html格式) | 设计达人</a></p>
	               </div> 
	               
	               <div class="col-md-12" id="recommend-question">
	                   <p class="text-center"><a>推荐问题</a></p>
	               </div>
	               <div class="col-md-12" id="question-top10">
	                   <p class="text-left"><a>10套超漂亮的Bootstrap UI KIT(已转Html格式) | 设计达人</a></p>
	                   <p class="text-left"><a>10套超漂亮的Bootstrap UI KIT(已转Html格式) | 设计达人</a></p>
	                   <p class="text-left"><a>10套超漂亮的Bootstrap UI KIT(已转Html格式) | 设计达人</a></p>
	               </div>  
			</div>	 
    </div>
</div>
<%@ include file="../../jsp/bottom.jsp"%>
</body>
</html>		     
		     