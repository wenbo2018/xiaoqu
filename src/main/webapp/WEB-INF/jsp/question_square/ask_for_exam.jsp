<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>		     
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>校趣</title>
 <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery-1.11.3.min.js"></script>
<script src="<%=request.getContextPath()%>/resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/ajaxupload.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/question/question.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/question-style.css">
<style type="text/css">
.jumbotron{background-color:red;width:100%;height:300px;}
.jumbotron img {
	height: 252px;width:100%;
}
</style>
<script type="text/javascript">
//初始化记载页面
var totalPage;
var curPage;
window.onload = function (){ 
	var totalPage=parseInt($("#list_item").attr("name"))%10==0
	?parseInt($("#list_item").attr("name"))/10:parseInt($("#list_item").attr("name"))/10+1;
	if(totalPage>1){
		curPage=1;
	}else{
		$("#look-dis").hide();
	}
} 
</script>
<style type="text/css">

.main_title{
height:40px;
    font-size:22px;
    font-family: "Microsoft YaHei" ! important;
    padding: 0px;
    line-height: 40px;
    margin:0px;
    color: #333;
}
.title_label{
    height:30px;
    font-size:18px;
    font-family: "Microsoft YaHei" ! important;
    padding: 0px;
    line-height: 30px;
    margin:0px;
    color: #333;
}
</style>
</head>
<body>
<%@ include file="../../jsp/nav.jsp"%>
<div class="jumbotron">
   <img alt="" src="../resource/img/slide2.png"  class="img-rounded">
</div >
<header class="navbar" id="question-nav" role="banner">
  <div class="container">
    <div class="navbar-header">
	       <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#bs-navbar" aria-controls="bs-navbar" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
    </div>
    <nav id="bs-navbar" class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
		   <li><a href="/question_square"><span class="main_title">全部问题</span></a></li>
		   <li><a href="/question_square/life"><span class="main_title">生活娱乐</span></a></li>
		   <li><a href="/question_square/lost_and_find"><span class="main_title">失误招领</span></a></li>
		   <li><a href="/question_square/ask_for_exam"><span class="main_title">考试求助</span></a></li>
		   <li><a href="/question_square/resources_share"><span class="main_title">资源共享</span></a></li>
	   </ul>
	   </nav>
  </div>
</header>
<div class="container" id="main-content">
    <div class="row">
		   <div class="col-md-8">
		             <div class="row" style="border:1px solid #D8D8D8;border-radius:5px;">
		                 <div class="col-md-12" id="nav-question-class">
		                      <div class="row">
		                         <div class="col-md-10">
		                          <p class="text-left"><a><span class="title_label">全部问题</span></a></p>
		                         </div>
		                         <div class="col-md-2">
		                          <p><a><span class="title_label">最新</span></a>&nbsp;<a><span class="title_label">热门</span></a></p>
		                         </div>
		                      </div>
		                 </div>
		             </div>
		             <div id="list_item" name="${itemsize}">
					 <c:forEach items="${question}" var="q">
		             <div class="row" id="question-list" style="border:1px solid #D8D8D8;border-radius:5px;">
		                 <div class="col-md-12">
		                     <div class="row">
		                        <div class="col-md-2">
		                         &nbsp; <img src="../../resource/img/user/${q.user.profile}" id="question-list-picture" alt="..." class="img-rounded ">
		                        </div>
		                        <div class="col-md-10" style="padding-left:0px;margin-left:0px;">
			                           <div class="row" style="padding-left:0px;margin-left:0px;">
			                              <div class="col-md-12" id="question-title" style="padding-left:0px;margin-left:0px;">
	                                        <h4><a href="question_square/questions/${q.id}"  target="_Blank">${q.title}</a></h4>
			                              </div>
			                           </div>
			                           <div class="row" style="padding-left:0px;margin-left:0px;">
			                              <div class="col-md-12" id="question-attach" style="padding-left:0px;margin-left:0px;">
			                                <p><a class="aw-question-tags">默认分类</a>•<a href="" class="aw-user-name">${q.user.nickname}</a> 
											<span class="text-color-999">发起了问题 • 1 人关注 •${fn:length(q.comments)}个回复 • ${q.clickTimes}次浏览 • ${q.date}</span>
			                              </div>
			                           </div>
		                        </div>
		                     </div>
		                 </div>
		             </div>
		             </c:forEach>
		             </div>
		             <br>
		            <div class="row">
		                <div class="col-md-4"></div>
		                <div class="col-md-4" id="look-dis">
		                   <p class="text-center"><button class=" btn btn-success" id="show-look-more" name="3">加 载 更 多</button></p>
		                </div>
		            </div>
			 </div>

	        <div class="col-md-4">
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
	                   <c:forEach items="${recoProblem}" var="rp">
	                   <p class="text-left"><a>${rp.title}</a></p>
	                   </c:forEach>
	               </div> 
			</div>
    </div>
</div>
</div>
<%@ include file="../../jsp/bottom.jsp"%>
</body>
</html>		     
		     