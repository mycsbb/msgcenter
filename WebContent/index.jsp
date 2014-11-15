<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/index.css" type="text/css">
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.9.2.js"></script>
<script type="text/javascript">
	var dialog_is_init = false;
	$(document).ready(function() {
		$("#funcpage").load("send.html");
	});
	function loadpage(name) {
		if (name == "usermgr") {
			$("#funcpage").load("usermgr.html");
		} else if (name == "sendpage") {
			$("#funcpage").load("send.html");
		} else if (name == "query") {
			$("#funcpage").load("query.html");
		} else if (name == "useradd") {
			$("#funcpage").load("useradd.html");
		} else if (name == "userdel") {
			$("#funcpage").load("userdel.html");
		}  else if (name == "userupdate") {
			$("#funcpage").load("userupdate.html");
		}
	}
	
	function sendfeature() {
// 		$("#sendmenu").css("display", "block");
// 		$("#usermenu").css("display", "none");
// 		$("#funcpage").load("send.html");
		$("#funcmenu").children().css("display", "none");
		$("#funcmenu").children("#sendmenu").css("display", "block");
		$("#funcpage").load("send.html");
	}
	function usermanager() {
// 		$("#sendmenu").css("display", "none");
// 		$("#usermenu").css("display", "block");
// 		$("#funcpage").load("usermgr.html");
		$("#funcmenu").children().css("display", "none");
		$("#funcmenu").children("#usermenu").css("display", "block");
		$("#funcpage").load("usermgr.html");
	}
	function contacts_manager() {
		$("#funcmenu").children().css("display", "none");
		$("#funcmenu").children("#contactmenu").css("display", "block");
	}
</script>
<title>Index</title>
</head>
<body>
<div style="position: absolute;left: 0px; top: 0px; width: 1365px;height: 605px;
background-color: black; z-index: 99; display: none;" class="opacity" id="opadiv"></div>
	<div id="headarea">
		<div style="width: 185px; height: 25px;
		float: right;margin-top: 52px">
			<span><a href="javascript:showinfo()">${sessionScope["MsgCenterUser"].zhname}</a>,欢迎你!</span> <span><a href="auth?action=logout">注销</a></span>
		</div>
		<div style="height: 5px; width: 1360px; 
		position: absolute; top: 75px;overflow: hidden;" class="line_up"></div>
		<!-- 		<div style="height: 5px; margin-top: 0px;" class="line_down"></div> -->
	</div>
	<div id="menuarea">
		<div style="margin-top: 9px">
			<c:choose>
				<c:when test="${sessionScope['MsgCenterUser'].role == '0' }"> 
<%-- 				<c:out value="${sessionScope['MsgCenterUser'].role}"></c:out> --%>
					<span class="yuan" style="background-color: #64C1E3;margin-left: 32px;"> 
			 			<a href="javascript:" onclick="sendfeature()">短信发送</a></span>
					<span class="yuan"style="background-color: #64C1E3;"> 
						<a href="javascript:" onclick="usermanager()">用户管理</a></span>
					<span class="yuan"style="background-color: #64C1E3;"> 
						<a href="javascript:" onclick="contacts_manager()">通讯录管理</a></span>
				</c:when>
				<c:otherwise>
					<span class="yuan" style="background-color: #64C1E3;margin-left: 32px;"> 
			 			<a href="javascript:" onclick="sendfeature()">短信发送</a></span>
			 		<span class="yuan"style="background-color: #64C1E3;"> 
						<a href="javascript:" onclick="contacts_manager()">通讯录管理</a></span>
				</c:otherwise>
			</c:choose>
		</div>
		<div style="height: 5px; margin-top: 5px; overflow: hidden;" class="line_up"></div>
	</div>
	<div id="funcarea">
		<div id="funcmenu">
			<div
				style="margin-top: 30px; margin-left: 30px; 
				border-width: 1px; border-color: #808080; border-style: solid; 
				width: 180px; height: 200px;" id="sendmenu">
				<div style="margin-top: 10px; margin-left: 15px;">
					<ul>
						<li><a href="javascript:" onclick="loadpage('sendpage')">信息发送</a></li>
						<li><a href="javascript:" onclick="loadpage('query')">历史查询</a></li>
					</ul>
				</div>
			</div>
			<div
				style="margin-top: 30px; margin-left: 30px; 
				border-width: 1px; border-color: #808080; border-style: solid; 
				width: 180px; height: 200px; display: none;" id="usermenu">
				<div style="margin-top: 10px; margin-left: 15px;">
					<ul>
						<li><a href="javascript:" onclick="loadpage('usermgr')">用户管理</a></li>
<!-- 						<li><a href="javascript:" onclick="loadpage('useradd')">添加用户</a></li> -->
<!-- 						<li><a href="javascript:" onclick="loadpage('userdel')">删除用户</a></li> -->
<!-- 						<li><a href="javascript:" onclick="loadpage('userupdate')">更改用户</a></li> -->
					</ul>
				</div>
			</div>
			<div
				style="margin-top: 30px; margin-left: 30px; 
				border-width: 1px; border-color: #808080; border-style: solid; 
				width: 180px; height: 200px; display: none;" id="contactmenu">
				<div style="margin-top: 10px; margin-left: 15px;">
					<ul>
						<li><a href="javascript:" onclick="loadpage('contactmgr')">通讯录管理</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="funcpage"></div>
	</div>
</body>
</html>