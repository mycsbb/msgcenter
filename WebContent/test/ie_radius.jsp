<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	String str = request.getParameter("test");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.yuan {
	border: 2px solid #C0C0C0;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	border-radius: 10px;
	position:relative;
	padding:5px;
	background:#FFF;
	z-index:2;
	width:330px;
	height:200px;
	behavior: url(css/iecss3.htc)
}
#n{margin:10px auto; width:920px; border:1px solid #CCC;font-size:12px; line-height:30px;}
#n a{ padding:0 4px; color:#333;}
</style>
</head>
<body>
<div style="display: block; border-width: 1px; border-style: solid;border-color: #808080;
		width: 300px; height: 30px; margin-left: 10px;margin-top: 5px;" id="peers">
		</div>

<div class="yuan">
DIVCSS5圆角实例<br>
CSS3版本圆角实例，<br>
支持低版本IE6-IE9浏览器
</div>
		<span class="yuan" style="background-color: #64C1E3;"><a href="javascript:">chen</a></span>
</body>
</html>