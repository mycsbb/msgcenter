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
		<!--
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
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			nodes = zTree.getChangeCheckedNodes();
			for (var i=0, l=nodes.length; i<l; i++) {
				nodes[i].checkedOld = nodes[i].checked;
			}
		}
		var cnt = 0;
		var idstr = "";
		function count() {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
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
					$.fn.zTree.init($("#treeDemo"), setting, zNodes);
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
		
		function send() {
			$.ajax({
				url : 'getTree?action=send',
				data : {idstr : idstr, msg : $("#msgarea").val()},
				type : 'post',
				dataType : 'text',
				success : function(data) {
					$(".right").append("<div >" + data + "</div>");
				}
			});
		}
	//-->
	</SCRIPT>
	<style type="text/css">
	 body {
	 	background: #e8eff4;
		overflow: hidden;
	 }
	</style>
</HEAD>

<BODY>
<h1>信息平台</h1>
<div style="float: right;margin-right: 100px">
	<span>${sessionScope["MsgCenterUser"].zhname}, 欢迎你!</span>
	<span><a href="auth?action=logout">注销</a></span>
</div>
<div class="content_wrap">
	<div class="zTreeDemoBackground left">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
	<div class="right">
		<div style="display: block; border: 1px solid blue; margin-top: 10px; height: 30px; " id="peers">
		</div>
		<div>
			<textarea rows="10" cols="50" style=" border: 1px solid grey;" id="msgarea" ></textarea>
		</div>
		<div id="form">
			<form action="" style="float: right;">
				<input type="button" value="发送" style="font-weight: bold;" onclick="send()"/>
			</form>
		</div>
	</div>
</div>

</BODY>
</HTML>