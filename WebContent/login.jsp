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
<title>Login</title>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
	function login() {
		$("#login_info").html("");
		//$("#loginform").submit();
		var username = $("input[name='username']").val();
		var password = $("input[name='password']").val();
		$.ajax({
			url : 'auth',
			data : {
				username : username,
				password : password
			},
			type : 'post',
			dataType : 'text',
			success : function(data) {
				if (data == "success") {
					window.location.href = "auth";
				} else
					$("#login_info").html(data);
			}
		});
	}
</script>
<style type="text/css">
body {
	width: 800px;
	/* 	height: 800px; */
	border: 0px solid red;
	margin: 0 auto;
	padding: 0 0 50px 0;
	vertical-align: bottom;
	background: #e8eff4;
	overflow: hidden;
	margin: 0 auto;
	padding: 0 0 50px 0;
	vertical-align: bottom;
	background: #e8eff4;
	padding: 0 0 50px 0;
	vertical-align: bottom;
	background: #e8eff4;
}

a:LINK {
	color: black;
	text-decoration: none;
}

a:VISITED {
	color: red;
}

a:HOVER {
	text-decoration: underline;
}
#login {
	background-color: #D2EEFC;
}
</style>

</head>
<body>
	<div style="margin: 60px auto auto auto; width: 300px; height: 120px; 
	border-width: 1px; border-color: #808080; border-style: solid; " id="login">
		<div style="margin-top: 24px; margin-left: 42px;
		width: 220px; border-width: 0px; border-style: solid;">
			<div style="border-width: 0px; border-color: #808080; border-style: solid;
			font-family: 宋体, simsun;">
<!-- 				<form action="auth" id="loginform" method="post" style="font-family: 宋体, simsun;"> -->
<!-- 				<ul style="list-style-type: none;font-family: 宋体, simsun;"> -->
<!-- 					<li>用户名：<input type="text" name="username" style="width: 140px"/></li> -->
<!-- 					<li style="margin-top: 5px">密码：&nbsp;&nbsp;<input type="password" -->
<!-- 						name="password" style="width: 140px"/></li> -->
<!-- 					<li style="margin-left: 170px; margin-top: 5px"></li> -->
<!-- 				</ul> -->
				<div>
					用户名：<input type="text" name="username" style="width: 140px"/>
				</div>
				<div>
					密码：&nbsp;&nbsp;<input type="password" name="password" style="width: 140px"/>
				</div>
				<div style="margin-left: 160px">
					<input type="button" value="登录" onclick="login()" style="width: 50px;"/>
				</div>				
<!-- 			</form> -->
			</div>
<!-- 			<div style="margin-left: 00px"> -->
<!-- <!-- 				<input type="button" value="登录" onclick="login()" /> --> 
<!-- 			</div> -->
			
		</div>
		<div id="login_info" style="color: red; text-align: center;
			border-width: 0px; border-color: #808080; border-style: solid;"></div>
		
	</div>
</body>
</html>