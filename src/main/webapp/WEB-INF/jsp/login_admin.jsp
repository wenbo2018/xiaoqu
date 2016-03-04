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
#contaer{margin:0 auto; width:1000px;background-color:#FFFFFF;height:800px;position:relative;border:2px solid #D8D8D8;margin-top:100px;}
#form-group{position: relative;width:400px;height:400px;margin-top:10px;margin-left:150px;background-color:#FFFFFF;float: left;}
#form-group button {
	float:left;
}
#disanfang{
position: relative;width:400px;height:400px;margin-top:10px;margin-left:10px;background-color:#FFFFFF;float: left;
}
</style>
</head>
<body>
<%@ include file="nav.jsp"%>
 <div id="contaer">
 <div class="page-header" align="center">
			   <h2>管理员用户登录</h2>
		   </div>
    <div id="form-group">
       <input type="text" style="margin-top:150px;width:250px;"  class="form-control" id="username" placeholder="用户名">
       <input type="password" style="margin-top:20px;width:250px;" class="form-control" id="password" placeholder="密码">
       <div class="checkbox"><label><input type="checkbox">记住我</label><label><a>忘记密码</a></label></div>
       <button type="submit" id="login_admin_button" class="btn btn-default">登录</button>
    </div>
    <div id="disanfang">
           <div class="page-header" align="center">
			   <h3>第三方账号登录</h3>
		   </div>
		   <img />
    </div>
</div>
</body>
</html>