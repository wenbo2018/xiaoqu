<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand " href="/"><span class="title" style="font-size:30px;">校趣</span></a>
            <a class="navbar-brand" href="/question_square">问题广场</a>
        </div>
        <c:if test="${empty session_login_username}">
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <form class="navbar-form navbar-right" role="search">
                <button type="submit" class="btn btn-success" onclick="window.open('/login')" >登录</button>
                <button type="submit" class="btn btn-success" onclick="window.open('/register')">注册</button>
            </form>
        </div>
        </c:if>
        <c:if test="${not empty session_login_username}">
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <form class="navbar-form navbar-right" role="search">
                <button type="submit" class="btn btn-success" onclick="window.open('/login')" >发现</button>
                <button type="submit" class="btn btn-success" onclick="window.open('/question_square/add')" >提问</button>
                <button type="submit" class="btn btn-success" onclick="window.open('/user/index')">个人中心</button>
                <button type="submit" class="btn btn-success"><a href="/loginout">退出</a></button>
                </form>
        </div>
        </c:if>
    </div>
    </nav>
    <!-- /.container-fluid -->








<%-- <div id="head">
   <div id="home"><a href="/"><span>校趣</span></a></div>
   <div id="home1"><a href="/question_square"><span>问题广场</span></a></div>
   
   <div id="search_id">
    <input type="text" class="form-control" placeholder="Search"><button type="submit" class="btn btn-default"><span>搜索</span></button>
   </div>
   
   
   <c:if test="${empty session_login_username}">
     <div id="login_register">
	     <button type="button" class="btn btn-success" onclick="window.open('/login')"><span>登录</span></button>
	     <button type="button" class="btn btn-success" onclick="window.open('/register')"><span>注册</span></button>
	  </div>
  </c:if>
	
	<c:if test="${not empty session_login_username}">
    <div id="login_register"> 
		<div class="dropdown">	
	    <button type="button" class="btn btn-success" id="dropdownMenu1" data-toggle="dropdown">Home</button>
	      <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
		      <li id="100" role="presentation">
		         <a role="menuitem" tabindex="-1" href="/user/index">个人中心</a>
		      </li>
		      <li role="presentation">
		         <a role="menuitem" tabindex="-1" href="/user/setting">设置</a>
		      </li>
		      <li role="presentation">
		         <a role="menuitem" tabindex="-1" href="/login_out">退出</a>
		      </li>
	     </ul>
	   </div>
	   </div>
	   </c:if>
  </div> --%>