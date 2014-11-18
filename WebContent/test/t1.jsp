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
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
	<style type="text/css">
	
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
<div style="width: 372px; height: 300px; background-color: fuchsia;">
						<div>
							<table bordercolor="black" border="1" cellspacing="0"
							style="border-collapse: collapse; text-align: center;">
								<tr>
									<th style="width: 70px;">请选择</th>
									<th style="width: 60px;">姓名</th>
									<th style="width: 100px;">号码</th>
								</tr>
								<tr>
									<td><input type="checkbox"/></td>
									<td>陈江涛</td>
									<td>18810996699</td>
								</tr>
							</table>
						</div>
					</div>
</body>
</html>