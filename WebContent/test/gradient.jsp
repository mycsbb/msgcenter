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
<script type="text/javascript">
	$(document).ready(function() {
		$("#showpage").load("test/ie.jsp?test=chennnn");
	});
</script>
	<style type="text/css">
	 body {
/* 	 	background: #e8eff4; */
	 	width: 1000px;
	 	height: 900px;
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
	 .index_more{
    background: #cccccc;   /*不能渐变的浏览器*/  
    filter:progid:DXImageTransform.Microsoft.gradient(startcolorstr=#003399,endcolorstr=white, gradientType=0);  /*IE*/  
    -ms-filter:progid:DXImageTransform.Microsoft.gradient(startcolorstr=#003399,endcolorstr=white, gradientType=0 ); /*IE8*/  
    background: -o-linear-gradient(top, #003399 0%, white 95%);  /*opera*/  
    background: -moz-linear-gradient(top, #003399, white 95%);   /*firefox*/  
    background: -webkit-gradient(linear, 0 0, 0 500, from(#003399),to(white) ); /*chrome, safari*/
}
	</style>
</head>
<body class="index_more">
<div id="showpage" style="width: 300px; height: 300px;
border-width: 1px; border-color: #808080; border-style: solid;" > 
</div>
</body>
</html>