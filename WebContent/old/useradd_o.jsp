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
</head>
<body>
<div
		style="position: absolute; left: 30px; top: 10px; 
		width: 300px; height: 240px; 
		border-width: 1px; border-color: #808080; border-style: solid;"
		id="login">
		<div
			style="margin-top: 24px; margin-left: 42px; width: 220px; 
			border-width: 0px; border-style: solid;">
			<div
				style="border-width: 0px; border-color: #808080; border-style: solid; font-family: 宋体, simsun;">
				<div>
					姓名：<input type="text" name="zhname" style="width: 140px" />
				</div>
				<div>
					处室：<input type="text" name="depart" style="width: 140px" />
				</div>
				<div>
					职务：<input type="text" name="level" style="width: 140px" />
				</div>
				<div>
					用户名：<input type="text" name="username" style="width: 140px" />
				</div>
				<div style="margin-top: 5px">
					密码：&nbsp;&nbsp;<input type="password" name="password"
						style="width: 140px" />
				</div>
				<div>
					手机号：<input type="text" name="phone" style="width: 140px" />
				</div>
				<div style="margin-top: 5px; margin-left: 160px">
					<input type="button" value="登录" onclick="login()"
						style="width: 50px;" />
				</div>
				<!-- 			</form> -->
			</div>
		</div>
	</div>
</body>
</html>