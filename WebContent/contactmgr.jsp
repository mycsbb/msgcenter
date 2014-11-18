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
<title>联系人管理</title>
<link rel="stylesheet" href="css/index.css" type="text/css">
<link rel="stylesheet" href="css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script src="js/jquery-ui-1.9.2.js"></script>
<script type="text/javascript" src="js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript">
	function getContacts() {
		$.ajax({
					url : 'contact',
					data : {},
					type : 'post',
					dataType : 'text',
					success : function(data) {
						var str = data.trim();
						if (str != "") {
							contacts = eval("(" + str + ")");
							var html = "";
							for ( var i = 0; i < contacts.length; i++) {
								contactMap[contacts[i].id] = contacts[i];
								html = html
										+ "<tr><td><input type=\"checkbox\" name=\"chk\" "
										+ "onclick=\"docheck()\" id=\""
										+ contacts[i].id + "\"/></td><td>"
										+ contacts[i].zhname + "</td><td>"
										+ contacts[i].phone + "</td></tr>";
							}
							;
							$("table#contact_tablex").html(
									$("table#contact_tablex #header_tr")
										.prop("outerHTML") + html);
						}
					}
				});
	}
	$(function() {
		getContacts();
	});
	function checkx(obj) {
		if ($(obj).prop("checked")) {
			$("input[name='chk']").prop("checked", true);
		} else {
			$("input[name='chk']").prop("checked", false);
		}
		$("#cmgrform")[0].reset();
	}
	function insert() {
		var zhname = $("input[name='zhname']").val().trim();
		var departId = $('#depart option:selected').val().trim();
		var levelId = $('#level option:selected').val().trim();
		var username = $("input[name='username']").val().trim();
		var password = $("input[name='password']").val().trim();
		var phone = $("input[name='phone']").val().trim();
		if (zhname == "" || departId == "-1" || username == ""
				|| password == "" || phone == "") {
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
		if (levelId == "-1")
			levelId = "100";
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
					if (str == "add_success") {
						createTree("usermanager");
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
	}
	function delusers() {
		var zTree = $.fn.zTree.getZTreeObj("tree");
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
					if (str == "delete_success") {
						createTree("usermanager");
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
		if (zhname == "" || departId == "-1" || username == ""
				|| password == "" || phone == "") {
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
		if (levelId == "-1")
			levelId = "100";
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
					if (str == "update_success") {
						createTree("usermanager");
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
</head>
<body>
	<div style="position: absolute; left: 30px; top: 10px;">
		<div style="float: left; width: 320px; height: 60px;">
			<div
				style="overflow-x: auto; overflow-y: scroll; width: 280px; height: 360px; margin-top: 15px;">
				<div>
					<b>个人通讯录：</b>
				</div>
				<div>
					<table bordercolor="black" border="1" cellspacing="0"
						style="border-collapse: collapse; text-align: center;"
						id="contact_tablex">
						<tr id="header_tr">
							<th style="width: 40px;"><input type="checkbox"
								onclick="checkx(this)" /></th>
							<th style="width: 60px;">姓名</th>
							<th style="width: 100px;">号码</th>
						</tr>
						<tr>
							<td><input type="checkbox" name="chk"
								onclick="docheck(this)" id="7" /></td>
							<td>陈江涛</td>
							<td>18810996699</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="chk" /></td>
							<td>张长江</td>
							<td>18810993809</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="chk" /></td>
							<td>刘黄河</td>
							<td>18815678809</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div style="float: left; width: 650px; height: 360px;">
			<div style="margin-top: 15px;">
				<form action="" method="post" id="cmgrform">
					<table border="1" bordercolor="black" cellspacing="0"
						style="border-collapse: collapse; width: 590px;">
						<tr height="60px">
							<td class="color"><span>姓名<span style="color: red;">*</span>:
							</span></td>
							<td class="whitex"><span style="margin-left: 5px"> <input
									type="hidden" name="id" /> <input type="text" name="zhname"
									style="width: 140px" />
							</span></td>
						</tr>
						<tr height="60px">
							<td class="color"><span>手机号<span style="color: red;">*</span>:
							</span></td>
							<td class="whitex"><span style="margin-left: 5px"> <input
									type="text" name="phone" style="width: 140px" />
							</span></td>
						</tr>
						<tr height="30px">
							<td style="background-color: white; width: 1060px;" colspan="2">
								<div>
									<span style="margin-left: 100px"> <input type="button"
										value="添加" onclick="insert()" /></span> <span
										style="margin-left: 0px"> <input type="button"
										value="删除" onclick="delusers()" /></span> <span
										style="margin-left: 0px"> <input type="button"
										value="更新" onclick="updateUser()" /></span> <span><input
										type="button" value="重置" onclick="resetx()" />
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>