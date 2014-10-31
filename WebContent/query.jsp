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
<title>Insert title here</title>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
</head>
<body>
	<div
		style="position: absolute; left: 30px; top: 10px; 
		width: 300px; height: 240px;
		border-width: 1px; border-color: #808080; border-style: solid;"
		id="login">
		<div
			style="width: 300px; height: 400px; float: left; border-width: 0px; border-color: #808080; border-style: solid; overflow: auto; margin-left: 10px"
			id="query">
			<div style="margin-left: 0px; margin-top: 15px;">
				历史查询
				<div>
					按手机号<input type="radio" name="queryType" value="phone" /> 按内容<input
						type="radio" name="queryType" value="content" /> <input
						type="text" name="key" />
				</div>
				<div id="queryResult">
					<ul style="list-style-type: disc;"></ul>
				</div>
			</div>
		</div>
		<div
			style="width: 300px; height: 400px; float: left; border-width: 0px; border-color: #808080; border-style: solid;">
			<div style="margin-left: 20px; margin-top: 15px; width: 280px;"
				id="detailShow">
				<ul></ul>
			</div>
		</div>
	</div>
</body>
</html>