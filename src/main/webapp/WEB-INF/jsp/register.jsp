<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/user/user.css" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/index.js"></script>
 <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap/css/bootstrap.min.css">
<script src="<%=request.getContextPath()%>/resource/bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
body{background-color:#F0F0F0;position:relative;}
#contaer{margin:0 auto; width:800px;background-color:#FFFFFF;height:600px;position:relative;border:2px solid #D8D8D8;margin-top:200px;}
#form-group{position: relative;width:400px;height:400px;margin-top:30px;position:relative;margin-left:250px;background-color:#FFFFFF;}
#form-group button {
	float:left;
}

</style>
</head>
<body>
<%@ include file="nav.jsp"%>
 <div id="contaer">
     <h3 align="center" style="margin-top:20px;">新用户注册</h3>
    <div id="form-group">
       <input type="text" style="margin-top:100px;width:250px;"  class="form-control" id="username" placeholder="用户名">
       <input type="text" style="margin-top:20px;width:250px;"  class="form-control" id="email" placeholder="邮箱">
       <input type="password" style="margin-top:20px;width:250px;" class="form-control" id="password" placeholder="密码">
       <div class="checkbox"><label><input type="checkbox">我同意</label><label><a>用户协议</a></label></div>
       <button type="submit" id="register_button" class="btn btn-default">注册</button>
    </div>
</div>
</body>
</html>