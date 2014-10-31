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
<!-- <link href="css/jquery-ui-1.9.2.custom.css" rel="stylesheet"> -->
<script type="text/javascript" src="js/common.js"></script>
<script src="js/jquery-1.8.3.js"></script>
<script src="js/jquery-ui-1.9.2.js"></script>
<!-- <script src="js/jquery-ui.js"></script> -->
<script type="text/javascript">
	$(function() {
		$("#dialog").dialog({
			dragable: true,
			autoOpen : false,
			bgiframe : true,
			width : 460,
			modal : true,
			title : "请选择收件人",
			position : [ 100, 100 ],
			open : function(event, ui) {
				$(".ui-dialog-titlebar").css("background-color","#B8C9D5");
				$(".ui-dialog-titlebar-close", $(this).parent()).hide();
				$(this).parent().css("border-width","1px");
				$(this).parent().css("border-color","#808080");
				$(this).parent().css("border-style","solid");
			}
		// 			buttons : [ {
		// 				text : "Ok",
		// 				click : function() {
		// 					$(this).dialog("close");
		// 				}
		// 			}, {
		// 				text : "Cancel",
		// 				click : function() {
		// 					$(this).dialog("close");
		// 				}
		// 			} ]
		});
		//$(".ui-dialog-content").width(460);
		$("input[name='opener']").click(function(event) {
			$("#dialog").dialog("open");
			event.preventDefault();
		});

		//移到右边
		$('#add').click(function() {
			$('#select1 option:selected').remove().appendTo('#select2');
		});
		//移到左边
		$('#remove').click(function() {
			$('#select2 option:selected').remove().appendTo('#select1');
		});
		//双击选项
		$('#select1').dblclick(function() {
			$("option:selected", this).remove().appendTo('#select2');
		});
		//双击选项
		$('#select2').dblclick(function() {
			$("option:selected", this).remove().appendTo('#select1');
		});
		//左边向上按钮
		$('#left_up').click(
				function() {
					var index = $('#select1 option').index(
							$('#select1 option:selected:first'));
					var $recent = $('#select1 option:eq(' + (index - 1) + ')');
					if (index > 0) {
						var $options = $('#select1 option:selected').remove();
						setTimeout(function() {
							$recent.before($options)
						}, 10);
					}
				});
		//左边向下按钮
		$('#left_down').click(
				function() {
					var index = $('#select1 option').index(
							$('#select1 option:selected:last'));
					var len = $('#select1 option').length - 1;
					var $recent = $('#select1 option:eq(' + (index + 1) + ')');
					if (index < len) {
						var $options = $('#select1 option:selected').remove();
						setTimeout(function() {
							$recent.after($options)
						}, 10);
					}
				});
		//右边向上按钮
		$('#right_up').click(
				function() {
					var index = $('#select2 option').index(
							$('#select2 option:selected:first'));
					var $recent = $('#select2 option:eq(' + (index - 1) + ')');
					if (index > 0) {
						var $options = $('#select2 option:selected').remove();
						setTimeout(function() {
							$recent.before($options)
						}, 10);
					}
				});
		//右边向下按钮
		$('#right_down').click(
				function() {
					var index = $('#select2 option').index(
							$('#select2 option:selected:last'));
					var len = $('#select2 option').length - 1;
					var $recent = $('#select2 option:eq(' + (index + 1) + ')');
					if (index < len) {
						var $options = $('#select2 option:selected').remove();
						setTimeout(function() {
							$recent.after($options);
						}, 10);
					}
				});
	});
</script>
<style type="text/css">
body {
	background: #e8eff4;
	width: 1200px;
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
</style>
</head>
<body>
	<div id="dialog" title="请选择收件人"
		style="width: 460px; height: 300px; background-color: #DFECF9">
		<fieldset ID="fs"
			style="width: 412px; border: inset; border-top-width: 3px;
			 border-right-width: 3px; border-bottom-width: 3px; 
			 border-left-width: 3px; background-color: #DFECF9">
<!-- 			<legend> -->
<!-- 				<span style="font size: 12px">请选择收件人</span> -->
<!-- 			</legend> -->
			<div
				style="margin-left: 20px; margin-top: 6px; width: 400px; height: 200px;">
				<div
					style="float: left; width: 150px; height: 200px; ">
					<select id="select1" style="width: 150px; height: 200px;"
						multiple="multiple">
						<option value="4">处长</option>
						<option value="">调研员</option>
						<option value="">副处长</option>
					</select>
				</div>
				<div style="float: left; width: 50px; height: 200px;">
					<div style="margin-top: 70px; margin-left: 15px">
						<a href="javascript:void(0)" id="add">&gt;&gt;</a> <br /> <a
							href="javascript:void(0)" id="remove">&lt;&lt;</a>
					</div>
				</div>
				<div style="float: left; width: 150px; height: 200px;">
					<select id="select2" style="width: 150px; height: 200px;"
						multiple="multiple">
					</select>
				</div>
			</div>
		</fieldset>
	</div>
	<div id="opener">打开对话框</div>
	<input type="button" name="opener" value="打开对话框" />
</body>
</html>