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
<title>Server Internal error</title>
<style type="text/css">
body {
	background: #e8eff4;
	overflow: hidden;
}
</style>
</head>
<body>
	<div style="margin-left: 30px; margin-top: 10px;">
		<center>
			<h1>505 server intenal error..</h1>
		</center>
	</div>
</body>
</html>