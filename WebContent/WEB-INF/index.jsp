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
<title>Insert title here</title>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
	<style type="text/css">
	 body {
	 	background: #e8eff4;
	 	width: 1200px;
	 	margin: 0 auto;
	 }
	 ul li {
	 	list-style-type: none;
	 }
	 a:LINK {
		text-decoration: none;
 	 }
	 a:HOVER {
		text-decoration: underline;
	 }	
	</style>
</head>
<body>

</body>
</html>