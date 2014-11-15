<html>
 <head> 
  <base href="http://localhost:8080/msgcenter/" /> 
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
  <link rel="stylesheet" href="css/index.css" type="text/css" /> 
  <script type="text/javascript" src="js/jquery-1.8.3.js"></script> 
  <script type="text/javascript" src="js/jquery.ztree.core-3.5.js"></script> 
  <script type="text/javascript" src="js/jquery.ztree.excheck-3.5.js"></script> 
  <script type="text/javascript" src="js/jquery-ui-1.9.2.js"></script> 
  <script type="text/javascript"> var dialog_is_init = false; $(document).ready(function() { $("#funcpage").load("send.jsp"); }); function loadpage(name) { if (name == "usermgr") { $("#funcpage").load("usermgr.jsp"); } else if (name == "sendpage") { $("#funcpage").load("send.jsp"); } else if (name == "query") { $("#funcpage").load("query.jsp"); } else if (name == "useradd") { $("#funcpage").load("useradd.jsp"); } else if (name == "userdel") { $("#funcpage").load("userdel.jsp"); } else if (name == "userupdate") { $("#funcpage").load("userupdate.jsp"); } } function sendfeature() { // $("#sendmenu").css("display", "block"); // $("#usermenu").css("display", "none"); // $("#funcpage").load("send.jsp"); $("#funcmenu").children().css("display", "none"); $("#funcmenu").children("#sendmenu").css("display", "block"); $("#funcpage").load("send.jsp"); } function usermanager() { // $("#sendmenu").css("display", "none"); // $("#usermenu").css("display", "block"); // $("#funcpage").load("usermgr.jsp"); $("#funcmenu").children().css("display", "none"); $("#funcmenu").children("#usermenu").css("display", "block"); $("#funcpage").load("usermgr.jsp"); } function contacts_manager() { $("#funcmenu").children().css("display", "none"); $("#funcmenu").children("#contactmenu").css("display", "block"); } </script> 
  <title>Index</title> 
 </head> 
 <body> 
  <div style="position: absolute;left: 0px; top: 0px; width: 1365px;height: 605px; background-color: black; z-index: 99; display: none;" class="opacity" id="opadiv"></div> 
  <div id="headarea"> 
   <div style="width: 185px; height: 25px; float: right;margin-top: 52px"> 
    <span><a href="javascript:showinfo()">陈水宝</a>,欢迎你!</span> 
    <span><a href="auth?action=logout">注销</a></span> 
   </div> 
   <div style="height: 5px; width: 1360px; position: absolute; top: 75px;overflow: hidden;" class="line_up"></div> 
   <!-- <div style="height: 5px; margin-top: 0px;" class="line_down"></div> --> 
  </div> 
  <div id="menuarea"> 
   <div style="margin-top: 9px"> 
    <span class="yuan" style="background-color: #64C1E3;margin-left: 32px;"> <a href="javascript:" onclick="sendfeature()">短信发送</a></span> 
    <span class="yuan" style="background-color: #64C1E3;"> <a href="javascript:" onclick="usermanager()">用户管理</a></span> 
    <span class="yuan" style="background-color: #64C1E3;"> <a href="javascript:" onclick="contacts_manager()">通讯录管理</a></span> 
   </div> 
   <div style="height: 5px; margin-top: 5px; overflow: hidden;" class="line_up"></div> 
  </div> 
  <div id="funcarea"> 
   <div id="funcmenu"> 
    <div style="margin-top: 30px; margin-left: 30px; border-width: 1px; border-color: #808080; border-style: solid; width: 180px; height: 200px;" id="sendmenu"> 
     <div style="margin-top: 10px; margin-left: 15px;"> 
      <ul> 
       <li><a href="javascript:" onclick="loadpage('sendpage')">信息发送</a></li> 
       <li><a href="javascript:" onclick="loadpage('query')">历史查询</a></li> 
      </ul> 
     </div> 
    </div> 
    <div style="margin-top: 30px; margin-left: 30px; border-width: 1px; border-color: #808080; border-style: solid; width: 180px; height: 200px; display: none;" id="usermenu"> 
     <div style="margin-top: 10px; margin-left: 15px;"> 
      <ul> 
       <li><a href="javascript:" onclick="loadpage('usermgr')">用户管理</a></li> 
       <!-- <li><a href="javascript:" onclick="loadpage('useradd')">添加用户</a></li> --> 
       <!-- <li><a href="javascript:" onclick="loadpage('userdel')">删除用户</a></li> --> 
       <!-- <li><a href="javascript:" onclick="loadpage('userupdate')">更改用户</a></li> --> 
      </ul> 
     </div> 
    </div> 
    <div style="margin-top: 30px; margin-left: 30px; border-width: 1px; border-color: #808080; border-style: solid; width: 180px; height: 200px; display: none;" id="contactmenu"> 
     <div style="margin-top: 10px; margin-left: 15px;"> 
      <ul> 
       <li><a href="javascript:" onclick="loadpage('contactmgr')">通讯录管理</a></li> 
      </ul> 
     </div> 
    </div> 
   </div> 
   <div id="funcpage"> 
    <base href="http://localhost:8080/msgcenter/" /> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
    <title>Insert title here</title> 
    <link rel="stylesheet" href="css/zTreeStyle/zTreeStyle.css" type="text/css" /> 
    <link rel="stylesheet" href="css/index.css" type="text/css" /> 
    <style type="text/css"> ul.ztree { margin-top: 10px; border: 1px solid #617775; background: #f0f6e4; width: 220px; height: 360px; overflow-y: scroll; overflow-x: auto; } </style> 
    <div style="position: absolute; left: 30px; top: 10px;"> 
     <table id="sendtable" style="border-collapse: collapse;" border="1" bordercolor="black" cellspacing="0"> 
      <tbody>
       <tr height="30px"> 
        <td class="color"><span>任务名称:</span></td> 
        <td class="white"><span style="margin-left: 5px"> <input name="task" type="text" />(任务名称不会作为短信内容发出去) </span></td> 
       </tr> 
       <tr height="180px"> 
        <td class="color"><span>发送人<span style="color: red;">*</span>: </span></td> 
        <td class="white"> 
         <div style="overflow:"> 
          <span style="margin-left: 5px;"> <textarea style="width: 550px; height: 120px; overflow-y: scroll;" id="peers"></textarea> </span> 
          <span style="margin-bottom: 50px;"> <input name="opener" onclick="chooseReceiver()" value="选择收信人" type="button" /> </span> 
         </div> 
         <div style="margin-left: 5px;">
           自定义接收人(
          <span style="color: red;">号码以分号;隔开</span>): 
          <input name="optional_peers" style="width: 310px" type="text" /> 
         </div> </td> 
       </tr> 
       <tr height="180px"> 
        <td class="color"><span>发送内容<span style="color: red;">*</span>: </span></td> 
        <td class="white"> 
         <div style="overflow:"> 
          <span style="margin-left: 5px;"> <textarea style="width: 550px; height: 120px; overflow-y: scroll;" id="msgarea"></textarea> </span> 
          <span style=""> <input onclick="sendmsg()" value="发送" type="button" /> </span> 
          <span id="result"></span> 
         </div> </td> 
       </tr> 
       <tr height="30px"> 
        <td style="background-color: white; width: 1060px; text-align: center;" colspan="2"> 
         <div> 
          <span>(本系统仅供参考)</span> 
         </div> </td> 
       </tr> 
      </tbody>
     </table> 
    </div> 
   </div> 
  </div> 
  <div aria-labelledby="ui-id-1" role="dialog" tabindex="-1" style="display: none; outline: 0px none; z-index: 1000; position: relative;" class="ui-dialog ui-widget ui-widget-content ui-corner-all ui-draggable ui-resizable">
   <div style="background-color: rgb(184, 201, 213);" class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
    <span class="ui-dialog-title" id="ui-id-1">请选择收件人</span>
    <a style="margin-left: 340px;" role="button" class="ui-dialog-titlebar-close ui-corner-all" href="#"><span class="ui-icon ui-icon-closethick"><b>X</b></span></a>
   </div>
   <div class="ui-dialog-content ui-widget-content" id="dialog" style="width: 460px; height: 400px; background-color: rgb(230, 230, 230);"> 
    <fieldset id="fs" style="width: 412px; height: 400px; border: inset; border-top-width: 3px; border-right-width: 3px; border-bottom-width: 3px; border-left-width: 3px; background-color: #DFECF9"> 
     <div class="zTreeBackground left" style="margin-left: 20px; margin-top: 6px; float: left; width: 240px; height: 380px; "> 
      <ul style="-moz-user-select: none;" id="tree" class="ztree">
       <li id="tree_1" class="level0" tabindex="0" hidefocus="true" treenode=""><span id="tree_1_switch" title="" class="button level0 switch root_open" treenode_switch=""></span><span id="tree_1_check" class="button chk checkbox_false_full" treenode_check=""></span><a id="tree_1_a" class="level0" treenode_a="" onclick="" target="_blank" style="" title="中国证监会"><span id="tree_1_ico" title="" treenode_ico="" class="button ico_open" style=""></span><span id="tree_1_span">中国证监会</span></a>
        <ul id="tree_1_ul" class="level0 " style="display:block">
         <li id="tree_2" class="level1" tabindex="0" hidefocus="true" treenode=""><span id="tree_2_switch" title="" class="button level1 switch bottom_open" treenode_switch=""></span><span id="tree_2_check" class="button chk checkbox_false_full" treenode_check=""></span><a id="tree_2_a" class="level1" treenode_a="" onclick="" target="_blank" style="" title="稽查局"><span id="tree_2_ico" title="" treenode_ico="" class="button ico_open" style=""></span><span id="tree_2_span">稽查局</span></a>
          <ul id="tree_2_ul" class="level1 " style="display:block">
           <li id="tree_3" class="level2" tabindex="0" hidefocus="true" treenode=""><span id="tree_3_switch" title="" class="button level2 switch center_docu" treenode_switch=""></span><span id="tree_3_check" class="button chk checkbox_false_full" treenode_check=""></span><a id="tree_3_a" class="level2" treenode_a="" onclick="" target="_blank" style="" title="欧阳健生"><span id="tree_3_ico" title="" treenode_ico="" class="button ico_docu" style=""></span><span id="tree_3_span">欧阳健生</span></a></li>
           <li id="tree_4" class="level2" tabindex="0" hidefocus="true" treenode=""><span id="tree_4_switch" title="" class="button level2 switch center_open" treenode_switch=""></span><span id="tree_4_check" class="button chk checkbox_false_full" treenode_check=""></span><a id="tree_4_a" class="level2" treenode_a="" onclick="" target="_blank" style="" title="综合处"><span id="tree_4_ico" title="" treenode_ico="" class="button ico_open" style=""></span><span id="tree_4_span">综合处</span></a>
            <ul id="tree_4_ul" class="level2 line" style="display:block">
             <li id="tree_5" class="level3" tabindex="0" hidefocus="true" treenode=""><span id="tree_5_switch" title="" class="button level3 switch bottom_docu" treenode_switch=""></span><span id="tree_5_check" class="button chk checkbox_false_full" treenode_check=""></span><a id="tree_5_a" class="level3" treenode_a="" onclick="" target="_blank" style="" title="斐胜春"><span id="tree_5_ico" title="" treenode_ico="" class="button ico_docu" style=""></span><span id="tree_5_span">斐胜春</span></a></li>
            </ul></li>
           <li id="tree_6" class="level2" tabindex="0" hidefocus="true" treenode=""><span id="tree_6_switch" title="" class="button level2 switch center_open" treenode_switch=""></span><span id="tree_6_check" class="button chk checkbox_false_full" treenode_check=""></span><a id="tree_6_a" class="level2" treenode_a="" onclick="" target="_blank" style="" title="立案处"><span id="tree_6_ico" title="" treenode_ico="" class="button ico_open" style=""></span><span id="tree_6_span">立案处</span></a>
            <ul id="tree_6_ul" class="level2 line" style="display:block">
             <li id="tree_7" class="level3" tabindex="0" hidefocus="true" treenode=""><span id="tree_7_switch" title="" class="button level3 switch bottom_docu" treenode_switch=""></span><span id="tree_7_check" class="button chk checkbox_false_full" treenode_check=""></span><a id="tree_7_a" class="level3" treenode_a="" onclick="" target="_blank" style="" title="孙凌"><span id="tree_7_ico" title="" treenode_ico="" class="button ico_docu" style=""></span><span id="tree_7_span">孙凌</span></a></li>
            </ul></li>
           <li id="tree_8" class="level2" tabindex="0" hidefocus="true" treenode=""><span id="tree_8_switch" title="" class="button level2 switch center_open" treenode_switch=""></span><span id="tree_8_check" class="button chk checkbox_false_full" treenode_check=""></span><a id="tree_8_a" class="level2" treenode_a="" onclick="" target="_blank" style="" title="督查一处"><span id="tree_8_ico" title="" treenode_ico="" class="button ico_open" style=""></span><span id="tree_8_span">督查一处</span></a>
            <ul id="tree_8_ul" class="level2 line" style="display:block">
             <li id="tree_9" class="level3" tabindex="0" hidefocus="true" treenode=""><span id="tree_9_switch" title="" class="button level3 switch bottom_docu" treenode_switch=""></span><span id="tree_9_check" class="button chk checkbox_false_full" treenode_check=""></span><a id="tree_9_a" class="level3" treenode_a="" onclick="" target="_blank" style="" title="王鲁"><span id="tree_9_ico" title="" treenode_ico="" class="button ico_docu" style=""></span><span id="tree_9_span">王鲁</span></a></li>
            </ul></li>
           <li id="tree_10" class="level2" tabindex="0" hidefocus="true" treenode=""><span id="tree_10_switch" title="" class="button level2 switch center_open" treenode_switch=""></span><span id="tree_10_check" class="button chk checkbox_false_full" treenode_check=""></span><a id="tree_10_a" class="level2" treenode_a="" onclick="" target="_blank" style="" title="督查二处"><span id="tree_10_ico" title="" treenode_ico="" class="button ico_open" style=""></span><span id="tree_10_span">督查二处</span></a>
            <ul id="tree_10_ul" class="level2 line" style="display:block">
             <li id="tree_11" class="level3" tabindex="0" hidefocus="true" treenode=""><span id="tree_11_switch" title="" class="button level3 switch bottom_docu" treenode_switch=""></span><span id="tree_11_check" class="button chk checkbox_false_full" treenode_check=""></span><a id="tree_11_a" class="level3" treenode_a="" onclick="" target="_blank" style="" title="吴茜"><span id="tree_11_ico" title="" treenode_ico="" class="button ico_docu" style=""></span><span id="tree_11_span">吴茜</span></a></li>
            </ul></li>
           <li id="tree_12" class="level2" tabindex="0" hidefocus="true" treenode=""><span id="tree_12_switch" title="" class="button level2 switch bottom_open" treenode_switch=""></span><span id="tree_12_check" class="button chk checkbox_false_full" treenode_check=""></span><a id="tree_12_a" class="level2" treenode_a="" onclick="" target="_blank" style="" title="技术指导处"><span id="tree_12_ico" title="" treenode_ico="" class="button ico_open" style=""></span><span id="tree_12_span">技术指导处</span></a>
            <ul id="tree_12_ul" class="level2 " style="display:block">
             <li id="tree_13" class="level3" tabindex="0" hidefocus="true" treenode=""><span id="tree_13_switch" title="" class="button level3 switch center_docu" treenode_switch=""></span><span id="tree_13_check" class="button chk checkbox_false_full" treenode_check=""></span><a id="tree_13_a" class="level3" treenode_a="" onclick="" target="_blank" style="" title="王晓新"><span id="tree_13_ico" title="" treenode_ico="" class="button ico_docu" style=""></span><span id="tree_13_span">王晓新</span></a></li>
             <li id="tree_14" class="level3" tabindex="0" hidefocus="true" treenode=""><span id="tree_14_switch" title="" class="button level3 switch center_docu" treenode_switch=""></span><span id="tree_14_check" class="button chk checkbox_false_full" treenode_check=""></span><a id="tree_14_a" class="level3" treenode_a="" onclick="" target="_blank" style="" title="陈水宝"><span id="tree_14_ico" title="" treenode_ico="" class="button ico_docu" style=""></span><span id="tree_14_span">陈水宝</span></a></li>
             <li id="tree_15" class="level3" tabindex="0" hidefocus="true" treenode=""><span id="tree_15_switch" title="" class="button level3 switch bottom_docu" treenode_switch=""></span><span id="tree_15_check" class="button chk checkbox_false_full" treenode_check=""></span><a id="tree_15_a" class="level3" treenode_a="" onclick="" target="_blank" style="" title="陈明"><span id="tree_15_ico" title="" treenode_ico="" class="button ico_docu" style=""></span><span id="tree_15_span">陈明</span></a></li>
            </ul></li>
          </ul></li>
        </ul></li>
      </ul> 
     </div> 
     <div style="margin-left: 0px; float: left; width: 130px; height: 380px;"> 
      <div style="margin-left: 30px; margin-top: 40px;"> 
       <div>
        <input value="确定" onclick="choose_confirm()" type="button" />
       </div> 
       <div style="margin-top: 20px;"> 
        <input value="取消" onclick="choose_cancel()" type="button" />
       </div> 
      </div> 
     </div> 
    </fieldset> 
   </div>
   <div style="z-index: 1000;" class="ui-resizable-handle ui-resizable-n"></div>
   <div style="z-index: 1000;" class="ui-resizable-handle ui-resizable-e"></div>
   <div style="z-index: 1000;" class="ui-resizable-handle ui-resizable-s"></div>
   <div style="z-index: 1000;" class="ui-resizable-handle ui-resizable-w"></div>
   <div style="z-index: 1000;" class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se"></div>
   <div style="z-index: 1000;" class="ui-resizable-handle ui-resizable-sw"></div>
   <div style="z-index: 1000;" class="ui-resizable-handle ui-resizable-ne"></div>
   <div style="z-index: 1000;" class="ui-resizable-handle ui-resizable-nw"></div>
  </div>
 </body>
</html>