<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*,com.csrc.msgcenter.filter.*,com.csrc.msgcenter.model.User" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	User user = (User)session.getAttribute(AuthFilter.USER_SESSION_KEY);
	String zhname = user.getZhname(); 
	String sessionkey = AuthFilter.USER_SESSION_KEY;
%>
<!DOCTYPE html>
<HTML>
<HEAD>
	<TITLE>msgcenter</TITLE>
	<base href="<%=basePath%>">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="css/demo.css" type="text/css">
	<link rel="stylesheet" href="css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="js/jquery.ztree.core-3.5.js"></script>
	<script type="text/javascript" src="js/jquery.ztree.excheck-3.5.js"></script>
	<SCRIPT type="text/javascript">
		var setting = {
			view: {
				selectedMulti: false
			},
			check: {
				enable: true
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				onCheck: onCheck
			}
		};

		var zNodes =[];

		var clearFlag = false;
		function onCheck(e, treeId, treeNode) {
			count();
			if (clearFlag) {
				clearCheckedOldNodes();
			}
		}
		function clearCheckedOldNodes() {
			var zTree = $.fn.zTree.getZTreeObj("tree"),
			nodes = zTree.getChangeCheckedNodes();
			for (var i=0, l=nodes.length; i<l; i++) {
				nodes[i].checkedOld = nodes[i].checked;
			}
		}
		var cnt = 0;
		var idstr = "";
		function count() {
			var zTree = $.fn.zTree.getZTreeObj("tree");
			checkCount = zTree.getCheckedNodes(true).length;
			nocheckCount = zTree.getCheckedNodes(false).length;
			changeCount = zTree.getChangeCheckedNodes().length;
			
			var nodes = zTree.getCheckedNodes(true);
			var peers = "";
			idstr = "";
			for (var i = 0; i < nodes.length; i++)
			{
				if (nodes[i].is_person == true) {
					peers = peers + nodes[i].name + "; ";
					idstr = idstr + nodes[i].id + ",";
				}
			}
			$("#peers").html(peers);
			//$("#peers input").val(peers);
			
			$("#checkCount").text(checkCount);
			$("#nocheckCount").text(nocheckCount);
			$("#changeCount").text(changeCount);

		}

		function createTree() {
			$.ajax({
				url : 'getTree',
				data : {},
				type : 'post',
				dataType : 'text',
				success : function(data) {
					//zNodes = JSON.parse(data);
					zNodes = eval("(" + data + ")");
					$.fn.zTree.init($("#tree"), setting, zNodes);
					count();
					clearFlag = $("#last").attr("checked");
				}
			});
		}
		
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
			if (key == "") return; 
			var action = "";
			var queryType = $("input[name='queryType']:checked").val();
			if (queryType == "phone") {
				action = "queryByPhone";
				var reg = /^\d+$/;
				if (!reg.test(key)) return;
			} else if (queryType == "content") {
				action = "queryByContent";
			}
			$.ajax({
				url : 'getTree?action=' + action,
				data : {key: key},
				type : 'post',
				dataType : 'text',
				success : function(data) {
					$("div#queryResult ul:first").html("");
					if (data == "") return;
					//queryResults = JSON.parse(data);
					queryResults = eval("(" + data + ")");
					for (var p in resultMap) {
						resultMap[p] = null;
					}
					var ul_html = "";
					for (var i = 0; i < queryResults.length; i++) {
						resultMap[queryResults[i].id] = queryResults[i];
						var content = "";
						var receiver = "";
						if (content.length > max_content) {
							content = queryResults[i].content.substring(0, max_content) + "...";
						} else {
							content = queryResults[i].content;
						}
						if (receiver.length > max_receiver) {
							receiver = queryResults[i].receiver.substring(0, max_content) + "...";
						} else {
							receiver = queryResults[i].receiver;
						}
						ul_html += "<li onmouseover=\"showMessage(this)\" id=\"" + queryResults[i].id 
						+ "\"><div>时间: " + queryResults[i].timestamp +
						"; 接收号码: " + receiver + "; 内容: " + content + "</div></li>";
					}
					$("div#detailShow ul:first").html("");
					$("div#queryResult ul:first").html(ul_html);
				}
			});
		}
		$(document).ready(function() {
			createTree();
			$("#init").bind("change", createTree);
			$("#last").bind("change", createTree);
			
			//下面是查询功能的准备
			//change要失去焦点才生效
// 			$("input[name='key']").change(function(){ 
// 			    alert("111");
// 			}); 
			 $("input[name='key']").bind("keydown",function(e){
				 if (e.keyCode == 8 || e.keyCode == 37 || e.keyCode == 38 || 
						 e.keyCode == 39 || e.keyCode == 40) return;
				 if ($("input[name='queryType']:checked").length <= 0) {
					 alert("请选择类型"); 
					 return; 
				 }
				 curTime = new Date().getTime();
				 if (curTime - startTime < interval) {
					 canQuery = 0;
				 }
				 startTime = curTime;
				 
				 setTimeout("query()", interval);
			 });

		});
		
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
		
		function scrollBottom() {
			var height = 0;
			$('#sended').children().each(function() {
				height += $(this).height();
			});
			$('#sended').scrollTop(height);
		}

		var clock;
		function send() {
			var msg = $("#msgarea").val();
			if (msg.trim() == "" || idstr == "") {
				alert("接收人或短信息不能为空！！");
				return;
			}
			
			$("#result").html("发送中.");
			elapse = elapse + 1;
			clock = setInterval("indicator()", 250);
			var msg = $("#msgarea").val();
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
					$('div#sended ul:first').append("<li><div><b>" + currentTime() 
							+ "</b></div><div><b>TO:&nbsp;" + peers + "</b></div><div>" 
							+ msg + "</div></li>");
					scrollBottom();
				}
			});
		}
		
		//显示单条短信的详细信息; 
		var showed = -1;
		function showMessage(obj) {
			$("#person_info").css("display", "none");
			if (showed == obj.id) return;
			var ul_html = "<li><div><b>时间:&nbsp;&nbsp;</b>" 
				+ resultMap[obj.id].timestamp + "</div></li>" 
				+ "<li><div><b>接收号码:&nbsp;&nbsp;</b>" 
				+ resultMap[obj.id].receiver + "</div></li>"
				+ "<li><div><b>内容:&nbsp;&nbsp;</b>" 
				+  resultMap[obj.id].content + "</div></li>";
			$("div#detailShow ul:first").html(ul_html);
			showed = obj.id;
		}
		
		//显示个人信息
		function showinfo() {
			$("div#detailShow ul:first").html("");
			if ($("#person_info").css("display") == "none") {
				$("#person_info").css("display", "block");
			} else {
				$("#person_info").css("display", "none");
			}
		}
		function modifyinfo() {
			var password = $("input[name='password']").val().trim();
			var phone = $("input[name='phone']").val().trim();
			if (password == "" || phone == "") {
				alert("信息不能放空！");
				return;
			} 
			var reg = /^\d+$/;
			if (!reg.test(phone)) {
				alert("电话格式不正确！");
				return;
			}
			$.ajax({
				url : 'getTree?action=update',
				data : {
					password : password,
					phone : phone
				},
				type : 'post',
				dataType : 'text',
				success : function(data) {
					alert(data);
				}
			});
		}
	</SCRIPT>
	<style type="text/css">
	 body {
	 	background: #e8eff4;
	 	width: 1200px;
	 	margin: 0 auto;
/* 		overflow: hidden; */
	 }
	 ul li {
	 	list-style-type: none;
	 }
	 #queryResult ul li {
	 	list-style-type: disc;
	 }
	 a:LINK {
		text-decoration: none;
 	 }
	a:HOVER {
		text-decoration: underline;
	}
	</style>
