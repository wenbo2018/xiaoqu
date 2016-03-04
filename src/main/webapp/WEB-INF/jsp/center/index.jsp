<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en"><head>
    <meta charset="UTF-8">
    <title>Bootstrap Admin</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/lib/font-awesome/css/font-awesome.css">
    <script src="<%=request.getContextPath()%>/resource/lib/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/resource/lib/jQuery-Knob/js/jquery.knob.js" type="text/javascript"></script>
    
    <script type="text/javascript">
        $(function() {
            $(".knob").knob();
        });
    </script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/center/campaign.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/stylesheets/theme.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/stylesheets/premium.css">
    
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/simditor-2.3.2/styles/simditor.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/simditor-2.3.2/scripts/module.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/simditor-2.3.2/scripts/hotkeys.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/simditor-2.3.2/scripts/uploader.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/simditor-2.3.2/scripts/simditor.js"></script>
    
    <style type="text/css">
       select ,input{
	height: 30px;
	
}
input{width:300px;}
    </style>
    
</head>
<body class=" theme-blue">
    <script type="text/javascript">
        $(function() {
            var match = document.cookie.match(new RegExp('color=([^;]+)'));
            if(match) var color = match[1];
            if(color) {
                $('body').removeClass(function (index, css) {
                    return (css.match (/\btheme-\S+/g) || []).join(' ')
                })
                $('body').addClass('theme-' + color);
            }

            $('[data-popover="true"]').popover({html: true});
            
        });
    </script>
    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .navbar-default .navbar-brand, .navbar-default .navbar-brand:hover { 
            color: #fff;
        }
    </style>

    <script type="text/javascript">
        $(function() {
            var uls = $('.sidebar-nav > ul > *').clone();
            uls.addClass('visible-xs');
            $('#main-menu').append(uls.clone());
        });
    </script>
    <div class="navbar navbar-default" role="navigation">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="" href="index.html"><span class="navbar-brand"><span class="fa fa-paper-plane"></span>校趣后台运营管理平台</span></a></div>

        <div class="navbar-collapse collapse" style="height: 1px;">
          <ul id="main-menu" class="nav navbar-nav navbar-right">
            <li class="dropdown hidden-xs">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <span class="glyphicon glyphicon-user padding-right-small" style="position:relative;top: 3px;"></span>Jack Smith
                    <i class="fa fa-caret-down"></i>
                </a>
              <ul class="dropdown-menu">
                <li><a href="./">My Account</a></li>
                <li class="divider"></li>
                <li class="dropdown-header">Admin Panel</li>
                <li><a href="./">Users</a></li>
                <li><a href="./">Security</a></li>
                <li><a tabindex="-1" href="./">Payments</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="sign-in.html">Logout</a></li>
              </ul>
            </li>
          </ul>

        </div>
      </div>
    </div>
    

    <div class="sidebar-nav">
    <ul>
    <li><a href="#" data-target=".dashboard-menu" class="nav-header" data-toggle="collapse"><i class="fa fa-fw fa-dashboard"></i>资讯管理<i class="fa fa-collapse"></i></a></li>
    <li><ul class="dashboard-menu nav nav-list collapse in">
            <li><a href="#" id="112"><span class="fa fa-caret-right"></span>资讯列表</a></li>
            <li ><a href="#" id="114"><span class="fa fa-caret-right"></span>资讯审核</a></li>
			<li ><a href="#" id="113"><span class="fa fa-caret-right"></span>资讯发布</a></li>
    </ul></li>

    <li><a href="#" data-target=".premium-menu" class="nav-header collapsed" data-toggle="collapse"><i class="fa fa-fw fa-fighter-jet"></i>用户管理<i class="fa fa-collapse"></i></a></li>
        <li><ul class="premium-menu nav nav-list collapse">
            <li ><a href="userIndex" id="214"><span class="fa fa-caret-right"></span>用户列表</a></li>
            <li ><a href="premium-profile.html"><span class="fa fa-caret-right"></span>用户权限设置</a></li>
    </ul></li>

        <li><a href="#" data-target=".accounts-menu" class="nav-header collapsed" data-toggle="collapse"><i class="fa fa-fw fa-briefcase"></i>问题管理<span class="label label-info"></span></a></li>
        <li><ul class="accounts-menu nav nav-list collapse">
            <li ><a href="questionIndex" id="145451"><span class="fa fa-caret-right"></span>问题列表</a></li>
            <li ><a href="sign-up.html"><span class="fa fa-caret-right"></span>问题审核</a></li>
            <li ><a href="reset-password.html"><span class="fa fa-caret-right"></span>问题发布</a></li>
    </ul></li>

        <li><a href="#" data-target=".legal-menu" class="nav-header collapsed" data-toggle="collapse"><i class="fa fa-fw fa-legal"></i> Legal<i class="fa fa-collapse"></i></a></li>
        <li><ul class="legal-menu nav nav-list collapse">
            <li ><a href="privacy-policy.html"><span class="fa fa-caret-right"></span> Privacy Policy</a></li>
            <li ><a href="terms-and-conditions.html"><span class="fa fa-caret-right"></span> Terms and Conditions</a></li>
    </ul></li>
    </div>

    <div class="content">
        <div class="header">
            <div class="stats">
    <p class="stat"><span class="label label-info">5</span> Tickets</p>
    <p class="stat"><span class="label label-success">27</span> Tasks</p>
    <p class="stat"><span class="label label-danger">15</span> Overdue</p>
