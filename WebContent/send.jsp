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
<link rel="stylesheet" href="css/zTreeStyle/zTreeStyle.css" type="text/css">
<link rel="stylesheet" href="css/index.css" type="text/css">
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script src="js/jquery-ui-1.9.2.js"></script>
<script type="text/javascript" src="js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript">
	$(function() {
		createTree();
		$("#dialog").dialog({
			modal : true,
			dragable: true,
			autoOpen : false,
			bgiframe : true,
			width : 460,
			height : 450,
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
	});
	var init = 0;
	function chooseReceiver() {
		$("#dialog").dialog("open");
	}
	
	//下面是发送功能
	function scrollBottom() {
		var height = 0;
		$('#sended').children().each(function() {
			height += $(this).height();
		});
		$('#sended').scrollTop(height);
	}
	var elapse = 1;
	function indicator() {
		var num = elapse % 3;
		if (num == 0) {
			$("#result").html("发送中<b>. . .</b>");
		} else if (num == 1) {
			$("#result").html("发送中<b>.</b>");
		} else if (num == 2) {
			$("#result").html("发送中<b>. .</b>");
		}
		elapse = elapse + 1;
	}
	var clock;
	function sendmsg() {
		var msg = $("#msgarea").val();
		if (msg.trim() == "" || idstr == "") {
			alert("接收人或短信息不能为空！！");
			return;
		}
		$("#result").html("<b>.</b>");
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
								id="peers"></textarea>
						</span> <span style="margin-bottom: 50px;">
							<input type="button" name="opener" onclick="chooseReceiver()"
							value="选择收信人" />
						</span>
					</div>
					<div style="margin-left: 5px;">
						可选接收人(<span style="color: red;">号码以分号;隔开</span>):
						<input type="text" name="optional_peers"
						style="width: 310px"/>
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
						</span> <span style="">
							<input type="button" onclick="sendmsg()" value="发送" />
						</span>
						<span id="result"></span>
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
		style="width: 460px; height: 400px; background-color: #DFECF9;
		display: none;">
		<fieldset ID="fs"
			style="width: 412px; height: 400px;
			border: inset; border-top-width: 3px; 
			border-right-width: 3px; border-bottom-width: 3px; border-left-width: 3px;
			 background-color: #DFECF9">
			<!-- 			<legend> -->
			<!-- 				<span style="font size: 12px">请选择收件人</span> -->
			<!-- 			</legend> -->
			<div class="zTreeBackground left"
				style="margin-left: 20px; margin-top: 6px; float: left;
				width: 400px; height: 380px;
				">
				<ul id="tree" class="ztree"></ul>
			</div>
		</fieldset>
	</div>
</body>
</html>