<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>校趣</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap/css/bootstrap.min.css">
<script src="<%=request.getContextPath()%>/resource/bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
.col-md-3 img{height:120px;width:120px;}
</style>
</head>
<body>
<%@ include file="nav.jsp"%>
<div class="jumbotron">
    <div class="row">
				<!-- <h1>校趣</h1>
		        <p>让校园生活更加美好！</p>
	            <p><a class="btn btn-primary btn-lg" role="button">Learn more &raquo;</a></p> -->
	            <div class="col-md-12">
	            <img class="img-rounded"  src="<%=request.getContextPath()%>/resource/img/index.jpg" >
	            </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-8" >
                    <div class="row">
                      <div class="col-md-12">
	                         <div id="myCarousel" class="carousel slide">
							  <ol class="carousel-indicators">
							    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							    <li data-target="#myCarousel" data-slide-to="1"></li>
							    <li data-target="#myCarousel" data-slide-to="2"></li>
							  </ol>
							  <!-- Carousel items -->
							  <div class="carousel-inner">
							    <div class="active item"><img src="<%=request.getContextPath()%>/resource/img/123.jpg" class="img-rounded"></div>
							    <div class="item"><img src="<%=request.getContextPath()%>/resource/img/124.jpg" class="img-rounded"></div>
							    <div class="item"><img src="<%=request.getContextPath()%>/resource/img/122.jpg" class="img-rounded"></div>
							  </div>
							  <!-- Carousel nav -->
							  <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
							  <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
							</div>
                      </div>
                    </div>
				    <div class="row" id="item-main">
						        <div class="col-md-3">
						             <h3><p class="text-center">阅读</p></h3>
						           <a href="news/theme/1"><p class="text-center"><img src="<%=request.getContextPath()%>/resource/img/theme/theme1.png" class="img-rounded"></p></a>
						        </div>
						        <div class="col-md-3">
						            <h3><p class="text-center">音乐</p></h3>
						           <a href="news/theme/2"><p class="text-center"><img src="<%=request.getContextPath()%>/resource/img/theme/theme2.png" class="img-rounded"></p></a>
						        </div>
						        <div class="col-md-3">
						             <h3><p class="text-center">视频</p></h3>
						           <a href="news/theme/3"><p class="text-center"><img src="<%=request.getContextPath()%>/resource/img/theme/theme3.png" class="img-rounded"></p></a>
						        </div>
				                <div class="col-md-3">
				                   <h3><p class="text-center">科技</p></h3>
						           <a href="news/theme/4"><p class="text-center"><img src="<%=request.getContextPath()%>/resource/img/theme/theme4.png" class="img-rounded"></p></a>		        </div>
				    </div>
				    <div class="row" id="item-main">
						        <div class="col-md-3">
						             <h3><p class="text-center">游戏</p></h3>
						           <a href="news/theme/5"><p class="text-center"><img src="<%=request.getContextPath()%>/resource/img/theme/theme5.png" class="img-rounded"></p></a>
						        </div>
						        <div class="col-md-3">
						            <h3><p class="text-center">专辑</p></h3>
						           <a href="news/theme/6"><p class="text-center"><img src="<%=request.getContextPath()%>/resource/img/theme/theme6.png" class="img-rounded"></p></a>
						        </div>
						        <div class="col-md-3">
						             <h3><p class="text-center">旅行</p></h3>
						           <a href="news/theme/7"><p class="text-center"><img src="<%=request.getContextPath()%>/resource/img/theme/theme7.png" class="img-rounded"></p></a>
						        </div>
				                <div class="col-md-3">
				                   <h3><p class="text-center">创业</p></h3>
						           <a href="news/theme/8"><p class="text-center"><img src="<%=request.getContextPath()%>/resource/img/theme/theme8.png" class="img-rounded"></p></a>		       
						        </div>
				     </div>
        </div>
        <div class="col-md-4">
        </div>
    </div>
    <hr/>
  <%--   <footer>
        <p>&copy;CopyRight 华南理工大学自动学学院 2014</p><img src="<%=request.getContextPath()%>/resource/img/weixin.jpg" class="img-rounded">
    </footer> --%>
</div>
<%@ include file="bottom.jsp"%>
</body>
</html>