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
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery-1.11.3.min.js"></script>
 <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery-1.11.3.min.js"></script>
<script src="<%=request.getContextPath()%>/resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/user/user.js"></script>
<style type="text/css">
body{background-color: #F0F0F0;}
#persion-introduce-item{height:130px;background-color:#ffffff;margin-top:80px;}

#user-introduce-context{padding:4px;border-top:1px solid #F0F0F0;}
.col-md-2 img{height:120px;width:120px;}
#user-menu-bar{background-color:#FFFFFF;margin-top:5px;padding:2px;}
</style>
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
			                         <img src="<%=request.getContextPath()%>/resource/img/theme/theme2.png" id="user-introduce-picture" alt="..." class="img-rounded ">
			                      </div>
			                      <div class="col-md-2">
			                      <h3>${user.username}</h3>
			                      </div>
			                      <div class="col-md-6">
			                      </div>
			                      <div class="col-md-2">
									   <button class="btn btn-success">5条未读信息</button>
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
							   <table class="table table-bordered">
							   <thead><th>ID</th><th>题目</th><th>所属板块</th><th>发布时间</th><th>状态</th><th>操作</th></thead>
							   <tr>
									 <td>"+this.id+"</td>
									 <td><a href='/scut/main_content?id="+this.id+"' target='_Blank' >"+this.title+"</a></td>
			                         <td>"+this.classId+"</td>
			                         <td>"+this.time+"</td>
			                         <td>"审核中"</td>
			                         <td><button type='button' id='campaignUpdate' name='"+this.id+"'class='btn btn-danger'>编辑</button>
			 	                        &nbsp;&nbsp;<button type='button' id='campaignDelete'  name='"+this.id+"' class='btn btn-danger'>删除</button></td>
		 	                    </tr>
							   </table>    
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
		     