</HEAD>

<BODY>
<div>
<h1>短信平台</h1>
</div>
<div style="border: 0px solid grey; height: 20px">
<div style="float: right;margin-right: 0px">
	<span><a href="javascript:showinfo()">${sessionScope["MsgCenterUser"].zhname}</a>, 欢迎你!</span>
	<span><a href="auth?action=logout">注销</a></span>
</div>
</div>
<div style="margin-top: 10px">
<div class="content_wrap">
	<div class="zTreeBackground left" style="margin-left: 0px">
		<ul id="tree" class="ztree"></ul>
	</div>
	<div class="right">
		<div>接收人：</div>
		<div style="border-width: 1px; border-color: #808080; border-style: solid; 
		width: 300px; min-height: 22px;" id="peers">
<!-- 			<input type="text" name="peers" readonly="readonly"  -->
<!-- 			style="width: 280px; height: 21px; background-color: #E8EFF4;  -->
<!-- /* 			border-width: 1px; border-color: #808080; border-style: solid;  */ -->
<!-- 			margin-top: 3px; font-size: 14px"/> -->
		</div>
		<div>已发送：</div>
		<div style="border-width: 1px; border-color: #808080; border-style: solid;  
		width: 300px;height: 200px; overflow:auto;"  id="sended">
			<ul style="list-style: none;"> 
