<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>		     
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>校趣</title>
 <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery-1.11.3.min.js"></script>
<script src="<%=request.getContextPath()%>/resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/user/user.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/ajaxupload.js"></script>
<style type="text/css">
body{background-color: #F0F0F0;}
#persion-introduce-item{height:130px;background-color:#ffffff;margin-top:80px;}
#user-introduce-context{padding:4px;border-top:1px solid #F0F0F0;}
.col-md-2 img,.col-md-4 img{height:120px;width:120px;}
#user-menu-bar{background-color:#FFFFFF;margin-top:5px;padding:2px;}
</style>
<script type="text/javascript">
$(function(){
	new AjaxUpload('#addLabProdPic', {
		action: 'update_picture', 
		name: 'userPicture',
		responseType: 'json',
		onSubmit : function(file , ext)
		{
			if (ext && /^(jpg|png|bmp)$/.test(ext.toLowerCase()))
			{
				this.setData({
					'userPicture': file
				});
			}else 
			{
				alert("请上传格式为 jpg|png|bmp 的图片！");
				return false;				
			}
		},
		onComplete : function(file,response)
		{
			if(response.error)
			{
				alert(response.error);
				return;
			}
			$('#viewImg').attr('src',response.picUrl);
		}		
	});
})
</script>
</head>
<body>
<%@ include file="../../jsp/nav.jsp"%>
<div class="container">
    <div class="row" >
	        <div class="col-md-10">
		           <div class="row" id="persion-introduce-item">
		              <div class="col-md-12" id="user-introduce-context">
			                  <div class="row" >
			                      <div class="col-md-2">
			                         <img src="../../resource/img/user/${user.profile}" id="user-introduce-picture" alt="..." class="img-rounded ">
			                      </div>
			                  </div>
		              </div>
		          </div>
		          <div class="row"  id="user-menu-bar">
		               <div class="col-md-12">
							       <nav id="bs-navbar" class="collapse navbar-collapse">
							       <ul class="nav navbar-nav">
							       <li ><a>我发表的资讯信息</a></li>
								   <li ><a href="myQuestion">我的提问</a></li>
								   <li ><a href="setting">用户设置</a></li>
								   <li ><a href="accountSet">用户设置</a></li>
								   </ul>
								   </nav>
		               </div>
		          </div>
		          
		          <div class="row"  id="user-menu-bar">
		               <div class="col-md-12">
							<div class="row">
							     <div class="col-md-4">
								        <form class="form-horizontal">
										  <div class="control-group">
										    <label class="control-label" for="inputEmail">昵称</label>
										    <div class="controls">
										      <input type="text" id="nickname" class="form-control" value="${user.nickname}" id="nickname" >
										    </div>
										  </div>
										  <div class="control-group">
										    <label class="control-label" for="inputPassword">邮箱</label>
										    <div class="controls">
										      <input type="text" id="email" value="${user.email}" class="form-control" id="email" >
										    </div>
										  </div>
										  <br>
										  <div class="control-group">
										    <div class="controls">
										      <button type="button" id="update_information" class="btn btn-success">修改</button>
										    </div>
										  </div>
										</form>
							     </div>
							     <div class="col-md-4">
							     </div>
							     <div class="col-md-4">
							         <img src="../../resource/img/user/${user.profile}" id="user-introduce-picture" alt="..." class="img-rounded ">
							          <button  id="addLabProdPic" class="btn btn-success">上传头像</button>
							     </div>
							</div>
		               </div>
		          </div>
		          
	        </div>
	        <div class="col-md-2">
	            
	        </div>
    </div>
</div>
<%@ include file="../../jsp/bottom.jsp"%>
</body>
</html>		     
		     



<%-- <%@ page language="java" contentType="text/html; charset=utf-8"
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
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/ajaxupload.js"></script>
<script type="text/javascript">
$(function(){
	new AjaxUpload('#addLabProdPic', {
		action: 'update_picture', 
		name: 'userPicture',
		responseType: 'json',
		onSubmit : function(file , ext)
		{
			if (ext && /^(jpg|png|bmp)$/.test(ext.toLowerCase()))
			{
				this.setData({
					'userPicture': file
				});
			}else 
			{
				alert("请上传格式为 jpg|png|bmp 的图片！");
				return false;				
			}
		},
		onComplete : function(file,response)
		{
			if(response.error)
			{
				alert(response.error);
				return;
			}
			$('#viewImg').attr('src',response.picUrl);
		}		
	});
})

</script>

<style type="text/css">
body{background-color:#F0F0F0;}
#main{margin:0 auto; width:1400px; height:800px;background: #FFFFFF;margin-top:25px;}




#basic_information{margin-left:300px;width:500px;float: left;}

#head_image{
margin-left:20px;
width:8%;
height:7vh;
float: left;
}

#simple_input {
	width: 350px;
}
</style>

</head>
<body>
<%@ include file="../../jsp/nav.jsp"%>
<div  id="main">

   <ul id="myTab" class="nav nav-tabs">
   <li><a href="#ios" data-toggle="tab">基本信息设置</a></li>
   <li><a href="#ios1" data-toggle="tab">账户安全设置</a></li>
</ul>
<div id="myTabContent" class="tab-content">
   <div class="tab-pane fade in active" id="ios">
           <div class="page-header" align="center">
			   <h3>基本信息设置</h3>
		   </div>
		   <div id="basic_information">
		          <label>用户名：${user.username} </label><br><br>
		          
		          <div class="input-group"><span class="input-group-addon">昵称</span>
                  <input type="text" class="form-control" value="${user.nickname}" id="nickname" >
                  </div><br>
                  <div class="input-group"><span class="input-group-addon">邮箱</span>
                  <input type="text" value="${user.email}" class="form-control" id="email" >
                  </div><br>
                  <button type="button" id="update_information" class="btn btn-success">修改</button>
		   </div>
		   <div id="head_image">
		           <img id="viewImg" src="../../resource/img/user/${user.profile}"/><br><br> 
				   <button  id="addLabProdPic" class="btn btn-success">上传头像</button>			 
		   </div>
   </div>
    <div class="tab-pane fade" id="ios1">
        <div class="page-header" align="center">
			   <h3>账户安全设置</h3>
		   </div>
		   <div class="page-header" align="left">
			       <h4>修改用户密码</h4>
		           </div>
		   <div id="basic_information">
		          <div class="input-group"><span class="input-group-addon">原密码</span>
                  <input type="text" class="form-control" id="simple_input" placeholder="请输入原始密码">
                  </div><br>
                  <div class="input-group"><span class="input-group-addon">新密码</span>
                  <input type="text" class="form-control" id="simple_input" placeholder="请输入新密码">
                  </div><br>
                  <div class="input-group"><span class="input-group-addon">新密码</span>
                  <input type="text" class="form-control" id="simple_input" placeholder="请再输入一次新密码">
                  </div><br>
                  <button type="button" class="btn btn-success">修改</button>
		   </div>
   </div>
</div>
</div>
</body>
</html>		     
		      --%>