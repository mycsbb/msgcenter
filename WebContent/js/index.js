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
	count(e, treeId, treeNode);
	if (clearFlag) {
		clearCheckedOldNodes();
	}
}
function clearCheckedOldNodes() {
	var zTree = $.fn.zTree.getZTreeObj(setting.container_id), nodes = zTree
			.getChangeCheckedNodes();
	for ( var i = 0, l = nodes.length; i < l; i++) {
		nodes[i].checkedOld = nodes[i].checked;
	}
}

var cnt = 0;
function dealcheck_1(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj(setting.container_id);
	var nodes = zTree.getCheckedNodes(true);
	
	peers = "";
	idstr = "";
	var n_peers = 0;
	for ( var i = 0; i < nodes.length; i++) {
		if (nodes[i].is_person == true) {
			peers = peers + nodes[i].name + "; ";
			idstr = idstr + nodes[i].id + ",";
			n_peers++;
		}
	}
	$("#peers").html(peers + contact_str);
}

var cur_node;
function dealcheck_2(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj(setting.container_id);
	var nodes = zTree.getCheckedNodes(true);
	
	idstr = "";
	var n_peers = 0;
	for ( var i = 0; i < nodes.length; i++) {
		if (nodes[i].is_person == true) {
			idstr = idstr + nodes[i].id + ",";
			n_peers++;
		}
	}
	
	if (n_peers == 0) {
		$("#mgrform")[0].reset();
		cur_node = null;
		$("#depart option[value='-1']").attr("selected", "selected");
		$("#level option[value='-1']").attr("selected", "selected");
	} else if (n_peers == 1) {
		var id = treeNode.id * (-1);
		$.ajax({
			url : 'getTree?action=fetchuser',
			data : {
				id : id
			},
			type : 'post',
			dataType : 'text',
			success : function(data) {
				data = data.trim();
				if (data.substr(0, 1) == "{") {
					cur_node = eval("(" + data + ")");
					$("input[name='id']").val(cur_node.id);
					$("input[name='zhname']").val(cur_node.name);
					$("#depart option[value='" + cur_node.pId + "']")
						.attr("selected", "selected");
					$("#level option[value='" + cur_node.levelId + "']")
					.attr("selected", "selected");
					$("input[name='username']").val(cur_node.username);
					//$("input[name='password']").val(cur_node.password);
					$("input[name='password']").val("●●●●●●");
					$("input[name='phone']").val(cur_node.phone);
				} else {
					alert(data);
				}
			}
		});
	} else if (n_peers > 1) {
		$("#mgrform")[0].reset();
		$("#depart option[value='-1']").attr("selected", "selected");
		$("#level option[value='-1']").attr("selected", "selected");
		cur_node = null;
	}
}

function count(e, treeId, treeNode) {
	if (setting.flag == "sendmsg") {
		dealcheck_1(e, treeId, treeNode);
	} else if (setting.flag == "usermanager") {
		dealcheck_2(e, treeId, treeNode);
	}
}

function createTree(flag, container_id) {
	setting.flag = flag;
	setting.container_id = container_id;
	$.ajax({
		url : 'getTree',
		data : {},
		type : 'post',
		dataType : 'text',
		success : function(data) {
			// zNodes = JSON.parse(data);
			zNodes = eval("(" + data + ")");
			$.fn.zTree.init($("#" + container_id), setting, zNodes);
//			var zTree = $.fn.zTree.getZTreeObj(setting.container_id);
//			zTree.expandAll(false);
//			var node = zTree.getNodeByTId("tree_1");
//			zTree.expandNode(node, true, false, true);
//			node = zTree.getNodeByTId("tree_2");
//			zTree.expandNode(node, true, false, true);
			//count();
			// clearFlag = $("#last").attr("checked");
		}
	});
}
