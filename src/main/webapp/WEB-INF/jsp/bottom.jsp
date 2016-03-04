<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
#botton-a{padding:0px;margin-top:50px;}
#item-main{background-color:#FFFFFF;margin-top:10px;margin-left:2px;margin-right:2px;}
#botton-a{background-color:rgb(50, 50, 50);margin-bottom:0px;}
#weixin-contact img{height:120px;width:120px;}
</style>
<div id="botton-a">
        <div class="container">
		<div class="row">
	            <div class="col-md-4">
	                <a class="navbar-brand" >关于我们</a>
	            </div>
	            <div class="col-md-4">
	                <a class="navbar-brand">联系我们</a>
	               <a class="navbar-brand"> ©2015 www.xiaoqu.website
						校趣工作室
						华南理工大学自动化学院</a>
	            </div>
	            <div class="col-md-4" id="weixin-contact">
	               <p class="text-center"><img src="<%=request.getContextPath()%>/resource/img/weixin.jpg" class="img-rounded"></p>
	            </div>
        </div>
        </div>
</div>