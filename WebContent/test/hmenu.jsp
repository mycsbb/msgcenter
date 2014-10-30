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
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<link href="test/nav.css" type="text/css" rel="stylesheet" />
	<style type="text/css">
	 body {
	 	background: #e8eff4;
	 	width: 1200px;
	 	margin: 0 auto;
	 }
	 ul li {
	 	list-style-type: none;
	 }
	 a:LINK {
		text-decoration: none;
 	 }
	 a:HOVER {
		text-decoration: underline;
	 }	
	</style>
</head>
<body>
<div id="nav_wrap">
  <div id="nav">
    <ul class="c">
      <li class="nav_lishw"> <span class="v"><a href="http://www.865171.cn">首 页</a></span>
        <div class="kind_menu" style="center: 20px; display: block;"> DIV+CSS模板、后台模板、图片图标下载，CSS代码实例、CSS导航菜单、CSS图表 - 免费模板网</div>
      </li>
      <li> <span class="v"><a href="http://www.865171.cn/css-templates">DIV+CSS模板</a></span>
        <div class="kind_menu" style="center: 20px; display: none;"> 大量DIV+CSS布局的网页模板下载，提供免费、美观、易修改的DIV+CSS HTML模板下载服务。</div>
      </li>
      <li> <span class="v"><a href="http://www.865171.cn/admin-templates/">后台模板</a></span>
        <div class="kind_menu" style="center: 20px; display: none;"> 大量实用、漂亮的后台模板下载，所有后台模板均系手工打造或修改，且均包含HTML文件。 </div>
      </li>
      <li> <span class="v"><a href="http://www.865171.cn/css-code">CSS代码实例</a></span>
        <div class="kind_menu" style="center: 20px; display: none;"> 提供大量CSS代码、CSS代码示例、CSS代码教程、CSS代码特效等，供大家学习交流之用。 </div>
      </li>
      <li> <span class="v"><a href="http://www.865171.cn/css-menu">CSS菜单</a></span>
        <div class="kind_menu" style="center: 20px; display: none;"> 提供大量CSS菜单、CSS导航菜单、CSS菜单教程、CSS菜单代码等，供大家学习交流之用。</div>
      </li>
      <li> <span class="v"><a href="http://www.865171.cn/css-chart">CSS图表</a></span>
        <div class="kind_menu" style="center: 20px; display: none;"> 提供大量CSS图表、CSS统计图表、CSS图表教程、CSS图表代码等，供大家学习交流之用。 </div>
      </li>
      <li> <span class="v"><a href="http://www.865171.cn/icons">图片图标</a></span>
        <div class="kind_menu" style="center: 20px; display: none;"> 提供大量GIF图片、GIF图片下载、GIF图标、GIF图标下载、GIF动画素材等图片下载服务。 </div>
      </li>
    </ul>
    <div class="bt_qnav"> <a href="http://www.865171.cn" title="更多服务" ><img src="bt_quickNav.gif"></a> </div>
  </div>
  <div id="tmenu"> </div>
</div>
</body>
</html>