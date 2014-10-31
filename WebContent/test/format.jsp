<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/WEB-INF/struts-tags.tld"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String type = request.getParameter("type");
	if (type != null) session.setAttribute("type", type);
	
	String subTaskIDs = request.getParameter("subTaskIDs");
	if (subTaskIDs != null) session.setAttribute("subTaskIDs", subTaskIDs);
	
	String status = request.getParameter("status");
	String qcond = request.getParameter("qcond");
	if (qcond != null) {
		System.out.println("qcond: not null+" + qcond);
	} else
		System.out.println("qcond: null");
	
	String ischecked = request.getParameter("ischecked");
	String searchkeyword = request.getParameter("searchkeyword");
	
    //out.print(type);
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="assets/css/contents.css" />
<script type="text/javascript" src="assets/js/common.js"></script>
<script type="text/javascript" src="assets/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="assets/js/jquery-ui.js"></script>
 <script type="text/javascript">
  $(function(){
       //移到右边
	   $('#add').click(function() {
		   alert(567);
			$('#select1 option:selected').remove().appendTo('#select2');
	   });
	   //移到左边
	   $('#remove').click(function() {
			$('#select2 option:selected').remove().appendTo('#select1');
	   });
       //双击选项
	   $('#select1').dblclick(function(){
	       $("option:selected",this).remove().appendTo('#select2');
	   });
	   //双击选项
       $('#select2').dblclick(function(){
	       $("option:selected",this).remove().appendTo('#select1');
	   });
	   //左边向上按钮
	   $('#left_up').click(function(){
	      var index =  $('#select1 option').index($('#select1 option:selected:first'));
		  var $recent =  $('#select1 option:eq('+(index-1)+')');
		  if(index>0){
		     var $options = $('#select1 option:selected').remove();
			 setTimeout(function(){
				  $recent.before($options )
			 },10);
		  }
	   });
	   //左边向下按钮
	   $('#left_down').click(function(){
	      var index =  $('#select1 option').index($('#select1 option:selected:last'));
		  var len = $('#select1 option').length-1;
		  var $recent =  $('#select1 option:eq('+(index+1)+')');
		  if(index<len ){
		 	 var $options = $('#select1 option:selected').remove();
			 setTimeout(function(){
				 $recent.after( $options )
			 },10);
		   }
	   });
	   //右边向上按钮
	   $('#right_up').click(function(){
	      var index =  $('#select2 option').index($('#select2 option:selected:first'));
		  var $recent =  $('#select2 option:eq('+(index-1)+')');
		  if(index>0){
		     var $options = $('#select2 option:selected').remove();
			 setTimeout(function(){
				  $recent.before($options )
			 },10);
		  }
	   });
	   //右边向下按钮
	   $('#right_down').click(function(){
	      var index =  $('#select2 option').index($('#select2 option:selected:last'));
		  var len = $('#select2 option').length-1;
		  var $recent =  $('#select2 option:eq('+(index+1)+')');
		  if(index<len ){
		 	 var $options = $('#select2 option:selected').remove();
			 setTimeout(function(){
				 $recent.after( $options );
			 },10);
		   }
	   });
  });
  
  
  var Sys = {};
	var ua = navigator.userAgent.toLowerCase();
	window.ActiveXObject ? Sys.ie = ua.match(/msie ([\d.]+)/)[1]
			: document.getBoxObjectFor ? Sys.firefox = ua
					.match(/firefox\/([\d.]+)/)[1]
					: window.MessageEvent && !document.getBoxObjectFor ? Sys.chrome = ua
							.match(/chrome\/([\d.]+)/)[1]
							: window.opera ? Sys.opera = ua
									.match(/opera.([\d.]+)/)[1]
									: window.openDatabase ? Sys.safari = ua
											.match(/version\/([\d.]+)/)[1]
											: 0; 
  
  
  function afterChsLan() {
	     //以下进行测试
	     if(Sys.ie) {
	    	 //document.write('IE: '+Sys.ie);
	    	 var languages = "";
	    		var item;
	    		if($("#select2 option").length>0) {
	    			$("#select2 option").each(
	    					function(index) {
	    						item = this.text;
	    						languages += item+",";
	    						//alert(item);
	    					}
	    					);
	    			window.location.href = getRootPath() + "/task/assignTo.jsp?languages=" + languages;
	    		}
	     } else if(Sys.firefox) {
	    	 document.write('Firefix: '+Sys.ie);
	    	 var languages = "";
	    		var item;
	    		if($("#select2 option").length>0) {
	    			$("#select2 option").each(
	    					function(index) {
	    						item = this.text;
	    						languages += item+",";
	    						//alert(item);
	    					}
	    					);
	    			window.location.href = getRootPath() + "/task/assignTo.jsp?languages=" + languages;
	             }
	     } else if(Sys.chrome) {
	    	 //document.write('IE: '+Sys.ie);
	    	 var languages = "";
	    		var item;
	    		if($("#select2 option").length>0) {
	    			$("#select2 option").each(
	    					function(index) {
	    						item = this.text;
	    						languages += item+",";
	    						//alert(item);
	    					}
	    					);
	    			window.location.href = getRootPath() + "/task/assignTo.jsp?languages=" + languages;
	             } 
		
	      } else {
	    	  var languages = "";
	    		var item;
	    		if($("#select2 option").length>0) {
	    			$("#select2 option").each(
	    					function(index) {
	    						item = this.text;
	    						languages += item+",";
	    						//alert(item);
	    					}
	    					);
	    			window.location.href = getRootPath() + "/task/assignTo.jsp?languages=" + languages;
	             } 
	      }
  }
  
  function goPre() {
	  var status = $.trim($("#status").val());
	  var qcond = $.trim($("#qcond").val());
	  var ischecked = $.trim($("#ischecked").val());
	  var searchkeyword = $.trim($("#searchkeyword").val());
	  if(status == "1") {
		  //alert(1);
		  window.location.href = getRootPath() + '/admin/taskListById.action?status=' + status;
		  //window.location.href= getRootPath() + '/admin/taskListById.action?qcond=' + qcond;
	  } else if(status == "2"){
		 // alert(2);
		  window.location.href = getRootPath() + "/admin/SearchtaskById.action?listname=taskByIdlist&ischecked=" + ischecked + "&searchkeyword=" + searchkeyword + '&status=' + status;
	  } else if(status == "3"){
		  // alert(3);
		  //alert("qcond: "+ qcond);
		  //alert("qcond: "+ qcond.replace("%","%25"));
		  qcond = qcond.replace(/%/g,"%25");
		  window.location.href = getRootPath() + "/admin/taskListById.action?qcond=" + qcond + "&status=" + status;
	  } else {
		  //alert("else");
		  history.go(-1);
	  }
  }
  
  
 </script>
 
 <style type="text/css">
  a {
   display: block;
   border: 1px solid #aaa;
   text-decoration: none;
  }
  div {
   float:left;
   text-align: center;
   margin: 10px;
  }
  .con_div{
width:100px;
height:260px;
border:0px solid #777;
text-align:center;
display:table-cell;
vertical-align:middle;
line-height:30px;
}
 </style>
 
