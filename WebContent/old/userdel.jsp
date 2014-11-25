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
<link rel="stylesheet" href="css/index.css" type="text/css">
<link rel="stylesheet" href="css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript">
	$(function() {
		//createTree();
	});
</script>
<style type="text/css">
ul.ztree {
	margin-top: 10px;
	border: 1px solid #617775;
	background: #f0f6e4;
	width: 220px;
	height: 360px;
	overflow-y: scroll;
	overflow-x: auto;
}
</style>
</head>
<body>
	<div
		style="position: absolute; left: 30px; top: 10px; 
		width: 1060px; height: 380px">
<!-- 		<div class="zTreeBackground left" -->
<!-- 			style="margin-left: 0px; float: left;"> -->
<!-- 			<ul id="tree" class="ztree"></ul> -->
<!-- 		</div> -->
		<table id="sendtable" border="1px" cellspacing="0px"
				style="border-collapse: collapse">
			<thead>
				<tr>
					<th>请选择</th>
					<th>姓名</th>
					<th>处室</th>
					<th>职位</th>
					<th>用户名</th>
					<th>密码</th>
				</tr>
			</thead>
			<tr height="30px">
					<td>
						<span>
						</span>
					</td>
					<td><span style="margin-left: 5px"> <input
							type="text" name="zhname" style="width: 140px" />
					</span></td>
				</tr>
		</table>
	</div>
</body>
</html>