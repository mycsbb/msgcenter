<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*,com.csrc.msgcenter.filter.*,com.csrc.msgcenter.model.User" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	User user = (User)session.getAttribute(AuthFilter.USER_SESSION_KEY);
	String zhname = user.getZhname(); 
	
%>
<!DOCTYPE html>
<HTML>
<HEAD>
	<TITLE>msgcenter</TITLE>
	<base href="<%=basePath%>">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="css/demo.css" type="text/css">
	<link rel="stylesheet" href="css/zTreeStyle/zTreeStyle.css" type="text/css">
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
			//var dsp = $("#ddd").css("display");
			//if (dsp == "none")  $("#ddd").css("display", "block");
			//else $("#ddd").css("display", "none");
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
			
			//var data =  JSON.parse('[{"name":"chen","age":21},{"name":"chen","age":21}]'); 
			//$("#peers").html(data[0].name);
			//$("#peers").html(JSON.stringify(data[0]));
			
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
					//alert(data);
					zNodes = JSON.parse(data);
					$.fn.zTree.init($("#tree"), setting, zNodes);
					count();
					clearFlag = $("#last").attr("checked");
				}
			});
		}

		$(document).ready(function() {
			createTree();
			$("#init").bind("change", createTree);
			$("#last").bind("change", createTree);
		});
		
		var elapse = 1;
		function indicator() {
			var num = elapse % 3;
			if (num == 0) {
				$("#result").html("发送中. . .");
			} else if (num == 1) {
				$("#result").html("发送中.");
			} else if (num == 2) {
				$("#result").html("发送中. .");
			}
			elapse = elapse + 1;
		}
		
		function currentTime() {
			var d = new Date(), str = '';
			str += d.getFullYear() + '年';
			str += d.getMonth() + 1 + '月';
			str += d.getDate() + '日';
			str += " " + d.getHours() + '时';
			str += d.getMinutes() + '分';
			str += d.getSeconds() + '秒';
			return str;
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
					$('div#sended ul:first').append(
							"<li><div><b>" + currentTime() + "</b></div><div>" + msg
									+ "</div></li>");
					scrollBottom();
				}
			});
		}
		
		function showMessage() {
			
		}
	</SCRIPT>
	<style type="text/css">
	 body {
	 	background: #e8eff4;
/* 		overflow: hidden; */
	 }
	 ul {
	 	list-style: none;
	 }
	 a:LINK {
		color: black;
		text-decoration: none;
 	 }
	 a:VISITED {
		color: red;
	}

	a:HOVER {
		text-decoration: underline;
	}
	</style>
</HEAD>

<BODY>
<div>
<h1>信息平台</h1>
</div>
<div style="border: 0px solid grey; height: 20px">
<div style="float: right;margin-right: 100px">
	<span>${sessionScope["MsgCenterUser"].zhname}, 欢迎你!</span>
	<span><a href="auth?action=logout">注销</a></span>
</div>
</div>
<div style="margin-top: 10px">
<div class="content_wrap">
	<div class="zTreeBackground left">
		<ul id="tree" class="ztree"></ul>
	</div>
	<div class="right">
		<div>接收人：</div>
		<div style="display: block; border: 1px solid grey;
		width: 300px; height: 30px; " id="peers">
		</div>
		<div>已发送：</div>
		<div style="width: 300px;height: 200px; border:1px solid grey;overflow:auto;"  id="sended">
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
<div style="width: 300px;height: 365px; float: right;border:1px solid grey; 
float: left; margin-top: 6px">
	<div style="margin-left: 15px; margin-top: 15px">
		历史查询
		<div>
					按手机号<input type="radio" name="queryType" /> 按内容<input type="radio"
						name="queryType" /> <input type="text" name="key" /> <input
						type="button" value="查询" />
		</div>
		<div id="queryResult">
			<ul style="list-style: none;">
				<li onmouseover="showMessage()">
				timestamp: 2014-10-22 17:46:56; receicer:180101140; content:hello</li>
				<li>timestamp: 2014-10-22 17:46:56; receicer:180101140; content:hello</li>
				<li>timestamp: 2014-10-22 17:46:56; receicer:180101140; content:hello</li>
			</ul>
		</div>
	</div>
</div>
<div style="width: 300px;height: 365px; float: right;border:0px solid grey; 
float: left; margin-top: 6px">
	<div style="margin-left: 30px; margin-top: 15px">
		<ul>
			<li>
				<div>timestamp: 2014-10-22 17:46:56</div>
			</li>
			<li>
				<div>receiver: 18010151140</div>
			</li>
			<li>
				<div>content: hello</div>
			</li>
		</ul>
		
	</div>
</div>
</div>



</BODY>
</HTML>