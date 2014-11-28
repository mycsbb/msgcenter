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
<link rel="stylesheet" href="css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.9.2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#funcpage").load("send.html");
		//$("#funcpage").load("test/ie.html");

// 		var _move = false;
// 		var _x = -1, _y = -1;
// 		$("#titdiv").mousedown(function(e) {
// 			_move = true;
// 			_x = e.pageX - parseInt($("#dragdiv").css("left"));
// 			_y = e.pageY - parseInt($("#dragdiv").css("top"));
// 			//$("#dragdiv").fadeTo(20, 0.5); //点击后开始拖动并透明显示
// 			//$("#dragdiv").fadeTo(20, 1); //点击后开始拖动并透明显示
// 		});
// 		$(document).mousemove(function(e) {
// 			if (_move) {
// 				var x = e.pageX - _x;
// 				var y = e.pageY - _y;
// 				if (x < 0)
// 					x = 0;
// 				if (x > 800)
// 					x = 800;
// 				if (y < 0)
// 					y = 0;
// 				if (y > 150)
// 					y = 150;
// 				$("#dragdiv").css({
// 					top : y,
// 					left : x
// 				});
// 			}
// 		});
// 		$(document).mouseup(function() {
// 			_move = false;
// 			//$("#dragdiv").fadeTo("fast", 1); //松开鼠标后停止移动并恢复成不透明
// 		});
	});
	function loadpage(name) {
		if (name == "usermgr") {
			$("#funcpage").load("usermgr.html");
		} else if (name == "sendpage") {
			$("#funcpage").load("send.html");
		} else if (name == "query") {
			$("#funcpage").load("query.html");
		} else if (name == "contactmgr") {
			$("#funcpage").load("contactmgr.html");
		}
	}

	function sendfeature(obj) {
		$("#funcmenu").children().css("display", "none");
		$("#funcmenu").children("#sendmenu").css("display", "block");
		$("#funcpage").load("send.html");
		// 		$(".yuan").css("background-color", "#64C1E3");
		// 		$(obj).parent().css("background-color", "#6A6AFF");
	}
	function usermanager(obj) {
		$("#funcmenu").children().css("display", "none");
		$("#funcmenu").children("#usermenu").css("display", "block");
		$("#funcpage").load("usermgr.html");
	}
	function contact_manager(obj) {
		$("#funcmenu").children().css("display", "none");
		$("#funcmenu").children("#contactmenu").css("display", "block");
		$("#funcpage").load("contactmgr.html");
	}
