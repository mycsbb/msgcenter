<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- <script type="text/javascript" src="js/jquery-1.4.4.min.js"></script> -->
<script type="text/javascript" src="js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="js/jquery.ztree.excheck-3.5.js"></script>
<script src="js/jquery-ui-1.9.2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#funcpage").load("send.jsp");
	});
	function loadpage(name) {
		if (name == "sendpage") {
			$("#funcpage").load("send.jsp");
		} else if (name == "query") {
			$("#funcpage").load("query.jsp");
		} else if (name == "useradd") {
			$("#funcpage").load("useradd.jsp");
		} else if (name == "userdel") {
			$("#funcpage").load("userdel.jsp");
		}  else if (name == "userupdate") {
			$("#funcpage").load("userupdate.jsp");
		}
	}
	
	function sendfeature() {
		$("#sendmenu").css("display", "block");
		$("#usermenu").css("display", "none");
		$("#funcpage").load("send.jsp");
	}
	function usermanager() {
		$("#sendmenu").css("display", "none");
		$("#usermenu").css("display", "block");
		$("#funcpage").load("useradd.jsp");
	}
</script>
<title>Index</title>
</head>
<body>
	<!-- <div style="margin: 50px 0 0 auto"> -->
	<!-- 	<center> -->
	<!-- 		<a href="send.html">进入发送界面</a> -->
	<!-- 	</center> -->
	<!-- 	<center> -->
	<!-- 		<a href="login.html">进入登录界面</a> -->
	<!-- 	</center> -->
	<!-- </div> -->
	<div id="headarea">
		<div style="left: 1200px; top: 40px; position: relative;">
			<span><a href="javascript:showinfo()">${sessionScope["MsgCenterUser"].zhname}用户</a>,
				欢迎你!</span> <span><a href="auth?action=logout">注销</a></span>
		</div>
		<div style="height: 5px; margin-top: 45px;" class="line_up"></div>
		<!-- 		<div style="height: 5px; margin-top: 0px;" class="line_down"></div> -->
	</div>
	<div id="menuarea">
		<div style="margin-top: 9px">
			<span class="yuan" style="background-color: #64C1E3;"> <a
				href="javascript:" onclick="sendfeature()">短信发送</a></span> 
			<span class="yuan"
				style="background-color: #64C1E3;"> 
				<a href="javascript:" onclick="usermanager()">用户管理</a></span>
		</div>
		<div style="height: 5px; margin-top: 5px;" class="line_up"></div>
	</div>
	<div id="funcarea">
		<div id="funcmenu">
			<div
				style="margin-top: 30px; margin-left: 30px; 
				border-width: 1px; border-color: #808080; border-style: solid; 
				width: 180px; height: 200px;" id="sendmenu">
				<div style="margin-top: 10px; margin-left: 25px;">
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
				<div style="margin-top: 10px; margin-left: 25px;">
					<ul>
						<li><a href="javascript:" onclick="loadpage('useradd')">添加用户</a></li>
						<li><a href="javascript:" onclick="loadpage('userdel')">删除用户</a></li>
						<li><a href="javascript:" onclick="loadpage('userupdate')">更改用户</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="funcpage">
			<div id="sendarea">
				<table id="sendtable"  
				border="1px" cellspacing="0px" style="border-collapse:collapse">
					<tr height="30px">
						<td class="color"><span>任务名称*：</span></td>
						<td class="white"><span style="margin-left: 5px"> <input
								type="text" name="task" />(任务名称不会作为短信内容发出去)
						</span></td>
					</tr>
					<tr height="150px">
						<td class="color"><span>任务名称*：</span></td>
						<td class="white"><span style="margin-left: 5px"> <input
								type="text" name="task" />(任务名称不会作为短信内容发出去)
						</span></td>
					</tr>
					<tr height="150px">
						<td class="color"><span>任务名称*：</span></td>
						<td class="white"><span style="margin-left: 5px"> <input
								type="text" name="task" />(任务名称不会作为短信内容发出去)
						</span></td>
					</tr>
					<tr height="30px">
						<td class="color"><span>任务名称*：</span></td>
						<td class="white"><span style="margin-left: 5px"> <input
								type="text" name="task" />(任务名称不会作为短信内容发出去)
						</span></td>
					</tr>
					<tr height="30px">
						<td class="color"><span>任务名称*：</span></td>
						<td class="white"><span style="margin-left: 5px"> <input
								type="text" name="task" />(任务名称不会作为短信内容发出去)
						</span></td>
					</tr>
					<tr height="20px">
						<td class="color"><span>任务名称*：</span></td>
						<td class="white"><span style="margin-left: 5px"> <input
								type="text" name="task" />(任务名称不会作为短信内容发出去)
						</span></td>
					</tr>
					<tr height="20px">
						<td class="color"><span>任务名称*：</span></td>
						<td class="white"><span style="margin-left: 5px"> <input
								type="text" name="task" />(任务名称不会作为短信内容发出去)
						</span></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div id="dialogx" title="请选择收件人"
		style="width: 460px; height: 300px; background-color: #DFECF9; display: none;">
		<fieldset ID="fs"
			style="width: 412px; border: inset; border-top-width: 3px;
			 border-right-width: 3px; border-bottom-width: 3px; 
			 border-left-width: 3px; background-color: #DFECF9">
<!-- 			<legend> -->
<!-- 				<span style="font size: 12px">请选择收件人</span> -->
<!-- 			</legend> -->
			<div
				style="margin-left: 20px; margin-top: 6px; width: 400px; height: 200px;">
				<div
					style="float: left; width: 150px; height: 200px; ">
					<select id="select1" style="width: 150px; height: 200px;"
						multiple="multiple">
						<option value="4">处长</option>
						<option value="">调研员</option>
						<option value="">副处长</option>
					</select>
				</div>
				<div style="float: left; width: 50px; height: 200px;">
					<div style="margin-top: 70px; margin-left: 15px">
						<a href="javascript:void(0)" id="add">&gt;&gt;</a> <br /> <a
							href="javascript:void(0)" id="remove">&lt;&lt;</a>
					</div>
				</div>
				<div style="float: left; width: 150px; height: 200px;">
					<select id="select2" style="width: 150px; height: 200px;"
						multiple="multiple">
					</select>
				</div>
			</div>
		</fieldset>
	</div>
</body>
</html>