</div>

            <h1 class="page-title">Dashboard</h1>
                    <ul class="breadcrumb">
            <li><a href="index.html">Home</a> </li>
            <li class="active">Dashboard</li>
        </ul>

        </div>
<div class="main-content">


<div id="welcome" >
        <div class="panel panel-default">
        <a href="#page-stats" class="panel-heading" data-toggle="collapse">Latest Stats</a>
         <div id="page-stats" class="panel-collapse panel-body collapse in">

              <div class="row">
                  <div class="col-md-3 col-sm-6">
                      <div class="knob-container">
                          <input class="knob" data-width="200" data-min="0" data-max="10000" data-displayPrevious="true" value="2500" data-fgColor="#92A3C2" data-readOnly=true;>
                          <h3 class="text-muted text-center">主页访问量</h3>
                      </div>
                  </div>
                  <div class="col-md-3 col-sm-6">
                      <div class="knob-container">
                          <input class="knob" data-width="200" data-min="0" data-max="10000" data-displayPrevious="true" value="3299" data-fgColor="#92A3C2" data-readOnly=true;>
                          <h3 class="text-muted text-center">用户人数</h3>
                      </div>
                  </div>
                  <div class="col-md-3 col-sm-6">
                      <div class="knob-container">
                          <input class="knob" data-width="200" data-min="0" data-max="2700" data-displayPrevious="true" value="1840" data-fgColor="#92A3C2" data-readOnly=true;>
                          <h3 class="text-muted text-center">Pending</h3>
                      </div>
                  </div>
                  <div class="col-md-3 col-sm-6">
                      <div class="knob-container">
                          <input class="knob" data-width="200" data-min="0" data-max="15000" data-displayPrevious="true" value="10067" data-fgColor="#92A3C2" data-readOnly=true;>
                          <h3 class="text-muted text-center">Completed</h3>
                      </div>
                  </div>
              </div>
		</div>
		</div>
		</div>



        <div id="campaign_list_div" style="display: none" >				        
		<form class="navbar-form pull-left">
		<select  name="classId"  id="select_change" class="campaign_class_select" >
		              <option value ="0">全部</option>
                      <option value ="1">阅读</option>
					  <option value ="2">音乐</option>
					  <option value="3">视频</option>
					  <option value="4">科技</option>
					  <option value ="5">游戏</option>
					  <option value ="6">专辑</option>
					  <option value="7">旅行</option>
					  <option value ="8">创业</option>
		</select>
		<input type="text" class="span2">
		<button type="submit" class="btn btn-success" placeholder="搜索">搜索</button>
		</form> 
        <table class="table table-bordered" id="table_id">
         
		</table>
		<ul class="pagination" id="page">
   
		</ul>	
        </div>

		<div id="campaign_add_div" style="display: none">
		<div class="row">
		   <div class="col-md-12">
		   <form class="navbar-form pull-left">
		     标题<input class="campaign_update_title" id="campaign_title"  type="text"  name="title" width="300px">
		    类别<select name="classId" id="campaign_id" class="campaign_class_select" >
		                      <option value ="1">阅读</option>
							  <option value ="2">音乐</option>
							  <option value="3">视频</option>
							  <option value="4">科技</option>
							  <option value ="5">游戏</option>
							  <option value ="6">专辑</option>
							  <option value="7">旅行</option>
							  <option value ="8">创业</option>
							  </select>
		   </form>
		   </div>
		</div>
		<div class="row">
		   <div class="col-md-12">
		   <textarea id="campaign_editor"  data-autosave="editor-content"  autofocus required></textarea>
		   <br>
		   <button class="btn btn-success" type="button" id="canmpaignManager_canmpaign_add" >发布</button>
		   </div>
		</div>

        <div id="campaign_verify_div"style="display: none" >				        
		<form class="navbar-form pull-left">
		<select  name="classId"  id="select_change" class="campaign_class_select" >
		              <option value ="0">全部</option>
                      <option value ="1">阅读</option>
					  <option value ="2">音乐</option>
					  <option value="3">视频</option>
					  <option value="4">科技</option>
					  <option value ="5">游戏</option>
					  <option value ="6">专辑</option>
					  <option value="7">旅行</option>
					  <option value ="8">创业</option>
		</select>
		<input type="text" class="span2">
		<button type="submit" class="btn btn-success" placeholder="搜索">搜索</button>
		</form> 
        <table class="table table-bordered" id="table_id">
         
		</table>
		<ul class="pagination" id="page">
   
		</ul>
		</div>
            
</div>
    <script src="<%=request.getContextPath()%>/resource/lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });
    </script>
</body></html>

