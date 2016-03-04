<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery-1.11.3.min.js"></script>
  <script src="<%=request.getContextPath()%>/resource/bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">

 #form-group1{width:250px;padding:20px;align:center;}
 input{float：left;
 margin-top:10px;}
</style>
</head>
<body>
<div id="form-group1">
				      <input type="text" class="form-control" id="name" placeholder="用户名">
				      <input type="text" class="form-control" id="name" placeholder="昵称">
				      <input type="text" class="form-control" id="name" placeholder="密码">
				      <input type="text" class="form-control" id="name" placeholder="email">
				      <label><input type="checkbox">男</label><label><input type="checkbox">女</label>
</div>
</body>
</html>