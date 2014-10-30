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
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<link rel="stylesheet" href="css/index.css" type="text/css">
<style type="text/css">
  body {
	/* background: #e8eff4;
	width: 1120px;  
	height: 485px; */
	/* border-width: 1px;
	border-color: grey;
	border-style: solid;  */
} 
</style>
</head>
<body>
	<div style="position: absolute; left: 30px; top: 10px;">
		<table id="sendtable"  
				border="1px" cellspacing="0px" style="border-collapse:collapse">
					<tr height="30px">
						<td class="color"><span>任务名称:</span></td>
						<td class="white"><span style="margin-left: 5px"> <input
								type="text" name="task" />(任务名称不会作为短信内容发出去)
						</span></td>
					</tr>
					<tr height="180px">
						<td class="color"><span>发送人<span style="color: red;">*</span>:</span></td>
						<td class="white">
							<div style="overflow: ">
								<span style="margin-left: 5px; "> 
								<textarea style="width: 550px; height: 120px; overflow-y: scroll;" 
								id="msgarea"></textarea>
							</span>
							<span style="margin-bottom: 50px; background-color: red">
								<input type="button" onclick="chooseReceiver()" value="选择收信人"/>
							</span>
							</div>
						</td>
					</tr>
					<tr height="180px">
						<td class="color"><span>发送内容<span style="color: red;">*</span>:</span></td>
						<td class="white">
							<div style="overflow: ">
								<span style="margin-left: 5px; "> 
								<textarea style="width: 550px; height: 120px; overflow-y: scroll;" 
								id="msgarea"></textarea>
								</span>
								<span style="margin-bottom: 50px; background-color: red">
								<input type="button" onclick="chooseReceiver()" value="发送"/>
							</span>
							</div>
						</td>
					</tr>
					<tr height="30px">
						<td style="background-color: white; width: 1060px; text-align: center;" 
						colspan="2">
							<div>
								<span>(本系统仅供参考)</span>
							</div>
						</td>
					</tr>
					<tr height="30px" >
						<td class="color"><span>任务名称*:</span></td>
						<td class="white"><span style="margin-left: 5px"> <input
								type="text" name="task" />(任务名称不会作为短信内容发出去)
						</span></td>
					</tr>
				</table>
	</div>
</body>
</html>