<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta property="wb:webmaster" content="d58b96bc05a14870" />
<title>${campaign.title}</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/new-main-style.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/news-js.js"></script>
<style type="text/css">
.col-md-1 img{
height:50px;width:50px;padding-left:2px;
}
.col-md-11 p{
line-height:20px;margin-top:15px;color: #666;
}
#pro_art img {
	height:180px;width:200px;
}

#adv img{
width: 250px;height:200px;padding-top:20px;
 }
 
 #cam-content img {
 max-height:720px; 
 max-width:840px; 
 width:expression(this.width > 840 && this.height < this.width ? 840: true); 
 height:expression(this.height > 720 ? 720: true);
 }
</style>
</head>
<body>
<%@ include file="../../jsp/nav.jsp"%>
<div class="container" id="news-main-context">
<div class="row">
    <div class="col-md-9" id="main-content">
	        <div class="row">
	        <div class="col-md-12">
	            <h2><p class="text-center">${campaign.title}</p></h2>
	        </div>
	        <div class="row">
	            <div class="col-md-1">
	            <p class="text-right"><img alt="" src="<%=request.getContextPath()%>/resource/img/ab.png" class="img-circle"></p>
	            </div>
	            <div class="col-md-11">
	              <p class="text-left">时光  发布于•${campaign.time}• 点击量• ${campaign.click_times}</p>
	            </div>
	        </div>
	        <hr>
	        <div class="col-md-12" id="cam-content">
	            <p >${campaign.content }</p>
	        </div>
	        <br>
	        <div class="row">
	           <div class="col-md-5">
	           </div>
	           <div class="col-md-2">
	           <p class="text-center"><button id="click_like" name="${campaign.id}" class="btn btn-large btn-danger">赞(<b id="times-like">${campaign.click_like}</b>)</button></p>
	           </div>
	          </div>
	       </div>
	       <div class="col-md-12">
		       <div class="page-header">
				      <h3>相关推荐</h3>
			    </div>
	       </div>
	       <div class="col-md-12">
		       <div class="row">
		          <div class="col-md-3" >
		              <div class="col-md-12" id="pro_art"><p class="text-center"><img alt="" src="<%=request.getContextPath()%>/resource/img/ab.png" class="img-rounded"></p></div>
		              <div class="col-md-12"><p>为什么越想学习，越抽不出时间来学习？</p></div>
		          </div>
		          <div class="col-md-3">
		              <div class="col-md-12" id="pro_art"><p class="text-center"><img alt="" src="<%=request.getContextPath()%>/resource/img/ab.png" class="img-rounded"></p></div>
		              <div class="col-md-12"><p>为什么越想学习，越抽不出时间来学习？</p></div>
		          </div>
		          <div class="col-md-3">
		              <div class="col-md-12" id="pro_art"><p class="text-center"><img alt="" src="<%=request.getContextPath()%>/resource/img/ab.png" class="img-rounded"></p></div>
		              <div class="col-md-12"><p>为什么越想学习，越抽不出时间来学习？</p></div>
		          </div>
		          <div class="col-md-3">
		              <div class="col-md-12" id="pro_art"><p class="text-center"><img alt="" src="<%=request.getContextPath()%>/resource/img/ab.png" class="img-rounded"></p></div>
		              <div class="col-md-12"><p>为什么越想学习，越抽不出时间来学习？</p></div>
		          </div>
		       </div>
	       </div>
	</div>
    <div class="col-md-3">
           <div class="col-md-12" id="adv">
		       <a href="http://cunguan.tangpin.me/" target="_blank"><p class="text-center"><img alt="" src="<%=request.getContextPath()%>/resource/img/tp.png" class="img-rounded"></p></a>
	       </div>
	       <div class="col-md-12" id="adv">
		       <div class="page-header">
				      <h3>合作媒体</h3>
			    </div>
	       </div>
	       <div class="col-md-12" id="adv">
		       <a href="http://cunguan.tangpin.me/" target="_blank"><p class="text-center"><img alt="" src="<%=request.getContextPath()%>/resource/img/wb.jpg" class="img-rounded"></p></a>
	       </div>
    </div>
</div>
</div>
<%@ include file="../../jsp/bottom.jsp"%>
</body>
</html>