</head>
<body class="bd">
<br>
<h3>Choose language</h3>
<div >


 <div>
  <select multiple id="select1" style="width: 200px;height:260px;">
  <s:iterator value="#session.languages" id="item" status="s">
   <option value="#s.index+1"><s:property value="#item" /></option>
   </s:iterator>
  </select>
  <!-- <a href="javascript:void(0)" id="left_up">上移</a>
  <a href="javascript:void(0)" id="left_down">下移</a>
  <a href="javascript:void(0)" id="add">添加到右边&gt;&gt;</a> -->
 </div>
<div class="con_div">
<br>
<br>
<a href="javascript:void(0)" id="add">&gt;&gt;</a>
<br>
<a href="javascript:void(0)" id="remove">&lt;&lt;</a>
</div>
 <div>
  <select multiple id="select2" style="width: 200px;height:260px;">
  </select>
 <!--  <a href="javascript:void(0)" id="right_up">上移</a>
  <a href="javascript:void(0)" id="right_down">下移</a>
  <a href="javascript:void(0)" id="remove">&lt;&lt; 添加到左边</a> -->
 </div>
 <div>
   <span><input type="hidden"  id="status" value="<%=status %>"/></span>
   <span><input type="hidden"  id="qcond" value="<%=qcond %>"/></span>
   <span><input type="hidden"  id="ischecked" value="<%=ischecked %>"/></span>
   <span><input type="hidden"  id="searchkeyword" value="<%=searchkeyword %>"/></span>
 </div>
 
<div style="width:100%"><input type="button" value="Back" onclick="goPre();" /> 
<input type="button" value="&nbsp;&nbsp;Next&nbsp;&nbsp;" onclick="afterChsLan();" />
</div>
</div>
<!--  <div><input type="button" value="&lt;&lt;" onclick="goPre();" /></div>
<div><input type="button" value="&gt;&gt;" onclick="afterChsLan();" /></div> -->


<style>
*{
 font-size:12px;
}
.highlight{
 font-weight:bold;
 color:red;
}
</style>


</body>
</html>