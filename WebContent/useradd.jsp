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
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<!-- <script type="text/javascript" src="js/jquery-1.4.4.min.js"></script> -->
<script src="js/jquery-ui-1.9.2.js"></script>
<script type="text/javascript">
	$(function() {
		//$(".ui-dialog-content").width(460);
// 		$("input[name='opener']").click(function(event) {
// 			$("#dialog").dialog("open");
// 			event.preventDefault();
// 		});

		//移到右边
		$('#add').click(function() {
			$('#select1 option:selected').remove().appendTo('#select2');
		});
		//移到左边
		$('#remove').click(function() {
			$('#select2 option:selected').remove().appendTo('#select1');
		});
		//双击选项
		$('#select1').dblclick(function() {
			$("option:selected", this).remove().appendTo('#select2');
		});
		//双击选项
		$('#select2').dblclick(function() {
			$("option:selected", this).remove().appendTo('#select1');
		});
		//左边向上按钮
		$('#left_up').click(
				function() {
					var index = $('#select1 option').index(
							$('#select1 option:selected:first'));
					var $recent = $('#select1 option:eq(' + (index - 1) + ')');
					if (index > 0) {
						var $options = $('#select1 option:selected').remove();
						setTimeout(function() {
							$recent.before($options);
						}, 10);
					}
				});
		//左边向下按钮
		$('#left_down').click(
				function() {
					var index = $('#select1 option').index(
							$('#select1 option:selected:last'));
					var len = $('#select1 option').length - 1;
					var $recent = $('#select1 option:eq(' + (index + 1) + ')');
					if (index < len) {
						var $options = $('#select1 option:selected').remove();
						setTimeout(function() {
							$recent.after($options);
						}, 10);
					}
				});
		//右边向上按钮
		$('#right_up').click(
				function() {
					var index = $('#select2 option').index(
							$('#select2 option:selected:first'));
					var $recent = $('#select2 option:eq(' + (index - 1) + ')');
					if (index > 0) {
						var $options = $('#select2 option:selected').remove();
						setTimeout(function() {
							$recent.before($options);
						}, 10);
					}
				});
		//右边向下按钮
		$('#right_down').click(
				function() {
					var index = $('#select2 option').index(
							$('#select2 option:selected:last'));
					var len = $('#select2 option').length - 1;
					var $recent = $('#select2 option:eq(' + (index + 1) + ')');
					if (index < len) {
						var $options = $('#select2 option:selected').remove();
						setTimeout(function() {
							$recent.after($options);
						}, 10);
					}
				});
	});
	var init = 0;
	function chooseReceiver() {
		if (init == 0) {
			init = 1;
			$("#dialog").dialog({
				dragable: true,
				autoOpen : false,
				bgiframe : true,
				width : 460,
				modal : true,
				title : "请选择收件人",
				position : [ 100, 100 ],
				open : function(event, ui) {
					$(".ui-dialog-titlebar").css("background-color","#B8C9D5");
					//$(".ui-dialog-titlebar-close", $(this).parent()).hide();
					$("span.ui-icon.ui-icon-closethick").html("<b>X</b>");
					$("span.ui-icon.ui-icon-closethick").parent().css("margin-left", "340px");
					$(this).parent().css("border-width","1px");
					$(this).parent().css("border-color","#808080");
					$(this).parent().css("border-style","solid");
				}
			});
		}
		$("#dialog").dialog("open");
	}
</script>
<style type="text/css">
body { /* background: #e8eff4;
	width: 1120px;  
	height: 485px; */
	/* border-width: 1px;
	border-color: grey;
	border-style: solid;  */
	
}
</style>
</head>
<body>
	<div style="position: absolute; left: 30px; top: 10px;">
		<table id="sendtable" border="1px" cellspacing="0px"
			style="border-collapse: collapse">
			<tr height="30px">
				<td class="color"><span>姓名<span style="color: red;">*</span>:</span></td>
				<td class="white"><span style="margin-left: 5px"> 
				<input type="text" name="zhname" style="width: 140px" />
				</span></td>
			</tr>
			<tr height="30px">
				<td class="color"><span>处室<span style="color: red;">*</span>:</span></td>
				<td class="white"><span style="margin-left: 5px"> 
				<input type="text" name="depart" style="width: 140px" />
				</span></td>
			</tr>
			<tr height="30px">
				<td class="color"><span>职务<span style="color: red;">*</span>:</span></td>
				<td class="white"><span style="margin-left: 5px"> 
				<input type="text" name="level" style="width: 140px" />
				</span></td>
			</tr>
			<tr height="30px">
				<td class="color"><span>用户名:</span></td>
				<td class="white"><span style="margin-left: 5px"> 
				<input type="text" name="username" style="width: 140px" />
				</span></td>
			</tr>
			<tr height="30px">
				<td class="color"><span>密码:</span></td>
				<td class="white"><span style="margin-left: 5px"> 
				<input type="text" name="password" style="width: 140px" />
				</span></td>
			</tr>
			<tr height="30px">
				<td class="color"><span>手机号:</span></td>
				<td class="white"><span style="margin-left: 5px"> 
				<input type="text" name="phone" style="width: 140px" />
				</span></td>
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
</body>
</html>