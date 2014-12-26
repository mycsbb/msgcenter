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

		var _move = false;
		var _x = -1, _y = -1;
		$("#titdiv2").mousedown(function(e) {
			_move = true;
			_x = e.pageX - parseInt($("#dragdiv2").css("left"));
			_y = e.pageY - parseInt($("#dragdiv2").css("top"));
			//$("#dragdiv").fadeTo(20, 0.5); //点击后开始拖动并透明显示
			//$("#dragdiv").fadeTo(20, 1); //点击后开始拖动并透明显示
		});
		$(document).mousemove(function(e) {
			if (_move) {
				var x = e.pageX - _x;
				var y = e.pageY - _y;
				if (x < 0)
					x = 0;
				if (x > 943)
					x = 943;
				if (y < 0)
					y = 0;
				if (y > 290)
					y = 290;
				$("#dragdiv2").css({
					top : y,
					left : x
				});
			}
		});
		$(document).mouseup(function() {
			_move = false;
		});
	});
	function loadpage(name) {
		if (name == "usermgr") {
			//$("#funcpage").load("usermgr.html");
			$("#funcpage").load("getTree?action=usermgr");
		} else if (name == "sendpage") {
			$("#funcpage").load("send.html");
		} else if (name == "query") {
			$("#funcpage").load("query.html");
		} else if (name == "contactmgr") {
			//$("#funcpage").load("contactmgr.html");
			$("#funcpage").load("contact?action=contactmgr");
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
		//$("#funcpage").load("usermgr.html");
		loadpage("usermgr");
	}
	function contact_manager(obj) {
		$("#funcmenu").children().css("display", "none");
		$("#funcmenu").children("#contactmenu").css("display", "block");
		//$("#funcpage").load("contactmgr.html");
		loadpage("contactmgr");
	}
	function showinfo() {
		$("#opadiv2").show();
		$("#dragdiv2").show();
		$("input[name='x_password']").val("●●●●●●");
	}
	function choose_cancel2() {
		$("#opadiv2").hide();
		$("#dragdiv2").hide();
	}
	function person_info_modify() {
		var password = $("input[name='x_password']").val().trim();
		var phone = $("input[name='x_phone']").val().trim();
		if (password == "" || phone == "") {
			alert("信息不能放空！");
			return;
		}
		var pwd_flag = 1;
		if(password == "●●●●●●") {
			pwd_flag = 0;
		}
		var reg = /^[1-9]{1}\d{3,10}$/;
		if (!reg.test(phone)) {
			alert("电话格式不正确！");
			return;
		}
		$.ajax({
			url : 'getTree?action=update_personal',
			data : {
				password : password,
				phone : phone, 
				pwd_flag : pwd_flag
			},
			type : 'post',
			dataType : 'text',
			success : function(data) {
				var str = data.trim();
				if (str != "") {
					if (str.substr(0, 9) == "<!DOCTYPE") {
						alert("session expired");
						return;
					}
					if (str == "update_success") {
						choose_cancel2();
						alert("更新成功！"); 
					} else {
						alert(str);
					}
				}
			}
		});
	}
	function person_info_resetx() {
		$("#person_form")[0].reset();
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
						href="javascript:" onclick="contact_manager(this)">个人通讯录</a></span>
				</c:when>
				<c:otherwise>
					<span class="yuan"
						style="background-color: #64C1E3; margin-left: 32px;"> <a
						href="javascript:" onclick="sendfeature(this)">短信发送</a></span>
					<span class="yuan" style="background-color: #64C1E3;"> <a
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
	<div
		style="width: 1365px; height: 645px; background-color: black; display: none;"
		class="opacity fixedopadiv2" id="opadiv2"></div>
	<div id="dragdiv2" class="fixeddragdiv2"
		style="width: 417px; height: 265px; display: none; 
		background-color: red; border-width: 1px; border-style: solid; border-color: #E8EFF4;">
		<div
			style="width: 417px; height: 25px; background-color: rgb(184, 201, 213);"
			id="titdiv2">
			<span>修改个人信息</span><span style="margin-left: 300px;"> <a
				href="javascript:choose_cancel2()"> <b>X</b>
			</a></span>
		</div>
		<div style="width: 417px; height: 170px;
		padding-top: 50px; background-color: #E8EFF4;">
			<div style="width: 240px; height: 125px;
			margin-left: 75px;">
				<form action="" method="post" id="person_form">
					<table id="sendtable" border="0" bordercolor="black" cellspacing="0"
		style="border-collapse: collapse;">
						<tr class="person_info_tr">
							<td class="person_meta_td">用户名：</td>
							<td><input type="text" name="x_username" value="${sessionScope['MsgCenterUser'].username}" disabled="disabled"/></td>
						</tr>
						<tr class="person_info_tr">
							<td class="person_meta_td">姓名：</td>
							<td><input type="text" name="x_zhname" value="${sessionScope['MsgCenterUser'].zhname}" disabled="disabled"/></td>
						</tr>
						<tr class="person_info_tr">
							<td class="person_meta_td">密码：</td>
							<td><input type="text" name="x_password"  value="●●●●●●"/></td>
						</tr>
						<tr class="person_info_tr">
							<td class="person_meta_td">手机号：</td>
							<td><input type="text" name="x_phone" value="${sessionScope['MsgCenterUser'].phone}"/></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div
			style="width: 417px; height: 48px; background-color: #E8EFF4; 
			padding-top: 20px; border-top-color: #B8C9D5; border-top-width: 2px; border-top-style: solid;">
			<div style="margin-left: 105px; width: 220px; ">
				<span> <input value="修改" onclick="person_info_modify()"
					type="button">
				</span> 
				<span style="margin-left: 20px;"> <input value="重置"
					onclick="person_info_resetx()" type="button">
				</span>
				<span style="margin-left: 20px;"> <input value="取消"
					onclick="choose_cancel2()" type="button">
				</span>
			</div>
		</div>
	</div>
</body>
</html>