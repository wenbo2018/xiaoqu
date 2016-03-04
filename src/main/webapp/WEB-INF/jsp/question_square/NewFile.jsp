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
</head>
<style type="text/css">



#item{
border-top:1px solid #F0F0F0 ;
position:relative;
float:left;
height:10vh;
width:100%;
height: auto;
background-color:#ffffff;
}
#item_img {
	width:8%; height:8vh;  float:left;position:relative;margin-left:5px;
}
#item_img img  {
	width:100%; height:7vh; margin-top:0.5vh; 
	border-radius: 9px;
    -webkit-border-radius: 9px;
    -moz-border-radius: 9px;
}
#item_content{margin-left:2%; height:8vh; float:left;margin-left:1%;position:relative;}
.text-color-999, .aw-placeholder, .category dl dd span, .aw-search-dropdown-list li > span, .aw-search-dropdown-list li.question a span, .aw-side-bar dd, .aw-question-comment-box .aw-mod-head .aw-notopic-sort, .aw-question-edit .aw-mod-body .pull-right, .aw-common-list .aw-question-replay-count, .aw-question-tags a, .aw-feed-list .aw-upload-file-list a, .aw-agree-by .aw-agree-by-show, .aw-agree-by .aw-user-name, .aw-my-notifications .aw-mod-head h2 span, .aw-my-notifications .aw-mod-body ul li.active span, .aw-publish-title-dropdown p span, .aw-side-bar-mod-publish .aw-side-bar-mod-body p, .aw-side-bar-mod-topic-edit .aw-side-bar-mod-body p, .aw-new-message-tips .aw-mod-head .pull-right, .aw-new-message-tips-close span, .aw-mod-search-result .aw-search-result-tags, .aw-publish-box .aw-publish-box-supplement, .aw-first-login .aw-mod-head ul li.active em, .aw-first-login .aw-complete-data .aw-complete-data-img span{color:#999;}
.aw-text-color-666, .aw-dropdown-menu ul a, .alert, .aw-nav-tabs > li.active a, .aw-user-nav-dropdown .aw-dropdown-menu  li > a, .aw-search-dropdown-list li a, .aw-search-dropdown-list li.question a span.active, .aw-comment-list, .aw-question-edit .aw-mod-body, .aw-question-tags a:hover, .aw-topic-content .aw-topic-title, .aw-edit-topic:hover, .aw-mod-invite-friend .aw-invite-box p, .aw-tabs ul li a, .aw-footer, .aw-card-tips, .aw-mod-replay-box .aw-mod-head p label, .markItUpPreviewFrame, .aw-404-wrap p, .aw-ie6 .pull-right p{color:#666;}
.aw-common-list .aw-question-replay-count em, .markItUpPreviewFrame .title, h1, h2, h3{color: #333;}

#list-content{margin-top:2px;}
body{background-color:#F0F0F0;}
#select-bar{background-color:#ffffff;}
.question-label{height:6vh;background-color:#ffffff;border-top:1px solid #F0F0F0 ;}

.question-master{background-color:#ffffff;border-top:1px solid #F0F0F0 ;}
.question-master-item{border-top:1px solid #F0F0F0 ;
position:relative;
float:left;
height:10vh;
width:100%;
height: auto;
background-color:#ffffff;}
.question-master-item_img{width:26%; height:8vh;  float:left;position:relative;margin-left:5px;}
.question-master-item_img img {
	width:100%; height:7vh; margin-top:0.5vh; 
	border-radius: 9px;
    -webkit-border-radius: 9px;
    -moz-border-radius: 9px;
}



</style>
<body>
<%@ include file="../../jsp/nav.jsp"%>
<div class="jumbotron">
    <div class="container">
				<h1>问题广场</h1>
    </div>
</div >

<div  id="select-bar">
<header class="navbar" id="top" role="banner">
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
	   <li id="0"><a>全部问题</a></li>
	   <li id="1" ><a>约球</a></li>
	   <li id="2"><a >失误招领</a></li>
	   <li id="3" ><a>考试求助</a></li>
	   <li id="4"><a>二手买卖</a></li>
  </div>
</div>
<div>
<div class="container" id="list-content">
    <div class="row">
		        <div class="col-md-9">
		               <div class="question-label">
				              <a href="#" class="navbar-brand" id="question-label">全部问题</a>
				               <form class="navbar-form navbar-right" role="search">
					              <a href="#" class="navbar-brand" id="question-label">最新</a>
					              <a href="#" class="navbar-brand" id="question-label">热门</a>
				              </form>
				      </div>
			           <div id="list_item">
					   <c:forEach items="${question}" var="q">
						      <div id="item">
					        <div id="item_img">
					        <a class="aw-user-name hidden-xs" data-id="605" href="" rel="nofollow">
						    <img src="../resource/img/user/${q.user.profile}" alt="" /></a>	
					        </div>
						    
						    <div class="aw-question-content" id="item_content">
							<h4><a href="question_square/questions/${q.id}"  target="_Blank">${q.title}</a></h4>
							<p><a class="aw-question-tags">默认分类</a>•<a href="" class="aw-user-name">${q.user.nickname}</a> 
							<span class="text-color-999">发起了问题 • 1 人关注 •${fn:length(q.comments)}个回复 • ${q.clickTimes}次浏览 • ${q.date}</span>
							<a  class="pull-right text-color-999">回复</a>
							</p>
						    </div>
					   </div>
					  </c:forEach>
			    </div>
		           
		              
		           
		           
		        </div>
		        <div class="col-md-3">
			         <div class="question-label">
					              <a href="#" class="navbar-brand">问题达人</a>
					 </div >
					 <div class="question-master">
					   <div class="question-master-item">
						        <div class="question-master-item_img">
						        <a class="aw-user-name hidden-xs" data-id="605" href="" rel="nofollow">
							    <img src="../resource/img/ab.png" alt="" /></a>	
						        </div>
							    <div class="aw-question-content" id="item_content">
								<h4><a href="#" target="_Blank">时光</a></h4>
								<p> 399人关注 •</span><a  class="pull-right text-color-999">回答•560</a>
								</p>
							    </div>
						   </div>
					 </div> 
					 <div class="question-master-item">
						        <div class="question-master-item_img">
						        <a class="aw-user-name hidden-xs" data-id="605" href="" rel="nofollow">
							    <img src="../resource/img/ab.png" alt="" /></a>	
						        </div>
							    <div class="aw-question-content" id="item_content">
								<h4><a href="#" target="_Blank">时光</a></h4>
								<p> 399人关注 •</span><a  class="pull-right text-color-999">回答•560</a>
								</p>
							    </div>
					 </div>
					 <div class="question-master-item">
						        <div class="question-master-item_img">
						        <a class="aw-user-name hidden-xs" data-id="605" href="" rel="nofollow">
							    <img src="../resource/img/ab.png" alt="" /></a>	
						        </div>
							    <div class="aw-question-content" id="item_content">
								<h4><a href="#" target="_Blank">时光</a></h4>
								<p> 399人关注 •</span><a  class="pull-right text-color-999">回答•560</a>
								</p>
							    </div>
					 </div>
					 <div class="question-master-item">
						        <div class="question-master-item_img">
						        <a class="aw-user-name hidden-xs" data-id="605" href="" rel="nofollow">
							    <img src="../resource/img/ab.png" alt="" /></a>	
						        </div>
							    <div class="aw-question-content" id="item_content">
								<h4><a href="#" target="_Blank">时光</a></h4>
								<p> 399人关注 •</span><a  class="pull-right text-color-999">回答•560</a>
								</p>
							    </div>
					 </div>
					 <div class="question-master-item">
						        <div class="question-master-item_img">
						        <a class="aw-user-name hidden-xs" data-id="605" href="" rel="nofollow">
							    <img src="../resource/img/ab.png" alt="" /></a>	
						        </div>
							    <div class="aw-question-content" id="item_content">
								<h4><a href="#" target="_Blank">时光</a></h4>
								<p> 399人关注 •</span><a  class="pull-right text-color-999">回答•560</a>
								</p>
							    </div>
					 </div>
				 </div> 
				 
    </div>
</div>


</div>
</body>
</html>		     
		     