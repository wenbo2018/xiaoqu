<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
body{background-color:#F0F0F0;}
#main
{ width:80%;margin-left:10%; height:auto;background-color:#FFFFFF; margin-top:25px;position:relative;
float:left;
}

#text
{
   padding-left:2%;
}

#qu{
width:70%;
height:auto;
background: #FFFFFF;
float:left;position:relative;
border-right:1px solid #F0F0F0;
padding-left:2%;
padding-right:2%;
}

#fa{
width:29%;margin-left:0.3%;
float:left;
background: #FFFFFF;
height:auto;
}

#fa span {
	font-size:3vh;
	color:#333;
}
#fa h3 {
	margin-left:40%;
}

#item_img {
	width:80%; height:8vh;  float:left;position:relative;
}

#item_img img  {
	width:8%px; height:7vh; margin-top:1vh; 
	border-radius: 9px;
    -webkit-border-radius: 9px;
    -moz-border-radius: 9px;
}



#item{
border-top:1px solid #F0F0F0 ;
border-bottom:1px solid #F0F0F0 ;
position:relative;
float:left;
height:auto;
width:98%;
margin-left:1%;
}

#item_img {
	width:8%; height:8vh;  float:left;position:relative;
}

#item_img img  {
	width:8%px; height:7vh; margin-top:1vh; 
	border-radius: 9px;
    -webkit-border-radius: 9px;
    -moz-border-radius: 9px;
}
#item_content{margin-left:2%; height:8vh;margin-top:3vh; float:left;margin-left:1%;position:relative;}

#comment_content{
width:100%;
padding-left:1%;
padding-right:1%;
height:auto;
float:none;
}

</style>
</head>
<body>
<%@ include file="../../jsp/nav.jsp"%>
<div  id="main">
    <div id="qu">
	    <div class="page-header">
	       <div class="title">
	          <h3 >${question.title}</h3>
	       </div>
		   <div class="tool">
		   </div>
		</div>
		<div id="text">
		  <p>${question.content}</p>
		</div>
	    <div class="page-header">
		   <h4>最新评论</h4>
		</div>
		<c:forEach items="${listComment}" var="comment">

		<div id="item">
				        <div id="item_img">
				        <a class="aw-user-name hidden-xs" data-id="605" href="" rel="nofollow">
					    <img src="../../resource/img/user/${comment.user.profile}" alt="" /></a>	
				        </div>
					    
					    <div class="aw-question-content" id="item_content">
						<p><a class="aw-question-tags">默认分类</a>•<a href="" class="aw-user-name">${comment.user.nickname}</a> 
						<span class="text-color-999">的评论• 5人点赞 •  2015-10-11 22:11 </span>
						<a  class="pull-right text-color-999">回复</a>
						</p><br>
					    </div>
	    </div>
						<div id="comment_content">
						<p>${comment.content}</p>
						</div>
		</c:forEach>
		
		
		<div class="page-header">
		   <h4>添加评论</h4>
		</div>
		
		<c:if test="${not empty session_login_username}">
		<textarea id="editor"  data-autosave="editor-content" autofocus required></textarea>
	    <br>
	    <button id="add_Comment"  class="btn btn-success">发布</button>
		</c:if>
	    
	    <c:if test="${ empty session_login_username}">
		<div class="page-header">
		   <h4>要回复问题请先<a href="/register">注册</a>或<a href="/login">登录</a></h4>
		</div>
		</c:if> 
	</div> 
	<div id="fa">
	          <h3><span>发起人</span></h3>
	          
	          <h3><a href="addAttention">关注</a></h3>
	          <h3><a href="cancelAttention">取消关注</a></h3>
	          
	          <hr>
	          <div id="item_img">
				        <a class="aw-user-name hidden-xs" data-id="605" href="" rel="nofollow">
					    <img src="../../resource/img/user/${question.user.profile}" alt="" /></a>	
			  <br>
	</div> 
</div>

</body>
</html>		     
		     