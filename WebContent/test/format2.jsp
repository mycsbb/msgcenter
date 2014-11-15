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
  <style class="firebugResetStyles" type="text/css" charset="utf-8">/* See license.txt for terms of usage */ /** reset styling **/ .firebugResetStyles { z-index: 2147483646 !important; top: 0 !important; left: 0 !important; display: block !important; border: 0 none !important; margin: 0 !important; padding: 0 !important; outline: 0 !important; min-width: 0 !important; max-width: none !important; min-height: 0 !important; max-height: none !important; position: fixed !important; transform: rotate(0deg) !important; transform-origin: 50% 50% !important; border-radius: 0 !important; box-shadow: none !important; background: transparent none !important; pointer-events: none !important; white-space: normal !important; } style.firebugResetStyles { display: none !important; } .firebugBlockBackgroundColor { background-color: transparent !important; } .firebugResetStyles:before, .firebugResetStyles:after { content: "" !important; } /**actual styling to be modified by firebug theme**/ .firebugCanvas { display: none !important; } /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */ .firebugLayoutBox { width: auto !important; position: static !important; } .firebugLayoutBoxOffset { opacity: 0.8 !important; position: fixed !important; } .firebugLayoutLine { opacity: 0.4 !important; background-color: #000000 !important; } .firebugLayoutLineLeft, .firebugLayoutLineRight { width: 1px !important; height: 100% !important; } .firebugLayoutLineTop, .firebugLayoutLineBottom { width: 100% !important; height: 1px !important; } .firebugLayoutLineTop { margin-top: -1px !important; border-top: 1px solid #999999 !important; } .firebugLayoutLineRight { border-right: 1px solid #999999 !important; } .firebugLayoutLineBottom { border-bottom: 1px solid #999999 !important; } .firebugLayoutLineLeft { margin-left: -1px !important; border-left: 1px solid #999999 !important; } /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */ .firebugLayoutBoxParent { border-top: 0 none !important; border-right: 1px dashed #E00 !important; border-bottom: 1px dashed #E00 !important; border-left: 0 none !important; position: fixed !important; width: auto !important; } .firebugRuler{ position: absolute !important; } .firebugRulerH { top: -15px !important; left: 0 !important; width: 100% !important; height: 14px !important; background: url("data:image/png,%89PNG%0D%0A%1A%0A%00%00%00%0DIHDR%00%00%13%88%00%00%00%0E%08%02%00%00%00L%25a%0A%00%00%00%04gAMA%00%00%D6%D8%D4OX2%00%00%00%19tEXtSoftware%00Adobe%20ImageReadyq%C9e%3C%00%00%04%F8IDATx%DA%EC%DD%D1n%E2%3A%00E%D1%80%F8%FF%EF%E2%AF2%95%D0D4%0E%C1%14%B0%8Fa-%E9%3E%CC%9C%87n%B9%81%A6W0%1C%A6i%9A%E7y%0As8%1CT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AATE9%FE%FCw%3E%9F%AF%2B%2F%BA%97%FDT%1D~K(%5C%9D%D5%EA%1B%5C%86%B5%A9%BDU%B5y%80%ED%AB*%03%FAV9%AB%E1%CEj%E7%82%EF%FB%18%BC%AEJ8%AB%FA'%D2%BEU9%D7U%ECc0%E1%A2r%5DynwVi%CFW%7F%BB%17%7Dy%EACU%CD%0E%F0%FA%3BX%FEbV%FEM%9B%2B%AD%BE%AA%E5%95v%AB%AA%E3E5%DCu%15rV9%07%B5%7F%B5w%FCm%BA%BE%AA%FBY%3D%14%F0%EE%C7%60%0EU%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5JU%88%D3%F5%1F%AE%DF%3B%1B%F2%3E%DAUCNa%F92%D02%AC%7Dm%F9%3A%D4%F2%8B6%AE*%BF%5C%C2Ym~9g5%D0Y%95%17%7C%C8c%B0%7C%18%26%9CU%CD%13i%F7%AA%90%B3Z%7D%95%B4%C7%60%E6E%B5%BC%05%B4%FBY%95U%9E%DB%FD%1C%FC%E0%9F%83%7F%BE%17%7DkjMU%E3%03%AC%7CWj%DF%83%9An%BCG%AE%F1%95%96yQ%0Dq%5Dy%00%3Et%B5'%FC6%5DS%95pV%95%01%81%FF'%07%00%00%00%00%00%00%00%00%00%F8x%C7%F0%BE%9COp%5D%C9%7C%AD%E7%E6%EBV%FB%1E%E0(%07%E5%AC%C6%3A%ABi%9C%8F%C6%0E9%AB%C0'%D2%8E%9F%F99%D0E%B5%99%14%F5%0D%CD%7F%24%C6%DEH%B8%E9rV%DFs%DB%D0%F7%00k%FE%1D%84%84%83J%B8%E3%BA%FB%EF%20%84%1C%D7%AD%B0%8E%D7U%C8Y%05%1E%D4t%EF%AD%95Q%BF8w%BF%E9%0A%BF%EB%03%00%00%00%00%00%00%00%00%00%B8vJ%8E%BB%F5%B1u%8Cx%80%E1o%5E%CA9%AB%CB%CB%8E%03%DF%1D%B7T%25%9C%D5(%EFJM8%AB%CC'%D2%B2*%A4s%E7c6%FB%3E%FA%A2%1E%80~%0E%3E%DA%10x%5D%95Uig%15u%15%ED%7C%14%B6%87%A1%3B%FCo8%A8%D8o%D3%ADO%01%EDx%83%1A~%1B%9FpP%A3%DC%C6'%9C%95gK%00%00%00%00%00%00%00%00%00%20%D9%C9%11%D0%C0%40%AF%3F%EE%EE%92%94%D6%16X%B5%BCMH%15%2F%BF%D4%A7%C87%F1%8E%F2%81%AE%AAvzr%DA2%ABV%17%7C%E63%83%E7I%DC%C6%0Bs%1B%EF6%1E%00%00%00%00%00%00%00%00%00%80cr%9CW%FF%7F%C6%01%0E%F1%CE%A5%84%B3%CA%BC%E0%CB%AA%84%CE%F9%BF)%EC%13%08WU%AE%AB%B1%AE%2BO%EC%8E%CBYe%FE%8CN%ABr%5Dy%60~%CFA%0D%F4%AE%D4%BE%C75%CA%EDVB%EA(%B7%F1%09g%E5%D9%12%00%00%00%00%00%00%00%00%00H%F6%EB%13S%E7y%5E%5E%FB%98%F0%22%D1%B2'%A7%F0%92%B1%BC%24z3%AC%7Dm%60%D5%92%B4%7CEUO%5E%F0%AA*%3BU%B9%AE%3E%A0j%94%07%A0%C7%A0%AB%FD%B5%3F%A0%F7%03T%3Dy%D7%F7%D6%D4%C0%AAU%D2%E6%DFt%3F%A8%CC%AA%F2%86%B9%D7%F5%1F%18%E6%01%F8%CC%D5%9E%F0%F3z%88%AA%90%EF%20%00%00%00%00%00%00%00%00%00%C0%A6%D3%EA%CFi%AFb%2C%7BB%0A%2B%C3%1A%D7%06V%D5%07%A8r%5D%3D%D9%A6%CAu%F5%25%CF%A2%99%97zNX%60%95%AB%5DUZ%D5%FBR%03%AB%1C%D4k%9F%3F%BB%5C%FF%81a%AE%AB'%7F%F3%EA%FE%F3z%94%AA%D8%DF%5B%01%00%00%00%00%00%00%00%00%00%8E%FB%F3%F2%B1%1B%8DWU%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*UiU%C7%BBe%E7%F3%B9%CB%AAJ%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5J%95*U%AAT%A9R%A5*%AAj%FD%C6%D4%5Eo%90%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5%86%AF%1B%9F%98%DA%EBm%BBV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%ADV%AB%D5j%B5Z%AD%D6%E4%F58%01%00%00%00%00%00%00%00%00%00%00%00%00%00%40%85%7F%02%0C%008%C2%D0H%16j%8FX%00%00%00%00IEND%AEB%60%82") repeat-x !important; border-top: 1px solid #BBBBBB !important; border-right: 1px dashed #BBBBBB !important; border-bottom: 1px solid #000000 !important; } .firebugRulerV { top: 0 !important; left: -15px !important; width: 14px !important; height: 100% !important; background: url("data:image/png,%89PNG%0D%0A%1A%0A%00%00%00%0DIHDR%00%00%00%0E%00%00%13%88%08%02%00%00%00%0E%F5%CB%10%00%00%00%04gAMA%00%00%D6%D8%D4OX2%00%00%00%19tEXtSoftware%00Adobe%20ImageReadyq%C9e%3C%00%00%06~IDATx%DA%EC%DD%D1v%A20%14%40Qt%F1%FF%FF%E4%97%D9%07%3BT%19%92%DC%40(%90%EEy%9A5%CB%B6%E8%F6%9Ac%A4%CC0%84%FF%DC%9E%CF%E7%E3%F1%88%DE4%F8%5D%C7%9F%2F%BA%DD%5E%7FI%7D%F18%DDn%BA%C5%FB%DF%97%BFk%F2%10%FF%FD%B4%F2M%A7%FB%FD%FD%B3%22%07p%8F%3F%AE%E3%F4S%8A%8F%40%EEq%9D%BE8D%F0%0EY%A1Uq%B7%EA%1F%81%88V%E8X%3F%B4%CEy%B7h%D1%A2E%EBohU%FC%D9%AF2fO%8BBeD%BE%F7X%0C%97%A4%D6b7%2Ck%A5%12%E3%9B%60v%B7r%C7%1AI%8C%BD%2B%23r%00c0%B2v%9B%AD%CA%26%0C%1Ek%05A%FD%93%D0%2B%A1u%8B%16-%95q%5Ce%DCSO%8E%E4M%23%8B%F7%C2%FE%40%BB%BD%8C%FC%8A%B5V%EBu%40%F9%3B%A72%FA%AE%8C%D4%01%CC%B5%DA%13%9CB%AB%E2I%18%24%B0n%A9%0CZ*Ce%9C%A22%8E%D8NJ%1E%EB%FF%8F%AE%CAP%19*%C3%BAEKe%AC%D1%AAX%8C*%DEH%8F%C5W%A1e%AD%D4%B7%5C%5B%19%C5%DB%0D%EF%9F%19%1D%7B%5E%86%BD%0C%95%A12%AC%5B*%83%96%CAP%19%F62T%86%CAP%19*%83%96%CA%B8Xe%BC%FE)T%19%A1%17xg%7F%DA%CBP%19*%C3%BA%A52T%86%CAP%19%F62T%86%CA%B0n%A9%0CZ%1DV%C6%3D%F3%FCH%DE%B4%B8~%7F%5CZc%F1%D6%1F%AF%84%F9%0F6%E6%EBVt9%0E~%BEr%AF%23%B0%97%A12T%86%CAP%19%B4T%86%CA%B8Re%D8%CBP%19*%C3%BA%A52huX%19%AE%CA%E5%BC%0C%7B%19*CeX%B7h%A9%0C%95%E1%BC%0C%7B%19*CeX%B7T%06%AD%CB%5E%95%2B%BF.%8F%C5%97%D5%E4%7B%EE%82%D6%FB%CF-%9C%FD%B9%CF%3By%7B%19%F62T%86%CA%B0n%D1R%19*%A3%D3%CA%B0%97%A12T%86uKe%D0%EA%B02*%3F1%99%5DB%2B%A4%B5%F8%3A%7C%BA%2B%8Co%7D%5C%EDe%A8%0C%95a%DDR%19%B4T%C66%82fA%B2%ED%DA%9FC%FC%17GZ%06%C9%E1%B3%E5%2C%1A%9FoiB%EB%96%CA%A0%D5qe4%7B%7D%FD%85%F7%5B%ED_%E0s%07%F0k%951%ECr%0D%B5C%D7-g%D1%A8%0C%EB%96%CA%A0%A52T%C6)*%C3%5E%86%CAP%19%D6-%95A%EB*%95q%F8%BB%E3%F9%AB%F6%E21%ACZ%B7%22%B7%9B%3F%02%85%CB%A2%5B%B7%BA%5E%B7%9C%97%E1%BC%0C%EB%16-%95%A12z%AC%0C%BFc%A22T%86uKe%D0%EA%B02V%DD%AD%8A%2B%8CWhe%5E%AF%CF%F5%3B%26%CE%CBh%5C%19%CE%CB%B0%F3%A4%095%A1%CAP%19*Ce%A8%0C%3BO*Ce%A8%0C%95%A12%3A%AD%8C%0A%82%7B%F0v%1F%2FD%A9%5B%9F%EE%EA%26%AF%03%CA%DF9%7B%19*Ce%A8%0C%95%A12T%86%CA%B8Ze%D8%CBP%19*Ce%A8%0C%95%D1ae%EC%F7%89I%E1%B4%D7M%D7P%8BjU%5C%BB%3E%F2%20%D8%CBP%19*Ce%A8%0C%95%A12T%C6%D5*%C3%5E%86%CAP%19*Ce%B4O%07%7B%F0W%7Bw%1C%7C%1A%8C%B3%3B%D1%EE%AA%5C%D6-%EBV%83%80%5E%D0%CA%10%5CU%2BD%E07YU%86%CAP%19*%E3%9A%95%91%D9%A0%C8%AD%5B%EDv%9E%82%FFKOee%E4%8FUe%A8%0C%95%A12T%C6%1F%A9%8C%C8%3D%5B%A5%15%FD%14%22r%E7B%9F%17l%F8%BF%ED%EAf%2B%7F%CF%ECe%D8%CBP%19*Ce%A8%0C%95%E1%93~%7B%19%F62T%86%CAP%19*Ce%A8%0C%E7%13%DA%CBP%19*Ce%A8%0CZf%8B%16-Z%B4h%D1R%19f%8B%16-Z%B4h%D1R%19%B4%CC%16-Z%B4h%D1R%19%B4%CC%16-Z%B4h%D1%A2%A52%CC%16-Z%B4h%D1%A2%A52h%99-Z%B4h%D1%A2%A52h%99-Z%B4h%D1%A2EKe%98-Z%B4h%D1%A2EKe%D02%5B%B4h%D1%A2EKe%D02%5B%B4h%D1%A2E%8B%96%CA0%5B%B4h%D1%A2E%8B%96%CA%A0e%B6h%D1%A2E%8B%96%CA%A0e%B6h%D1%A2E%8B%16-%95a%B6h%D1%A2E%8B%16-%95A%CBl%D1%A2E%8B%16-%95A%CBl%D1%A2E%8B%16-Z*%C3l%D1%A2E%8B%16-Z*%83%96%D9%A2E%8B%16-Z*%83%96%D9%A2E%8B%16-Z%B4T%86%D9%A2E%8B%16-Z%B4T%06-%B3E%8B%16-Z%B4T%06-%B3E%8B%16-Z%B4h%A9%0C%B3E%8B%16-Z%B4h%A9%0CZf%8B%16-Z%B4h%A9%0CZf%8B%16-Z%B4h%D1R%19f%8B%16-Z%B4h%D1R%19%B4%CC%16-Z%B4h%D1R%19%B4%CC%16-Z%B4h%D1%A2%A52%CC%16-Z%B4h%D1%A2%A52h%99-Z%B4h%D1%A2%A52h%99-Z%B4h%D1%A2EKe%98-Z%B4h%D1%A2EKe%D02%5B%B4h%D1%A2EKe%D02%5B%B4h%D1%A2E%8B%96%CA0%5B%B4h%D1%A2E%8B%96%CA%A0e%B6h%D1%A2E%8B%96%CA%A0e%B6h%D1%A2E%8B%16-%95a%B6h%D1%A2E%8B%16-%95A%CBl%D1%A2E%8B%16-%95A%CBl%D1%A2E%8B%16-Z*%C3l%D1%A2E%8B%16-Z*%83%96%D9%A2E%8B%16-Z*%83%96%D9%A2E%8B%16-Z%B4T%86%D9%A2E%8B%16-Z%B4T%06-%B3E%8B%16-Z%B4T%06-%B3E%8B%16-Z%B4h%A9%0C%B3E%8B%16-Z%B4h%A9%0CZf%8B%16-Z%B4h%A9%0CZf%8B%16-Z%B4h%D1R%19f%8B%16-Z%B4h%D1R%19%B4%CC%16-Z%B4h%D1R%19%B4%CC%16-Z%B4h%D1%A2%A52%CC%16-Z%B4h%D1%A2%A52h%99-Z%B4h%D1%A2%A52h%99-Z%B4h%D1%A2EKe%98-Z%B4h%D1%A2EKe%D02%5B%B4h%D1%A2EKe%D02%5B%B4h%D1%A2E%8B%96%CA0%5B%B4h%D1%A2E%8B%96%CA%A0e%B6h%D1%A2E%8B%96%CA%A0e%B6h%D1%A2E%8B%16-%95a%B6h%D1%A2E%8B%16-%95A%CBl%D1%A2E%8B%16-%95A%CBl%D1%A2E%8B%16-Z*%C3l%D1%A2E%8B%16-Z*%83%96%D9%A2E%8B%16-Z*%83%96%D9%A2E%8B%16-Z%B4T%86%D9%A2E%8B%16-Z%B4T%06-%B3E%8B%16-Z%B4%AE%A4%F5%25%C0%00%DE%BF%5C'%0F%DA%B8q%00%00%00%00IEND%AEB%60%82") repeat-y !important; border-left: 1px solid #BBBBBB !important; border-right: 1px solid #000000 !important; border-bottom: 1px dashed #BBBBBB !important; } .overflowRulerX > .firebugRulerV { left: 0 !important; } .overflowRulerY > .firebugRulerH { top: 0 !important; } /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */ .fbProxyElement { position: fixed !important; pointer-events: auto !important; } </style>
 </head> 
 <body> 
  <div style="position: absolute; left: 0px; top: 0px; width: 1365px; height: 605px; background-color: black; z-index: 99; display: block;" class="opacity" id="opadiv"></div> 
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
    <!-- <div id="dialog" title="请选择收件人" style="width: 460px; height: 400px; background-color: #E6E6E6; display: none;"> <fieldset ID="fs" style="width: 412px; height: 400px; border: inset; border-top-width: 3px; border-right-width: 3px; border-bottom-width: 3px; border-left-width: 3px; background-color: #DFECF9"> <div class="zTreeBackground left" style="margin-left: 20px; margin-top: 6px; float: left; width: 240px; height: 380px; "> <ul id="tree" class="ztree"></ul> </div> <div style="margin-left: 0px; float: left; width: 130px; height: 380px;"> <div style="margin-left: 30px; margin-top: 40px;"> <div><input type="button" value="确定" onclick="choose_confirm()"/></div> <div style="margin-top: 20px;"> <input type="button" value="取消" onclick="choose_cancel()"/></div> </div> </div> </fieldset> </div> --> 
    <div aria-labelledby="ui-id-1" role="dialog" tabindex="-1" id="dragdiv" style="outline: 0px none; z-index: 1000; position: relative; opacity: 1;" class="ui-dialog ui-widget ui-widget-content ui-corner-all ui-draggable ui-resizable"> 
     <div style="background-color: rgb(184, 201, 213);" class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix"> 
      <span class="ui-dialog-title" id="ui-id-1">请选择收件人</span>
      <a style="margin-left: 340px;" role="button" class="ui-dialog-titlebar-close ui-corner-all" href="#"><span class="ui-icon ui-icon-closethick"><b>X</b></span></a> 
     </div> 
     <div class="ui-dialog-content ui-widget-content" id="dialog" style="width: 460px; height: 400px; background-color: rgb(230, 230, 230);"> 
      <fieldset id="fs" style="width: 412px; height: 400px; border: inset; border-top-width: 3px; border-right-width: 3px; border-bottom-width: 3px; border-left-width: 3px; background-color: #DFECF9"> 
       <div class="zTreeBackground left" style="margin-left: 20px; margin-top: 6px; float: left; width: 240px; height: 380px;"> 
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
   </div> 
  </div> 
 </body>
</html>