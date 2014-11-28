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
<link rel="stylesheet" href="css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script src="js/jquery-ui-1.9.2.js"></script>
<script type="text/javascript" src="js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript">
	$(function() {
		createTree("usermanager", "usermgr_tree");
	});
	function insert() {
		var zhname = $("input[name='zhname']").val().trim();
		var departId = $('#depart option:selected').val().trim();
		var levelId = $('#level option:selected').val().trim();
		var username = $("input[name='username']").val().trim();
		var password = $("input[name='password']").val().trim();
		var phone = $("input[name='phone']").val().trim();
		if (zhname == "" || departId == "-1" || username == "" ||
				password == "" || phone == "") {
			alert("必选项不能为空！");
			return;
		}
		var reg = /^[a-zA-Z]{1}[\w\d]*$/;
		if (!reg.test(username)) {
			alert("用户名格式不正确！");
			return;
		}
		reg = /^\d+$/;
		if (!reg.test(phone)) {
			alert("电话格式不正确！");
			return;
		}
		if (levelId == "-1") levelId = "100";
		$.ajax({
			url : 'getTree?action=insert',
			data : {
				zhname : zhname,
				departId : departId,
				levelId : levelId,
				username : username,
				password : password,
				phone : phone
			},
			type : 'post',
			dataType : 'text',
			success : function(data) {
				var str = data.trim();
				if (str != "") {
					if (str.substr(0, 9) == "<!DOCTYPE") {
						alert("session expired");
						return;
					}
					if (str == "add_success") {
						createTree("usermanager", "usermgr_tree");
						resetx();
						alert("添加成功！");
					} else {
						alert(str);
					}
				}
			}
		});
	}
	function resetx() {
		$("#mgrform")[0].reset();
		$("#depart option[value='-1']").attr("selected", "selected");
		$("#level option[value='-1']").attr("selected", "selected");
		
		var zTree = $.fn.zTree.getZTreeObj("usermgr_tree");
		var nodes = zTree.getCheckedNodes(true);
		for (var i=0; i < nodes.length; i++) {
			zTree.checkNode(nodes[i], false, true);
		}
	}
	function delusers() {
		var zTree = $.fn.zTree.getZTreeObj("usermgr_tree");
		var nodes = zTree.getCheckedNodes(true);
		if (nodes.length <= 0) {
			alert("请选择要删除的用户！");
			return;
		}
		var idstr = "";
		for ( var i = 0; i < nodes.length - 1; i++) {
			if (nodes[i].is_person == true) {
				idstr = idstr + nodes[i].id + ",";
			}
		}
		idstr = idstr + nodes[nodes.length - 1].id;
		var reg = /^(-\d+,)*-\d+$/;
		if (!reg.test(idstr)) {
			alert("请选择要删除的用户！");
			return;
		}
		$.ajax({
			url : 'getTree?action=delete',
			data : {
				idstr : idstr
			},
			type : 'post',
			dataType : 'text',
			success : function(data) {
				var str = data.trim();
				if (str != "") {
					if (str.substr(0, 9) == "<!DOCTYPE") {
						alert("session expired");
						return;
					}
					if (str == "delete_success") {
						createTree("usermanager", "usermgr_tree");
						resetx();
						alert("删除成功！");
					} else {
						alert(str);
					}
				}
			}
		});
	}
	
	function updateUser() {
		var id = $("input[name='id']").val().trim();
		var zhname = $("input[name='zhname']").val().trim();
		var departId = $('#depart option:selected').val().trim();
		var levelId = $('#level option:selected').val().trim();
		var username = $("input[name='username']").val().trim();
		var password = $("input[name='password']").val().trim();
		var phone = $("input[name='phone']").val().trim();
		if (zhname == "" || departId == "-1" || 
				username == "" || password == "" || phone == "") {
			alert("必选项不能为空！");
			return;
		}
		if (id == "") {
			alert("请重新选择要更改的用户！");
			return;
		}
		var reg = /^[a-zA-Z]{1}[\w\d]*$/;
		if (!reg.test(username)) {
			alert("用户名格式不正确！");
			return;
		}
		reg = /^\d+$/;
		if (!reg.test(phone)) {
			alert("电话格式不正确！");
			return;
		}
		if (levelId == "-1") levelId = "100";
		$.ajax({
			url : 'getTree?action=update_user',
			data : {
				id : id,
				zhname : zhname,
				departId : departId,
				levelId : levelId,
				username : username,
				password : password,
				phone : phone
			},
			type : 'post',
			dataType : 'text',
			success : function(data) {
				var str = data.trim();
				if (str != "") {
					if (str.substr(0, 9) == "<!DOCTYPE") {
						alert("session expired");
						return;
					}
					if (str == "update_success") {
						createTree("usermanager", "usermgr_tree");
						resetx();
						alert("更改成功！");
					} else {
						alert(str);
					}
				}
			}
		});
	} 
