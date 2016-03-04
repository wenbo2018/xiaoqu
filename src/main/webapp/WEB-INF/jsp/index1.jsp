<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>		     
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>校趣</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/slide.js"></script>
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/slide.css" type="text/css" /> --%>
<link rel="stylesheet" href="http://xiaoqu.website/resource/css/slide.css" type="text/css" />

<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/index.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap/css/bootstrap.min.css">
<script src="<%=request.getContextPath()%>/resource/bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
$(document).ready(function() {
	$(".slideInner").slide({
		slideContainer: $('.slideInner a'),
		effect: 'easeOutCirc',
		autoRunTime: 5000,
		slideSpeed: 1000,
		nav: true,
		autoRun: true,
		prevBtn: $('a.prev'),
		nextBtn: $('a.next')
	});
});
</script>
</head>
<body>
<%@ include file="nav.jsp"%>
<div class="slides">
	<div class="slideInner"> 
		<a href="#" style="background: url(<%=request.getContextPath()%>/resource/img/slide1.jpg) no-repeat;">
			<div class="moveElem img1" rel="0,easeInOutExpo"> <img src="<%=request.getContextPath()%>/resource/img/slide1p1.png" /> </div>
		</a>
		
		<a href="#" style="background: url(<%=request.getContextPath()%>/resource/img/slide2.jpg) no-repeat">
			<div class="moveElem img1" rel="0,easeInOutExpo"> <img src="<%=request.getContextPath()%>/resource/img/slide2p1.png" /> </div>
		</a>
		
		<a href="#" class="slide3" style="background: url(<%=request.getContextPath()%>/resource/img/slide3.jpg) no-repeat;">
			<div class="moveElem img1" rel="0,easeInOutExpo"> <img src="<%=request.getContextPath()%>/resource/img/slide3p1.png" /> </div>
		</a>
		
		<a href="#" style="background: rgb(113, 209, 231);">
			<div class="moveElem img1" rel="0,easeInOutExpo"> <img src="<%=request.getContextPath()%>/resource/img/slide1p1.png" /> </div>
		</a>
		
		<a href="#" style="background: rgb(178, 44, 44);">
			<div class="moveElem img1" rel="0,easeInOutExpo"> <img src="<%=request.getContextPath()%>/resource/img/slide1p1.png" /></div>
		</a>
	</div>
	<div class="nav">
		<a class="prev" href="javascript:;"></a>
		<a class="next" href="javascript:;"></a>
	</div>
</div>
<div id="main_content">
        <div id="main_content_item">
          <a href="news/theme/1"><img src="<%=request.getContextPath()%>/resource/img/theme/theme1.png"/></a>
        </div>
        <div id="main_content_item">
          <a href="news/theme/2"><img src="<%=request.getContextPath()%>/resource/img/theme/theme2.png"/></a>
        </div>
        <div id="main_content_item">
          <a href="news/theme/3"><img src="<%=request.getContextPath()%>/resource/img/theme/theme3.png"/></a>
        </div>
        
        <div id="main_content_item">
          <a href="news/theme/4"><img src="<%=request.getContextPath()%>/resource/img/theme/theme4.png"/></a>
        </div>
        <div id="main_content_item">
          <a href="news/theme/5"><img src="<%=request.getContextPath()%>/resource/img/theme/theme5.png"/></a>
        </div>
        <div id="main_content_item">
          <a href="news/theme/6"><img src="<%=request.getContextPath()%>/resource/img/theme/theme6.png"/></a>
        </div>
        
        <div id="main_content_item">
          <a href="news/theme/7"><img src="<%=request.getContextPath()%>/resource/img/theme/theme7.png"/></a>
        </div>   
        
        <div id="main_content_item">
          <a href="news/theme/8"><img src="<%=request.getContextPath()%>/resource/img/theme/theme8.png"/></a>
        </div>
        
        <div id="main_content_item">
          <a href="news/theme/9"><img src="<%=request.getContextPath()%>/resource/img/theme/theme9.png"/></a>
        </div>  
</div>
<%@ include file="copy_right.jsp"%>
</body>
</html>		     
		     