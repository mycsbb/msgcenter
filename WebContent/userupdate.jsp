<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/demo.css" type="text/css">
<link rel="stylesheet" href="css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript">
var setting = {
		view : {
			selectedMulti : false
		},
		check : {
			enable : true
		},
		data : {
			simpleData : {
				enable : true
			}
		},
		callback : {
			onCheck : onCheck
		}
	};

	var zNodes = [];

	var clearFlag = false;
	function onCheck(e, treeId, treeNode) {
		count();
		if (clearFlag) {
			clearCheckedOldNodes();
		}
	}
	function clearCheckedOldNodes() {
		var zTree = $.fn.zTree.getZTreeObj("tree"), nodes = zTree
				.getChangeCheckedNodes();
		for ( var i = 0, l = nodes.length; i < l; i++) {
			nodes[i].checkedOld = nodes[i].checked;
		}
	}
	var cnt = 0;
	var idstr = "";
	function count() {
		var zTree = $.fn.zTree.getZTreeObj("tree");

		var nodes = zTree.getCheckedNodes(true);
		var peers = "";
		idstr = "";
		for ( var i = 0; i < nodes.length; i++) {
			if (nodes[i].is_person == true) {
				peers = peers + nodes[i].name + "; ";
				idstr = idstr + nodes[i].id + ",";
			}
		}
		$("#peers").html(peers);
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
				//clearFlag = $("#last").attr("checked");
			}
		});
	}
	
	$(function() {
		createTree();
	});
</script>
</head>
<body>
<div style="position: absolute; left: 30px; top: 10px;
background-color: blue; width: 800px; height: 380px">
	<div class="zTreeBackground left" style="margin-left: 0px; 
	float: left;">
				<ul id="tree" class="ztree"></ul>
	</div>
</div>
</body>
</html>