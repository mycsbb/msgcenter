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
<script type="text/javascript">
	$(function() {
		$("input[name='key']").bind(
				"keydown",
				function(e) {
					if (e.keyCode == 8 || e.keyCode == 37 || e.keyCode == 38
							|| e.keyCode == 39 || e.keyCode == 40)
						return;
					if ($("input[name='queryType']:checked").length <= 0) {
						alert("请选择类型");
						return;
					}
					$("div#detailShow ul:first").html("");
					$("div#queryResult ul:first").html("");
					curTime = new Date().getTime();
					if (curTime - startTime < interval) {
						canQuery = 0;
					}
					startTime = curTime;

					setTimeout("query()", interval);
				});
		$("input[name='queryType']").click(function() {
			$("div#detailShow ul:first").html("");
			$("div#queryResult ul:first").html("");
		});
	});

	var canQuery = 1;
	var startTime = -1, curTime;
	var interval = 800;
	var queryResults, resultMap = new Object();
	var max_receiver = 30;
	var max_content = 30;
	function query() {
		if (canQuery == 0) {
			canQuery = 1;
			return;
		}
		var key = $("input[name='key']").val().trim();
		if (key == "")
			return;
		key = encodeURIComponent(key);
		var action = "";
		var queryType = $("input[name='queryType']:checked").val();
		if (queryType == "phone") {
			action = "queryByPhone";
			var reg = /^\d+$/;
			if (!reg.test(key))
				return;
		} else if (queryType == "content") {
			action = "queryByContent";
		}
		$.ajax({
					url : 'getTree?action=' + action,
					data : {
						key : key
					},
					type : 'post',
					dataType : 'text',
					success : function(data) {
						data = data.trim();
						if (data.substr(0, 9) == "<!DOCTYPE") {
							alert("session expired");
							return;
						}
						$("div#queryResult ul:first").html("");
						if (data == "")
							return;
						//queryResults = JSON.parse(data);
						if (data.substr(0, 1) == "[") {
							queryResults = eval("(" + data + ")");
							for ( var p in resultMap) {
								resultMap[p] = null;
							}
							var ul_html = "";
							for ( var i = 0; i < queryResults.length; i++) {
								resultMap[queryResults[i].id] = queryResults[i];
								var content = "";
								var receiver = "";
								if (queryResults[i].content.length > max_content) {
									content = queryResults[i].content
											.substring(0, max_content)
											+ "<b>. . .</b>";
								} else {
									content = queryResults[i].content;
								}
								if (queryResults[i].receiver.length > max_receiver) {
									receiver = queryResults[i].receiver
											.substring(0, max_content)
											+ "<b>. . .</b>";
								} else {
									receiver = queryResults[i].receiver;
								}
								ul_html += "<li onmouseover=\"showMessage(this)\" id=\""
										+ queryResults[i].id
										+ "\"><div>时间: "
										+ queryResults[i].timestamp
										+ "; 接收号码: "
										+ receiver
										+ "; 内容: "
										+ content + "</div></li>";
							}
							$("div#detailShow ul:first").html("");
							$("div#queryResult ul:first").html(ul_html);
						} else {
							alert(data);
						}
					}
				});
	}
	//显示单条短信的详细信息; 
	function showMessage(obj) {
		$("#person_info").css("display", "none");
		var receiver_str = "";
		var cur_pos = 2;
		var receivers = resultMap[obj.id].receiver.split(",");
		if (receivers.length <= 2) {
			receiver_str = resultMap[obj.id].receiver;
		} else {
			receiver_str = receivers[0] + "," + receivers[1] + ",</br>";
			for (var i = 0; i < parseInt((receivers.length - 2) / 3); i++) {
				receiver_str = receiver_str + receivers[cur_pos] + "," + 
					receivers[cur_pos + 1] + "," + receivers[cur_pos + 2] + ",</br>";
				cur_pos = cur_pos + 3;
			}
			for (var i = cur_pos; i < receivers.length; i++) {
				receiver_str = receiver_str + receivers[i] + ",";
			}
			receiver_str = receiver_str + "</br>";
			//alert(receiver_str);
		}
		
		var content = "";
		cur_pos = 0;
		for (var i = 0; i < parseInt(resultMap[obj.id].content.length / 20); i++) {
			content = content + resultMap[obj.id].content.substring(cur_pos, 20) + "<br/>";
			cur_pos = cur_pos + 20;
		}
		content = content + resultMap[obj.id].content.substring(cur_pos, 
				resultMap[obj.id].content.length - cur_pos);
		var ul_html = "<li><div><b>时间:&nbsp;&nbsp;</b>"
				+ resultMap[obj.id].timestamp + "</div></li>"
				+ "<li><div><b>接收号码:&nbsp;&nbsp;</b>"
				+ receiver_str + "</div></li>"
				+ "<li><div><b>内容:&nbsp;&nbsp;</b>" + content
				+ "</div></li>";
		$("div#detailShow ul:first").html(ul_html);
		
		//下面是新式方法
	}
</script>
</head>
<body>
	<div
		style="position: absolute; left: 30px; top: 10px; width: 900px; height: 405px; 
		border-width: 0px; border-color: #808080; border-style: solid;
		"
		id="login">
		<div
			style="width: 300px; height: 400px; float: left; 
			border-width: 0px; border-color: #808080; border-style: solid; 
			overflow: auto; margin-left: 10px;"
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
			style="width: 400px; height: 400px; float: left; 
			border-width: 0px; border-color: #808080; border-style: solid; margin-left: 10px;
			">
			<div style="margin-left: 20px; margin-top: 15px; overflow: auto;
			width: 360px; height: 370px;
			">
				<div style="width: 300px; height: 370px;"
				id="detailShow">
					<ul></ul>
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>