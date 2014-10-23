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
		//$("#loginform").submit();
		username = $("input[name='username']").val();
		password = $("input[name='password']").val();
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
	border: 1px grey solid;" id="login">
		<div style="">
			<form action="auth" id="loginform" method="post">
				<ul style="list-style-type: none">
					<li>用户名：<input type="text" name="username" /></li>
					<li style="margin-top: 5px">密码：&nbsp;&nbsp;<input type="password"
						name="password" /></li>
					<li style="margin-left: 170px; margin-top: 5px"></li>
				</ul>
			</form>
		</div>
		<div style="float: right;margin-right: 30px">
			<input type="button" value="登录" onclick="login()" />
		</div>
		<div id="login_info" style="color: red; text-align: center;"></div>
	</div>
</body>
</html>