</script>
<style type="text/css">
ul.ztree { /*
	margin-top: 10px;
	border: 1px solid #617775;
	background: #f0f6e4;*/
	width: 200px;
	height: 360px;
	overflow-y: scroll;
	overflow-x: auto; 
}
</style>
</head>
<body>
	<div style="margin-left: 30px; margin-top: 10px;">
		<div class="zTreeBackground left"
			style="margin-left: 0px; float: left; ">
			<ul id="usermgr_tree" class="ztree"></ul>
		</div>
		<div style="float: left; margin-top: 20px; margin-left: 60px;">
		<form action="" method="post" id="mgrform">
			<table border="1" bordercolor="black" cellspacing="0"
				style="border-collapse: collapse; width: 590px;" >
				<tr height="30px">
					<td class="color"><span>姓名<span style="color: red;">*</span>:
					</span></td>
					<td class="white1"><span style="margin-left: 5px">
					 <input type="hidden" name="id"/>
					 <input type="text" name="zhname" style="width: 140px" />
					</span></td>
				</tr>
				<tr height="30px">
					<td class="color"><span>处室<span style="color: red;">*</span>:
					</span></td>
					<td class="white1"><span style="margin-left: 5px"> 
							<select style="width: 146px" id="depart">
								<option value="-1">[请选择]</option>
								<option value="3">综合处</option>
								<option value="4">立案处</option>
								<option value="5">督查一处</option>
								<option value="6">督查二处</option>
								<option value="7">协调处</option>
								<option value="8">法规处</option>
								<option value="9">涉外处</option>
								<option value="20">技术指导处</option>
								<option value="100">其他</option>
						</select>
					</span></td>
				</tr>
				<tr height="30px">
					<td class="color"><span>职位:</span></td>
					<td class="white1"><span style="margin-left: 5px"> 
						<select style="width: 146px" id="level">
								<option value="-1">[请选择]</option>
								<option value="4">处长</option>
								<option value="5">调研员</option>
								<option value="6">副处长</option>
								<option value="7">副调研员</option>
								<option value="8">主任科员</option>
								<option value="9">副主任科员</option>
								<option value="10">研员</option>
								<option value="11">文秘</option>
								<option value="100">其他</option>
						</select>
					</span></td>
				</tr>
				<tr height="30px">
					<td class="color"><span>用户名<span style="color: red;">*</span>:
					</span></td>
					<td class="white1"><span style="margin-left: 5px"> <input
							type="text" name="username" style="width: 140px" />
							(以字母开头，只能由数字和字母组成)
					</span></td>
				</tr>
				<tr height="30px">
					<td class="color"><span>密码<span style="color: red;">*</span>:
					</span></td>
					<td class="white1"><span style="margin-left: 5px"> <input
							type="text" name="password" style="width: 140px" />
					</span></td>
				</tr>
				<tr height="30px">
					<td class="color"><span>手机号<span style="color: red;">*</span>:
					</span></td>
					<td class="white1"><span style="margin-left: 5px"> <input
							type="text" name="phone" style="width: 140px" />
					</span></td>
				</tr>
				<tr height="30px">
					<td style="background-color: white; width: 1060px;" colspan="2">
						<div>
							<span style="margin-left: 150px"> <input type="button"
								value="添加" onclick="insert()" /></span> 
							<span style="margin-left: 0px"> <input type="button"
								value="删除" onclick="delusers()" /></span> 
							<span style="margin-left: 0px"> <input type="button"
								value="更新" onclick="updateUser()" /></span> 
								<span><input type="button" value="重置" 
								onclick="resetx()"/></span> 
								<span style="margin-left: 0px">(本系统仅供参考)</span>
						</div>
					</td>
				</tr>
			</table>
		</form>
		</div>
	</div>
</body>
</html>