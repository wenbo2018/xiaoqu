<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/center/list_menu.css" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/center/index.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/center/list_menu.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap/css/bootstrap.min.css">
<script src="<%=request.getContextPath()%>/resource/bootstrap/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/simditor-2.3.2/styles/simditor.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/simditor-2.3.2/scripts/module.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/simditor-2.3.2/scripts/hotkeys.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/simditor-2.3.2/scripts/uploader.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/simditor-2.3.2/scripts/simditor.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/center/in.css" type="text/css" />

<script type="text/javascript">

</script>

</head>
<body>
<div id="header">
<%@ include file="inc/head.jsp"%>
</div>
<div class="mainContent">
	   <div class="menu">
		   	<%@ include file="inc/list_menu.jsp"%>
	   </div>
       <div class="content">
           <div class="title"><span>Home|</span></div>
           <div class="item">
            <%@ include file="inc/welcome.jsp"%>
            <%@ include file="inc/campaign_list.jsp"%>
            <%@ include file="inc/campaign_update.jsp"%>
            <%@ include file="inc/campaign_add.jsp"%>
            <%@ include file="inc/user_list.jsp"%>
            <%@ include file="inc/cloumn_list.jsp"%>
            <%@ include file="inc/question_list.jsp"%>
           </div>
       </div>
</div>
</body>
</html>