<!-- 				<li> -->
<!-- 				 	<div><b>2014-10-22 15:56:00 :</b></div> -->
<!-- 					<div>hello chen</div> -->
<!-- 				</li> -->
			</ul>
		</div>
		<div style="margin-top: 9px;">
			<textarea rows="3" cols="34" style=" border: 1px solid grey;" id="msgarea" ></textarea>
		</div>
		
		<div id="form" style="float: right; margin-top: 7px; margin-right: 40px">
			<input type="button" value="发送" style="font-weight: bold;" onclick="send()"/>
		</div>
		<div id="result" style="margin-top: 10px;"></div>
	</div>
</div>
<div style="width: 300px;height: 365px; float: right;border:0px solid grey; 
float: left; margin-top: 6px; overflow: auto;" id="query">
	<div style="margin-left: 15px; margin-top: 15px;">
		历史查询
		<div>
					按手机号<input type="radio" name="queryType" value="phone"/> 
					按内容<input type="radio" name="queryType" value="content"/> 
					<input type="text" name="key"/> 
		</div>
		<div id="queryResult">
			<ul style="list-style-type: circle;"></ul>
		</div>
	</div>
</div>
<div style="width: 300px;height: 365px; float: right;border:0px solid grey; 
float: left; margin-top: 6px; overflow: hidden;">
	<div style="margin-left: 30px; margin-top: 15px; width:280px;" id="detailShow">
		<ul></ul>
	</div>
</div>
<div id="person_info" style="z-index: 100; position: absolute;border:0px solid grey; 
        right: 30px; display: none;">
	<div style="border:0px solid grey; margin: 10px 10px 10px 10px;">
		<form action="auth" id="modifyform" method="post">
				<ul style="">
					<li>用户名：${sessionScope["MsgCenterUser"].username}</li>
					<li>中文名：${sessionScope["MsgCenterUser"].zhname}</li>
					<li style="margin-top: 5px">
					密码：&nbsp;&nbsp;&nbsp;&nbsp;<input type="password"
						name="password" value="${sessionScope['MsgCenterUser'].password}"/></li>
					<li style="margin-top: 5px">
					电话：&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
						name="phone" value="${sessionScope['MsgCenterUser'].phone}"/></li>
					<li style="">
					<span>功能：&nbsp;&nbsp;&nbsp;</span>
						<span><input type="button" value="修改"
						 onclick="modifyinfo()"/></span>
						<span style="">
						<input type="reset" value="重置"/></span>
						<span>
						<input type="button" value="取消" 
						onclick="$('#person_info').css('display','none');"/></span>
					</li>
				</ul>
			</form>
	</div>
	
</div>
</div>

</BODY>
</HTML>