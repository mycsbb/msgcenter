<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Session expired</title>
<style type="text/css">
body {
	background: #e8eff4;
	overflow: hidden;
}
</style>
</head>
<body>
<div style="position: absolute; left: 30px; top: 10px;">
	<center><h1>session expired..</h1></center>
	<center><a href="login.html">请先登录！！</a></center>
</div>

</body>
</html>