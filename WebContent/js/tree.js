function Tree() {
	this.zNodes = [];
	this.clearFlag = false;
	
	this.dealcheck_1 = function dealcheck_1(e, treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj(this.setting.container_id);
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
		alert(peers);
		$("#peers").html( "dcv" + peers + contact_str);
	};
	
	this.dealcheck_2 = function(e, treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj(this.setting.container_id);
		var nodes = zTree.getCheckedNodes(true);

		idstr = "";
		var n_peers = 0;
		for (var i = 0; i < nodes.length; i++) {
			if (nodes[i].is_person == true) {
				idstr = idstr + nodes[i].id + ",";
				n_peers++;
			}
		}

		if (n_peers == 0) {
			$("#mgrform")[0].reset();
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
						var cur_node = eval("(" + data + ")");
						$("input[name='id']").val(cur_node.id);
						$("input[name='zhname']").val(cur_node.name);
						$("#depart option[value='" + cur_node.pId + "']").attr(
								"selected", "selected");
						$("#level option[value='" + cur_node.levelId + "']")
								.attr("selected", "selected");
						$("input[name='username']").val(cur_node.username);
						$("input[name='password']").val(cur_node.password);
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
		}
	};

	this.count = function(e, treeId, treeNode) {
		if (this.setting.flag == "sendmsg") {
			this.dealcheck_1(e, treeId, treeNode);
		} else if (this.setting.flag == "usermanager") {
			this.dealcheck_2(e, treeId, treeNode);
		}
	};
	
	this.clearCheckedOldNodes = function() {
		var zTree = $.fn.zTree.getZTreeObj(this.setting.container_id), nodes = zTree
				.getChangeCheckedNodes();
		for (var i = 0, l = nodes.length; i < l; i++) {
			nodes[i].checkedOld = nodes[i].checked;
		}
	};
	
	var count = this.count;
	var clearFlag = this.clearFlag;
	var clearCheckedOldNodes = this.clearCheckedOldNodes;
	var obj = this;
	this.onCheck = function(e, treeId, treeNode) {
		
		count(e, treeId, treeNode);
		alert(this == obj);
		if (clearFlag) {
			clearCheckedOldNodes();
		}
	};
	
	var onCheck = this.onCheck;
	this.setting = {
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
	
	this.createTree = function(flag, container_id) {
		this.setting.flag = flag;
		this.setting.container_id = container_id;
		var setting = this.setting;
		$.ajax({
			url : 'getTree',
			data : {},
			type : 'post',
			dataType : 'text',
			success : function(data) {
				// this.zNodes = JSON.parse(data);
				this.zNodes = eval("(" + data + ")");
				$.fn.zTree.init($("#" + container_id), setting, this.zNodes);
				// count();
				// this.clearFlag = $("#last").attr("checked");
			}
		});
	};
}
