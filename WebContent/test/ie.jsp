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
<div style="width: 1200px; height: 200px; background-color: aqua;">
	<div style="width: 50px; height: 50px; background-color: blue;
	float: right;"></div>
	<div style="width: 1200px; height: 100px; background-color: green;
	margin-top: 10px"></div>
</div>
<div style="width: 200px; height: 200px;
margin-left: 300px;margin-top: 100px;">
	<table border="1" cellspacing="0" style="border-collapse: collapse;" bordercolor="black">
		<tr>
			<td style="">hello</td>
			<td style="">hello</td>
			<td style="">hello</td>
		</tr>
		<tr>
			<td style="">hello</td>
			<td style="">hello</td>
			<td style="">hello</td>
		</tr>
		<tr>
			<td style="">hello</td>
			<td style="">hello</td>
			<td style="">hello</td>
		</tr>
	</table>
</div>
</body>
</html>