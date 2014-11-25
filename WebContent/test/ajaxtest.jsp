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
<title>Session expired</title>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : 'test/expired.jsp',
			data : {},
			type : 'post',
			dataType : 'text',
			success : function(data) {
				var str = data.trim();
				if (str != "") {
					if (str.substr(0,9) == "<!DOCTYPE") {
						alert(str);
						alert("session expired");
					}
				}
			}
		});
	});
</script>
<style type="text/css">
body {
	background: #e8eff4;
	overflow: hidden;
}
</style>
</head>
<body>
	<div style="position: absolute; left: 30px; top: 10px;">
		<center>
			<h1>session expired..</h1>
		</center>
		<center>
			<a href="login.html">请先登录！！</a>
		</center>
	</div>

</body>
</html>