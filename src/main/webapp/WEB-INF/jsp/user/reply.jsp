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
 <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery-1.11.3.min.js"></script>
<script src="<%=request.getContextPath()%>/resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/user/user.js"></script>
<style type="text/css">
body{background-color:#F0F0F0;}

#head1{margin:0 auto; width:70%; margin-left:15%; height:300px;background: #FFFFFF;margin-top:25px;}
#head_picture{width:100px;padding:10px;margin-left:20px; }
#head_picture.img{width:100px;height:100px; border-radius:55px; float: left;}


#contaer{margin:0 auto; width:70%; margin-left:15%;height:auto;  margin-top:5px;background: #FFFFFF;}

#head{width:100%;height:45px;background-color: #181818;}

#home{margin-left:150px;font-weight:900;height:45px;width:100px; float:left;}
#home a{color:#C80000 ;font: bold 40px '新宋体'; text-decoration:none;}
#home a:hover{font: bold 40px '新宋体';color:#FFFFFF;text-decoration:none;}

#home1{margin-left:10px;font-weight:400;height:25px;width:300px; float:left;margin-top:5px; }
#home1 a{color:#C80000 ;font: bold 30px '新宋体'; text-decoration:none;}
#home1 a:hover{font: bold 30px '新宋体';color:#FFFFFF;text-decoration:none;}


#login_register{
	margin-right:50px;float:right;width:200px;
}
#login_register{margin-top:5px;}

li:hover .dropdown-menu {display: block;}
#text{
width:70%; margin-left:15%;height:auto;background: #FFFFFF;
}

</style>
</head>
<body>
<%@ include file="../../jsp/nav.jsp"%>
<div  id="head1">
    <div  id="head_picture">
       <img src="../../resource/img/a.jpg"/>    
    </div>
</div>
<div id="contaer">
     <nav class="navbar navbar-default navbar-static-top" role="navigation">
	   <div>
	      <ul class="nav navbar-nav">
	         <li class="active" id="0"><a href="#">动态</a></li>
	         <li id="1"><a>回复</a></li>
	         <li id="2"><a>我的问题</a></li>
	         <li id="3"><a>我发表的评论</a></li>
	      </ul>
	   </div>
    </nav>
</div>
<div id="text">

</div>
<%@ include file="../../jsp/copy_right.jsp"%>
</body>
</html>		     
		     