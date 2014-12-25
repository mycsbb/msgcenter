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
<title>个人通讯录</title>
<link rel="stylesheet" href="css/index.css" type="text/css">
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript">
	var contactMap = new Object();
	function getContacts() {
		$.ajax({
					url : 'contact',
					data : {},
					type : 'post',
					dataType : 'text',
					success : function(data) {
						var str = data.trim();
						if (str != "") {
							if (str.substr(0,9) == "<!DOCTYPE") {
								alert("session expired");
								return;
							}
							contacts = eval("(" + str + ")");
							var html = "";
							for ( var i = 0; i < contacts.length; i++) {
								contactMap[contacts[i].id] = contacts[i];
								html = html
										+ "<tr><td><input type=\"checkbox\" name=\"chkx\" "
										+ "onclick=\"docheck(this)\" id=\""
										+ contacts[i].id + "\"/></td><td>"
										+ contacts[i].zhname + "</td><td>"
										+ contacts[i].phone + "</td></tr>";
							}
							$("table#contact_tablex").html("<tbody>" + 
									$("#header_trx").prop("outerHTML") + html + "</tbody>");
						} else {
							$("table#contact_tablex").html("<tbody>" + 
									$("#header_trx").prop("outerHTML") + "</tbody>");
						}
					}
				});
	}
	$(function() {
// 		var pos = getElementPosition($("#funcpage")[0]);
// 		alert(pos.left + " " + pos.top);
		//getContacts();
		contacts = eval('(${requestScope.contacts})');
		var html = "";
		for ( var i = 0; i < contacts.length; i++) {
			contactMap[contacts[i].id] = contacts[i];
			html = html
					+ "<tr><td><input type=\"checkbox\" name=\"chkx\" "
					+ "onclick=\"docheck(this)\" id=\""
					+ contacts[i].id + "\"/></td><td>"
					+ contacts[i].zhname + "</td><td>"
					+ contacts[i].phone + "</td></tr>";
		}
		$("table#contact_tablex").html("<tbody>" + 
				$("#header_trx").prop("outerHTML") + html + "</tbody>");
	});
	function checkx(obj) {
		if ($(obj).prop("checked")) {
			$("input[name='chkx']").prop("checked", true);
		} else {
			$("input[name='chkx']").prop("checked", false);
		}
		$("#cmgrform")[0].reset();
	}
	function docheck(obj) {
		var n = $("input[name='chkx']:checked").length;
		var len = $("input[name='chkx']").length;
		if (len == 1) {
			if ($(obj).prop("checked")) {
				$("#allchkx").prop("checked", true);
				var id = $(obj).attr("id");
				$("input[name='id']").val(id);
				$("input[name='zhname']").val(contactMap[id].zhname);
				$("input[name='phone']").val(contactMap[id].phone);
			} else {
				$("#allchkx").prop("checked", false);
				$("#cmgrform")[0].reset();
			}
			return;
		}
		$("#allchkx").prop("checked", false);
		if (n == 0) {
			$("#cmgrform")[0].reset();
		} else if (n == 1) {
			var id = $(obj).attr("id");
			$("input[name='id']").val(id);
			$("input[name='zhname']").val(contactMap[id].zhname);
			$("input[name='phone']").val(contactMap[id].phone);
		} else if ($("input[name='chkx']").length == n) {
			$("#allchkx").prop("checked", true);
			$("#cmgrform")[0].reset();
		} else {
			$("#cmgrform")[0].reset();
		}
	}
	function resetx() {
		$("#allchkx").prop("checked", false);
		$("input[name='chkx']").prop("checked", false);
		$("#cmgrform")[0].reset();
	}
	function insert() {
		var zhname = $("input[name='zhname']").val().trim();
		var phone = $("input[name='phone']").val().trim();
		if (zhname == "" || phone == "") {
			alert("必选项不能为空！");
			return;
		}
		var reg = /^[1-9]{1}\d{3,10}$/;
		if (!reg.test(phone)) {
			alert("电话格式不正确！");
			return;
		}
		$.ajax({
			url : 'contact?action=insert',
			data : {
				zhname : zhname,
				phone : phone
			},
			type : 'post',
			dataType : 'text',
			success : function(data) {
				var str = data.trim();
				if (str != "") {
					if (str.substr(0,9) == "<!DOCTYPE") {
						alert("session expired");
						return;
					}
					if (str == "add_success") {
						getContacts();
						resetx();
						alert("添加成功！");
					} else {
						alert(str);
					}
				}
			}
		});
	}
	function delcontacts() {
		if ($("input[name='chkx']:checked").length == 0) {
			alert("请选择要删除的联系人！");
			return;
		}
		
		var idstr = "";
		$("input[name='chkx']:checked").each(function() {
			var id = $(this).attr("id");
			idstr += idstr + id + ",";
		});
		var reg = /^(\d+,)+$/;
		if (!reg.test(idstr)) {
			alert("请选择要删除的联系人！");
			return;
		}
		$.ajax({
			url : 'contact?action=delete',
			data : {
				idstr : idstr
			},
			type : 'post',
			dataType : 'text',
			success : function(data) {
				var str = data.trim();
				if (str != "") {
					if (str.substr(0,9) == "<!DOCTYPE") {
						alert("session expired");
						return;
					}
					if (str == "delete_success") {
						getContacts();
						resetx();
						alert("删除成功！");
					} else {
						alert(str);
					}
				}
			}
		});
	}

	function updateContact() {
		var id = $("input[name='id']").val().trim();
		var zhname = $("input[name='zhname']").val().trim();
		var phone = $("input[name='phone']").val().trim();
		if (zhname == "" || phone == "") {
			alert("必选项不能为空！");
			return;
		}
		if (id == "") {
			alert("请重新选择要更改的联系人！");
			return;
		}
		var reg = /^[1-9]{1}\d{3,10}$/;
		if (!reg.test(phone)) {
			alert("电话格式不正确！");
			return;
		}
		$.ajax({
			url : 'contact?action=update',
			data : {
				id : id,
				zhname : zhname,
				phone : phone
			},
			type : 'post',
			dataType : 'text',
			success : function(data) {
				var str = data.trim();
				if (str != "") {
					if (str.substr(0,9) == "<!DOCTYPE") {
						alert("session expired");
						return;
					}
					if (str == "update_success") {
						getContacts();
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
<!-- 	<div style="position: absolute; left: 273px; top: 139px;"> -->
	<div style="margin-left: 30px; margin-top: 10px;">
		<div style="float: left; width: 320px; height: 60px;">
			<div
				style="overflow-x: auto; overflow-y: scroll; width: 280px; height: 360px; margin-top: 15px;">
				<div>
					<b>个人通讯录：</b>
				</div>
				<div>
					<table border="0" cellspacing="0"
						style="text-align: center;"
						id="contact_tablex">
						<tr id="header_trx">
							<th style="width: 40px;"><input type="checkbox"
								onclick="checkx(this)" id="allchkx"/></th>
							<th style="width: 60px;">姓名</th>
							<th style="width: 100px;">号码</th>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div style="float: left; width: 650px; height: 360px;">
			<div style="margin-top: 15px;">
				<form action="" method="post" id="cmgrform">
					<table border="0" cellspacing="0"
						style="width: 590px;">
						<tr height="60px">
							<td class="color2"><span>姓名<span style="color: red;">*</span>:
							</span></td>
							<td class="whitex"><span style="margin-left: 5px"> <input
									type="hidden" name="id" /> <input type="text" name="zhname"
									style="width: 140px" />
							</span></td>
						</tr>
						<tr height="60px">
							<td class="color2"><span>手机号<span style="color: red;">*</span>:
							</span></td>
							<td class="whitex"><span style="margin-left: 5px"> <input
									type="text" name="phone" style="width: 140px" />
							</span></td>
						</tr>
						<tr height="53px">
							<td style="width: 1060px;" colspan="2">
								<div>
									<span style="margin-left: 137px"> <input type="button"
										value="添加" onclick="insert()" style="width: 48px;"/></span> <span
										style="margin-left: 6px"> <input type="button"
										value="删除" onclick="delcontacts()" style="width: 48px;"/></span> <span
										style="margin-left: 7px"> <input type="button"
										value="更新" onclick="updateContact()" style="width: 48px;"/></span>
										 <span style="margin-left: 7px"><input type="button" value="重置" onclick="resetx()" style="width: 48px;"/></span>
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