</script>
<style type="text/css">
ul.ztree { /*
	margin-top: 10px;
	border: 1px solid #617775;
	background: #f0f6e4;
	width: 200px;
	height: 360px;
	overflow-y: scroll;
	overflow-x: auto; */
	
}
</style>
<title>Index</title>
</head>
<body>

	<div id="headarea">
		<div
			style="width: 185px; height: 25px; float: right; margin-top: 52px">
			<c:choose>
				<c:when test="${sessionScope['MsgCenterUser'] == null }">
					<span><a href="javascript:showinfo()">用户</a>,欢迎你!</span>
				</c:when>
				<c:otherwise>
					<span><a href="javascript:showinfo()">${sessionScope["MsgCenterUser"].zhname}</a>,欢迎你!</span>
				</c:otherwise>
			</c:choose>
			<span><a href="auth?action=logout">注销</a></span>
		</div>
		<div
			style="height: 5px; width: 1360px; position: absolute; top: 75px; overflow: hidden;"
			class="line_up"></div>
		<!-- 		<div style="height: 5px; margin-top: 0px;" class="line_down"></div> -->
	</div>
	<div id="menuarea">
		<div style="margin-top: 9px" id="menudiv">
			<c:choose>
				<c:when test="${sessionScope['MsgCenterUser'].role == '0' }">
					<%-- 				<c:out value="${sessionScope['MsgCenterUser'].role}"></c:out> --%>
					<span class="yuan"
						style="background-color: #64C1E3; margin-left: 32px;"> <a
						href="javascript:" onclick="sendfeature(this)">短信发送</a></span>
					<span class="yuan" style="background-color: #64C1E3;"> <a
						href="javascript:" onclick="usermanager(this)">用户管理</a></span>
					<span class="yuan" style="background-color: #64C1E3;"> <a
						href="javascript:" onclick="contact_manager(this)">通讯录管理</a></span>
				</c:when>
				<c:otherwise>
					<span class="yuan"
						style="background-color: #64C1E3; margin-left: 32px;"> <a
						href="javascript:" onclick="sendfeature(this)">短信发送</a></span>
					<span class="yuan" style="background-color: red;"> <a
						href="javascript:" onclick="contact_manager(this)">通讯录管理</a></span>
				</c:otherwise>
			</c:choose>
		</div>
		<div style="height: 5px; margin-top: 5px; overflow: hidden;"
			class="line_up"></div>
	</div>
	<div id="funcarea">
		<div id="funcmenu">
			<div
				style="margin-top: 30px; margin-left: 30px; border-width: 1px; border-color: #808080; border-style: solid; width: 180px; height: 200px;"
				id="sendmenu">
				<div style="margin-top: 10px; margin-left: 15px;">
					<ul>
						<li><a href="javascript:" onclick="loadpage('sendpage')">信息发送</a></li>
						<li><a href="javascript:" onclick="loadpage('query')">历史查询</a></li>
					</ul>
				</div>
			</div>
			<div
				style="margin-top: 30px; margin-left: 30px; border-width: 1px; border-color: #808080; border-style: solid; width: 180px; height: 200px; display: none;"
				id="usermenu">
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
				style="margin-top: 30px; margin-left: 30px; border-width: 1px; border-color: #808080; border-style: solid; width: 180px; height: 200px; display: none;"
				id="contactmenu">
				<div style="margin-top: 10px; margin-left: 15px;">
					<ul>
						<li><a href="javascript:" onclick="loadpage('contactmgr')">通讯录管理</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="funcpage"></div>
	</div>


	<!-- 	
	<div aria-labelledby="ui-id-1" role="dialog" tabindex="-1" id="dragdiv"
		style="display: none; outline: 0px none; z-index: 1000; position: absolute;
		left: 540px; top: 100px;"
		class="ui-dialog ui-widget ui-widget-content ui-corner-all ui-draggable ui-resizable"
		>
		<div style="background-color: rgb(184, 201, 213);"
			class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
			<span class="ui-dialog-title" id="ui-id-1">请选择收件人</span><a
				style="margin-left: 340px;" role="button"
				class="ui-dialog-titlebar-close ui-corner-all" href="#"><span
				class="ui-icon ui-icon-closethick"><b>X</b></span></a>
		</div>
		<div class="ui-dialog-content ui-widget-content" id="dialog"
			style="width: 460px; height: 400px; background-color: rgb(230, 230, 230);">
			<fieldset id="fs"
				style="width: 412px; height: 400px; border: inset; border-top-width: 3px; border-right-width: 3px; border-bottom-width: 3px; border-left-width: 3px; background-color: #DFECF9">
				<div class="zTreeBackground left"
					style="margin-left: 20px; margin-top: 6px; float: left; width: 240px; height: 380px;">
					<ul id="tree" class="ztree"></ul>
				</div>
				<div
					style="margin-left: 0px; float: left; width: 130px; height: 380px;">
					<div style="margin-left: 30px; margin-top: 40px;">
						<div>
							<input value="确定" onclick="choose_confirm()" type="button">
						</div>
						<div style="margin-top: 20px;">
							<input value="取消" onclick="choose_cancel()" type="button">
						</div>
					</div>
				</div>
			</fieldset>
		</div>
		<div style="z-index: 1000;" class="ui-resizable-handle ui-resizable-n"></div>
		<div style="z-index: 1000;" class="ui-resizable-handle ui-resizable-e"></div>
		<div style="z-index: 1000;" class="ui-resizable-handle ui-resizable-s"></div>
		<div style="z-index: 1000;" class="ui-resizable-handle ui-resizable-w"></div>
		<div style="z-index: 1000;"
			class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se"></div>
		<div style="z-index: 1000;"
			class="ui-resizable-handle ui-resizable-sw"></div>
		<div style="z-index: 1000;"
			class="ui-resizable-handle ui-resizable-ne"></div>
		<div style="z-index: 1000;"
			class="ui-resizable-handle ui-resizable-nw"></div>
	</div>
	-->
</body>
</html>