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
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#funcpage").load("send.jsp");
	});
	function loadpage(name) {
		if (name == "sendpage") {
			//$("#funcpage").load("send.jsp");
		}
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
				href="javascript:">短信发送</a></span> <span class="yuan"
				style="background-color: #64C1E3;"> <a href="javascript:">用户管理</a></span>
		</div>
		<div style="height: 5px; margin-top: 5px;" class="line_up"></div>
	</div>
	<div id="funcarea">
		<div id="funcmenu">
			<div
				style="margin-top: 30px; margin-left: 30px; 
				border-width: 1px; border-color: #808080; border-style: solid; 
				width: 180px; height: 200px;">
				<div style="margin-top: 10px; margin-left: 25px;">
					<ul>
						<li><a href="javascript:loadpage('sendpage')">信息发送</a></li>
						<li><a href="loadpage('query')">历史查询</a></li>
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

</body>
</html>