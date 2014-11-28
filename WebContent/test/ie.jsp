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
<script type="text/javascript">
	$(function() {
		var _move = false;
		var _x = -1, _y = -1;
		$("#tdiv").mousedown(function(e) {
			_move = true;
			_x = e.pageX - parseInt($("#tdiv").css("left"));
			_y = e.pageY - parseInt($("#tdiv").css("top"));
		});
		$(document).mousemove(function(e) {
			if (_move) {
				var x = e.pageX - _x;
				var y = e.pageY - _y;
				$("#tdiv").css("z-index","1000");
				$("#tdiv").css({
					top : y,
					left : x
				});
			}
		});
		$(document).mouseup(function() {
			_move = false;
		});
	});
	function showpos(obj) {
		var pos = getElementPosition(obj);
		$("#tdiv").css("left", "0px");
		$("#tdiv").css("top", "-30px");
		//alert(document.documentElement.outerHTML);
	}
	function getElementPosition(obj) {
		var actualLeft = obj.offsetLeft;
		var current = obj.offsetParent;
		while (current != null) {
			actualLeft += current.offsetLeft;
			current = current.offsetParent;
		}

		var actualTop = obj.offsetTop;
		var current = obj.offsetParent;
		while (current != null) {
			actualTop += current.offsetTop;
			current = current.offsetParent;
		}
		var position = {
			left : actualLeft,
			top : actualTop
		};

		return position;
	}
</script>
<style type="text/css">
#fixedTop { /* 可自定义top的值，离窗口底部的距离 */
	position: fixed;
	top: 100px;
	left: 50px;
	/* 可自定义top的值，离窗口底部的距离 */
	_position: absolute;
	_top: 100px;
	_left: 50px;
	/* 可自定义修改||后面的值，也是离窗口顶部的距离，和上面top的值保持一致*/
	_top: expression(eval(document.documentElement.scrollTop +   (   parseInt(this.currentStyle.marginTop
		, 10)||100 ) ) );
	_left: expression(eval(document.documentElement.scrollLeft +   (   parseInt(this.currentStyle.marginLeft
		, 10)||50 ) ) );
	width: 300px;
	height: 100px;
	border: 1px solid #ccc;
}

* html {
	background-image: url(about:blank);
	background-attachment: fixed;
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
		<div
			style="width: 50px; height: 50px; background-color: blue; float: right;"></div>
		<div
			style="width: 1200px; height: 100px; background-color: green; margin-top: 10px"></div>
	</div>
	<div
		style="width: 200px; height: 200px; margin-left: 300px; margin-top: 100px;">
		<table border="1" cellspacing="0" style="border-collapse: collapse;"
			bordercolor="black">
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
	<div id="fixedTop" style="background-color: red;"></div>
	<div style="background-color: green;">
		abc<br />cdf
	</div>
	<div>
		<textarea
			style="width: 100px; height: 200px; resize: none; outline: none;"></textarea>
	</div>
	<div style="position: absolute; left: 400px; top: 400px;" id="tdiv">
		<div>fhvuigbhghbio</div>
		<div>fhvuigbhghbio</div>
		<input type="button" onclick="showpos(this)" value="显示位置"/>
	</div>
</body>
</html>