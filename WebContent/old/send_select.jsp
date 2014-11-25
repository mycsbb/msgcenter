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
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<!-- <script type="text/javascript" src="js/jquery-1.4.4.min.js"></script> -->
<script src="js/jquery-ui-1.9.2.js"></script>
<script type="text/javascript">
	$(function() {
		//$(".ui-dialog-content").width(460);
// 		$("input[name='opener']").click(function(event) {
// 			$("#dialog").dialog("open");
// 			event.preventDefault();
// 		});

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
							$recent.before($options);
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
							$recent.after($options);
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
							$recent.before($options);
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
	var init = 0;
	function chooseReceiver() {
		if (init == 0) {
			init = 1;
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
					//$(".ui-dialog-titlebar-close", $(this).parent()).hide();
					$("span.ui-icon.ui-icon-closethick").html("<b>X</b>");
					$("span.ui-icon.ui-icon-closethick").parent().css("margin-left", "340px");
					$(this).parent().css("border-width","1px");
					$(this).parent().css("border-color","#808080");
					$(this).parent().css("border-style","solid");
				}
			});
		}
		$("#dialog").dialog("open");
	}

	var clock;
	function sendmsg() {
		var msg = $("#msgarea").val();
		if (msg.trim() == "" || idstr == "") {
			alert("接收人或短信息不能为空！！");
			return;
		}
		$("#result").html("发送中.");
		elapse = elapse + 1;
		clock = setInterval("indicator()", 250);
		var msg = $("#msgarea").val();
		msg = encodeURIComponent(msg);
		$.ajax({
			url : 'getTree?action=send',
			data : {
				idstr : idstr,
				msg : msg
			},
			type : 'post',
			dataType : 'text',
			success : function(data) {
				//恢复状态
				clearInterval(clock);
				elapse = 1;
				//$(".right").append("<div >" + data + "</div>");
				$("#result").html(data);
				$("#msgarea").val("");
				var peers = $("#peers").html();
				peers = peers.substring(0, peers.length);
				$('div#sended ul:first').append(
						"<li><div><b>" + currentTime()
								+ "</b></div><div><b>TO:&nbsp;" + peers
								+ "</b></div><div>" + decodeURIComponent(msg)
								+ "</div></li>");
				scrollBottom();
			}
		});
	}
</script>
<style type="text/css">
body { /* background: #e8eff4;
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
		<table id="sendtable" border="1px" cellspacing="0px"
			style="border-collapse: collapse">
			<tr height="30px">
				<td class="color"><span>任务名称:</span></td>
				<td class="white"><span style="margin-left: 5px"> <input
						type="text" name="task" />(任务名称不会作为短信内容发出去)
				</span></td>
			</tr>
			<tr height="180px">
				<td class="color"><span>发送人<span style="color: red;">*</span>:
				</span></td>
				<td class="white">
					<div style="overflow:">
						<span style="margin-left: 5px;"> <textarea
								style="width: 550px; height: 120px; overflow-y: scroll;"
								id="msgarea"></textarea>
						</span> <span style="margin-bottom: 50px; background-color: red">
							<input type="button" name="opener" onclick="chooseReceiver()"
							value="选择收信人" />
						</span>
					</div>
				</td>
			</tr>
			<tr height="180px">
				<td class="color"><span>发送内容<span style="color: red;">*</span>:
				</span></td>
				<td class="white">
					<div style="overflow:">
						<span style="margin-left: 5px;"> <textarea
								style="width: 550px; height: 120px; overflow-y: scroll;"
								id="msgarea"></textarea>
						</span> <span style="margin-bottom: 50px; background-color: red">
							<input type="button" onclick="sendmsg()" value="发送" />
						</span>
					</div>
				</td>
			</tr>
			<tr height="30px">
				<td
					style="background-color: white; width: 1060px; text-align: center;"
					colspan="2">
					<div>
						<span>(本系统仅供参考)</span>
					</div>
				</td>
			</tr>
		</table>
	</div>

	<div id="dialog" title="请选择收件人"
		style="width: 460px; height: 300px; background-color: #DFECF9;
		display: none;">
		<fieldset ID="fs"
			style="width: 412px; border: inset; border-top-width: 3px; border-right-width: 3px; border-bottom-width: 3px; border-left-width: 3px; background-color: #DFECF9">
			<!-- 			<legend> -->
			<!-- 				<span style="font size: 12px">请选择收件人</span> -->
			<!-- 			</legend> -->
			<div
				style="margin-left: 20px; margin-top: 6px; width: 400px; height: 200px;">
				<div style="float: left; width: 150px; height: 200px;">
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
</body>
</html>