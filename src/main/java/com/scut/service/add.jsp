<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>		     
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>校趣</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery-1.11.3.min.js"></script>
 <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap/css/bootstrap.min.css">
<script src="<%=request.getContextPath()%>/resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/ajaxupload.js"></script>



<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/simditor-2.3.2/styles/simditor.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/simditor-2.3.2/scripts/module.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/simditor-2.3.2/scripts/hotkeys.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/simditor-2.3.2/scripts/uploader.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/simditor-2.3.2/scripts/simditor.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/question/question.js"></script>
<script type="text/javascript">
$(function(){
	toolbar = [ 'title', 'bold', 'italic', 'underline', 'strikethrough',
	'color', '|', 'ol', 'ul', 'blockquote', 'code', 'table', '|',
	'link', 'image', 'hr', '|', 'indent', 'outdent' ];
	var editor = new Simditor( {
	textarea : $('#editor'),
	placeholder : '这里输入内容...',
	toolbar : toolbar, //工具栏
	upload : {
	url : 'ImgUpload', //文件上传的接口地址
	params: null, //键值对,指定文件上传接口的额外参数,上传的时候随文件一起提交
	fileKey: 'userPicture', //服务器端获取文件数据的参数名
	connectionCount: 3,
	leaveConfirm: '正在上传文件'
	}
	});
	})
</script>
<style type="text/css">
body{background-color:#F0F0F0;}
#main{margin-top:125px;padding-top:10px;}

.col-md-1,.col-md-7,.col-md-3{
    margin: 0px;
    padding: 0px;
}
.row{
    padding: 5px;
}
.col-md-7 input {
    width:98%;height:40px;

}
.col-md-2 select {
    width:100%;
    height:40px;
}
.col-md-1 span{
    height:40px;
    font-size:22px;
    font-family: "Microsoft YaHei" ! important;
    padding: 0px;
    line-height: 40px;
    margin:0px;
    color: #333;

}

.col-md-7 input {
    height:40px;
}
.col-md-2 button {
	height:50px;width:80%;
	font-size:20px;
}
</style>
</head>
<body>
<%@ include file="../../jsp/nav.jsp"%>
<div class="container" id="main">
		    <div class="row">
		        <div class="col-md-12">
		            <div class="row">
		                <div class="col-md-1"><span>问题标题</span></div>
		                <div class="col-md-7"><input type="text" id="title" placeholder="标题：一句话说清问题，用问号结尾"></div>
		                <div class="col-md-2">
		                    <select name="classId" id="question_Id" >
		                        <option value ="0">请选择问题类别</option>
		                        <option value ="1">约球</option>
		                        <option value ="2">失物招领</option>
		                        <option value="3">考试求助</option>
		                        <option value="4">二手买卖</option>
		                    </select>
		                    <div class="col-md-1"></div>
		                </div>
		            </div>
		        </div>
		    </div>
           <br>
           <div class="row">
                 <div class="col-md-12">
                     <textarea id="editor"  data-autosave="editor-content" autofocus required></textarea>
                 </div>
           </div>
           <div class="row">
           <div class="col-md-2">
                 <button id="add_question"  class="btn btn-large btn-success">发布</button>
           </div>
           </div>
      </div>
</div>
</div>
</body>
</html>		     
		     