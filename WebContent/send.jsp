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
		createTree("sendmsg", "sendtree");
		// 		$("#dialog").dialog({
		// 			modal : true,
		// 			dragable: true,
		// 			autoOpen : false,
		// 			bgiframe : true,
		// 			width : 460,
		// 			height : 450,
		// 			title : "请选择收件人",
		// 			position : [ 460, 90 ],
		// 			open : function(event, ui) {
		// 				$("#opadiv").css("display", "block");
		// 			},
		// 			close : function(event, ui) {
		// 				$("#opadiv").css("display", "none");
		// 			}
		// 		});
		$(".ui-dialog-titlebar").css("background-color", "#B8C9D5");
		//$(".ui-dialog-titlebar-close", $(this).parent()).hide();
		$("span.ui-icon.ui-icon-closethick").html("<b>X</b>");
		$("span.ui-icon.ui-icon-closethick").parent().css("margin-left",
				"340px");
		$(this).parent().css("border-width", "1px");
		$(this).parent().css("border-color", "#808080");
		$(this).parent().css("border-style", "solid");
	});
	
	function checkx(obj) {
		if ($(obj).prop("checked")) {
			$("input[name='chk']").prop("checked", true);
		} else {
			$("input[name='chk']").prop("checked", false);
		}
		docheck();
	}
	
	function docheck() {
		contact_str = "";
		$("input[name='chk']:checked").each(function() {
			var id = $(this).attr("id");
			contact_str = contact_str + contactMap[id].zhname + "; ";
		});
		$("#peers").html(peers + contact_str);
	}
	
	function getContacts() {
		$.ajax({
			url : 'contact',
			data : { },
			type : 'post',
			dataType : 'text',
			success : function(data) {
				var str = data.trim();
				if (str != "") {
					if (str.substr(0, 9) == "<!DOCTYPE") {
						alert("session expired");
						return;
					}
					contacts = eval("(" + str + ")");
					var html = "";
					for (var i = 0; i < contacts.length; i++) {
						contactMap[contacts[i].id] = contacts[i];
						html = html + "<tr><td><input type=\"checkbox\" name=\"chk\" " 
								+ "onclick=\"docheck()\" id=\"" 
								+ contacts[i].id +"\"/></td><td>"
								+ contacts[i].zhname + "</td><td>" 
								+ contacts[i].phone + "</td></tr>"; 
					}
					$("table#contact_table").html("<tbody>" + $("#header_tr").prop("outerHTML") 
							+ html + "</tbody>");
				}
			}
		});
	}
	function chooseReceiver() {
		idstr = "";
		phone_str = "";
		contact_str = "";
		$("#peers").html("");
		createTree("sendmsg", "sendtree");
		getContacts();
		$("#opadiv").show();
		$("#dragdiv").show();
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
		var optional_peers_str =  $("#optional_peers").val().replace(/\n/g,"").trim();
		if ((phone_str.trim() == "" || phone_str == "")
				&& (idstr.trim() == "" || idstr == "")
				&& optional_peers_str == "") {
			alert("接收人不能为空！！");
			return;
		}
		var reg = /^([1-9]{1}\d*,)+$/;
		if (phone_str != "" && !reg.test(phone_str)) {
			alert("联系人格式不正确！！");
			return;
		}
		var optional_peers =  optional_peers_str.split(";");
		var optional_phone_str = "";
		for (var i = 0; i < optional_peers.length; i++) {
			var optional_peer = optional_peers[i].trim();
			if (optional_peer == "") {
				continue;
			} else {
				reg = /^[1-9]{1}\d*$/;
				if (!reg.test(optional_peer)) {
					alert("自定义收信人格式不正确！！");
					return;
				} else {
					optional_phone_str = optional_phone_str + optional_peer + ",";
				}
			}
		}
		phone_str = phone_str + "" + optional_phone_str;
		var msg = $("#msgarea").val();
		if (msg == "" || msg.trim() == "" || msg.replace(/\n/g,"").trim() == "") {
			alert("短信息不能为空！！");
			return;
		}
		
		$("#result").html("发送中<b>.</b>");
		elapse = elapse + 1;
		clock = setInterval("indicator()", 250);
		var msg = $("#msgarea").val();
		msg = encodeURIComponent(msg);
		$.ajax({
			url : 'getTree?action=send',
			data : {
				idstr : idstr,
				phone_str : phone_str,
				msg : msg
			},
			type : 'post',
			dataType : 'text',
			success : function(data) {
				data = data.trim();
				if (data.substr(0, 9) == "<!DOCTYPE") {
					alert("session expired");
					return;
				}
				//恢复状态
				clearInterval(clock);
				elapse = 1;
				//$(".right").append("<div >" + data + "</div>");
				$("#result").html("<span style='color: red;'>" + data + "</span>");
				$("#msgarea").val("");
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
		<table id="sendtable" border="1" bordercolor="black" cellspacing="0"
		style="border-collapse: collapse;">
<!-- 			<tr height="30px"> -->
<!-- 				<td class="color"><span>任务名称:</span></td> -->
<!-- 				<td class="white"><span style="margin-left: 5px"> <input -->
<!-- 						type="text" name="task" />(任务名称不会作为短信内容发出去) -->
<!-- 				</span></td> -->
<!-- 			</tr> -->
			<tr height="240px">
				<td class="color"><span>收信人<span style="color: red;">*</span>:
				</span></td>
				<td class="white">
					<div style="overflow:">
						<span style="margin-left: 5px;"> <textarea
								style="width: 550px; height: 120px; overflow-y: scroll;
								resize:none;"
								id="peers" readonly="readonly"></textarea>
						</span> <span style="margin-bottom: 50px;">
							<input type="button" name="opener" onclick="chooseReceiver()"
							value="选择收信人" />
						</span>
					</div>
					<div style="margin-left: 5px;">
						<div>自定义收信人(<span style="color: red;">号码以分号<b>;</b>隔开</span>):
						</div>
						<div>
							<textarea
								style="width: 550px; height: 60px; resize:none;"
								id="optional_peers"></textarea>
						</div>
<!-- 						<input type="text" name="optional_peers" -->
<!-- 						style="width: 310px"/> -->
					</div>
				</td>
			</tr>
			<tr height="180px">
				<td class="color"><span>发送内容<span style="color: red;">*</span>:
				</span></td>
				<td class="white">
					<div style="overflow:">
						<span style="margin-left: 5px;"> <textarea
								style="width: 550px; height: 120px; overflow-y: scroll; resize:none;"
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

<!--  
	<div id="dialog" title="请选择收件人"
		style="width: 460px; height: 400px; background-color: #E6E6E6;
		display: none;">
		<fieldset ID="fs"
			style="width: 412px; height: 400px;
 			border: inset; border-top-width: 3px; 
			border-right-width: 3px; border-bottom-width: 3px; border-left-width: 3px;
			 background-color: #DFECF9">
			<div class="zTreeBackground left"
				style="margin-left: 20px; margin-top: 6px; float: left;
			width: 240px; height: 380px; 
				">
				<ul id="tree" class="ztree"></ul>
			</div>
			<div style="margin-left: 0px; float: left;
			width: 130px; height: 380px;">
				<div style="margin-left: 30px; margin-top: 40px;">
					<div><input type="button" value="确定" onclick="choose_confirm()"/></div>
					<div style="margin-top: 20px;">
					<input type="button" value="取消" onclick="choose_cancel()"/></div>
				</div>
			</div>
		</fieldset>
	</div> -->
	
	
</body>
</html>