<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html >
<html>		     
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>校趣</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery-1.11.3.min.js"></script>
 <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery-1.11.3.min.js"></script>
<script src="<%=request.getContextPath()%>/resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/user/user.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/ajaxupload.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/question/question.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/simditor-2.3.2/styles/simditor.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/simditor-2.3.2/scripts/module.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/simditor-2.3.2/scripts/hotkeys.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/simditor-2.3.2/scripts/uploader.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/simditor-2.3.2/scripts/simditor.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/question-style.css">
</head>

<script type="text/javascript">
$(function(){
	toolbar = [ 'title', 'bold', 'italic', 'underline', 'strikethrough',
	'color', '|', 'ol', 'ul', 'blockquote', 'code', 'table', '|',
	'link', 'image', 'hr', '|', 'indent', 'outdent' ];
	var editor = new Simditor( {
	textarea : $('#editor'),
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
</script>
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


</style>
<body>
<%@ include file="../../jsp/nav.jsp"%>
<div class="jumbotron">
</div>
<div class="container" id="main-content">
    <div class="row">
		   <div class="col-md-8" >
		             <div class="row" style="border:1px solid #D8D8D8;border-radius:5px;">
		                 <div class="col-md-12" id="question-big-title" name="${question.id}">
		                      <div class="row">
		                         <div class="col-md-8">
		                            <h2>${question.title}</h2>
		                         </div>
		                         <c:if test="${not empty session_login_username}">
		                         <div class="col-md-4">
		                            <p class="text-right">
		                            <button id="user_like" class="btn btn-success"><b id="userlike">${userlike}</b></button>		                        
		                            </button>&nbsp;<button class="btn btn-info">收藏</button></p>
		                         </div>
		                         </c:if>
		                      </div>
		                      <div class="col-md-12">
		                      <p><a href="" class="aw-user-name">${question.user.nickname}</a> 
						      <span class="text-color-999">发起的问题 • 1 人关注 •${fn:length(question.comments)}个回复 • ${question.clickTimes}次浏览 • ${question.date}</span>
		                      </div>
		                 </div>
		             </div>
		             
		             <div class="col-md-12" id="question-content" name="${question.id}" style="border:1px solid #D8D8D8;border-radius:5px;">
		                 <p class="text-left">问题描述</p>
		                 <p>${question.content}</p>
		             </div>
		             <br>
		             <br>
		              <div class="col-md-12" style="border:1px solid #D8D8D8;border-radius:5px;">
		                 <p class="text-left">最新评论</p>
		             </div>
		             
		             <c:forEach items="${listComment}" var="comment">
		             <div class="col-md-12"style="margin-top:10px; padding-top:3px;">
			             <div class="row">
	                        <div class="col-md-1">
	                           <img src="<%=request.getContextPath()%>/resource/img/ab.png" alt="..." id="question-comment-list-picture" class="img-rounded ">
	                        </div>
	                        <div class="col-md-11">
		                           <div class="row">
		                              <div class="col-md-12" id="question-title">
	                                       <p><a href="" class="aw-user-name">${comment.user.nickname}</a> 
						                   <span class="text-color-999">的评论• 5人点赞 •  2015-10-11 22:11 </span></p>
		                              </div>
		                           </div>
	                        </div>
	                     </div>
                    </div>
                    <div class="col-md-12">
                       <p>${comment.content}</p>
                    </div>
                    </c:forEach>
                    <div class="col-md-12" style="border:1px solid #D8D8D8;border-radius:5px; padding-bottom:10px;margin-bottom:100px;">
                      <br>
                      <c:if test="${not empty session_login_username}">
						<textarea id="editor"  data-autosave="editor-content" autofocus required></textarea>
					    <br>
					    <button id="add_Comment"  class="btn btn-success"  style="height:50px;width:15%;font-size:20px;">发布</button>
						<br>
						</c:if>
						<c:if test="${ empty session_login_username}">
						<div class="col-md-12">
						   <h4>要回复问题请先<a href="/register">注册</a>或<a href="/login">登录</a></h4>
						</div>
						</c:if>
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
			</div>
			
			<div class="col-md-4">
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


</body>
</html>		     
		     