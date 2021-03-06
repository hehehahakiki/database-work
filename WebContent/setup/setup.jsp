<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,domain.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WorkGether</title>
<link rel="stylesheet" type="text/css" href="setup.css" />
<script type="text/javascript" src="../cookie.js"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
</head>
<body>

<%
	Cookie cookies[]=request.getCookies(); //读出用户硬盘上的Cookie，并将所有的Cookie放到一个cookie对象数组里面
	Cookie sCookie=null; 
	String skey="";
	for(int i=0;i<cookies.length-1;i++){    //用一个循环语句遍历刚才建立的Cookie对象数组
		sCookie=cookies[i];   //取出数组中的一个Cookie对象
		if(sCookie!=null){
      		if(("skey").equals(sCookie.getName())){      
        		skey=sCookie.getValue();
        		break;
        	}
      	}
   	}
%>

<div class="header">
	<p style="margin-top:7px;;margin-left:75%; float:left;font-size:22px;color:#2299ff;"><%=Login.getStaffName(skey) %></p>
	<img src="../image/logout.png" class="logo" style="float:left;margin-left:7px;margin-top:9px;" onclick="logout()">
	<img src="../image/question.png" class="logo" style="float:left;margin-left:7px;margin-top:9px;">
</div>

<div class="body" style="overflow:hidden;">
	<div class="left">
	<script type="text/javascript">
			function left(i){
				switch(i){
				case 1:
					window.location.href="../index/index.jsp";
					break;
				case 2:
					window.location.href="../task/task.jsp";
					break;
				case 3:
					window.location.href="../logged/logged.jsp";
					break;
				case 4:
					window.location.href="../checkLogged/checkLogged.jsp";
					break;
				case 5:
					window.location.href="../report/report.jsp"
					break;
				}
			}
		</script>
	
		<div class="left-outer"><p class="left-inner" onclick="left(1)">基础设置</p></div>
		<div class="left-outer"><p class="left-inner" onclick="left(2)">任务管理</p></div>
		<div class="left-outer"><p class="left-inner" onclick="left(3)">日志填写</p></div>
		<div class="left-outer"><p class="left-inner" onclick="left(4)">日志审核</p></div>
		<div class="left-outer"><p class="left-inner" onclick="left(5)">报表生成</p></div>
		
	</div>

	<div class="middle">
		<div class="list">
			<ul class="list-ul">
				<li class="list-li" id="li1" onclick="tab(1)" style="border-bottom: 3px solid yellow;">
					<a href="setupAction.jsp?id=1" target="tabframe" style="text-decoration:none;">部门设置</a></li>
				<li class="list-li" id="li2" onclick="tab(2)" >
					<a href="setupAction.jsp?id=2" target="tabframe" style="text-decoration:none;">多级用户和权限设置</a></li>
				<li class="list-li" id="li3" onclick="tab(3)" >
					<a href="setupAction.jsp?id=3" target="tabframe" style="text-decoration:none;">工作日设置</a></li>
				<li class="list-li" id="li4" onclick="tab(4)" >
					<a href="setupAction.jsp?id=4" target="tabframe" style="text-decoration:none;">任务属性设置</a></li>
			</ul>
		</div>
		
		<br>
		
		<div style="overflow: hidden; height:80%;">

		<iframe src="setupAction.jsp?id=1" name="tabframe" frameborder=0 scrolling=no HEIGHT=100% WIDTH=100% id="iframe">
		</iframe><!-- tab -->
		
		</div><!--任务框-->
		
	</div>
	
	<div class="right" style="border:none;width:256px;">
		<iframe src="../right.jsp" name="tabframe" frameborder=0 scrolling=no HEIGHT=auto WIDTH=100% id="iframe">
		</iframe><!-- tab -->
	</div><!--å³é¨-->
</div>

<div class="tail" style="width: 100%;margin: 0 auto;align-items: center;">
	<h6 class="tailtext" style="text-align: center;color: #999;">Copyright © 2018 XiaoMing All Rights Reserved.</h6>
</div>

<script type="text/javascript">
window.onload=function(){
	if(getCookie("skey")==null)window.location.href="../login/login.html";
}

function logout(){
	clearCookie("skey");
	window.location.href="../login/login.html";
}


var i=1;
	function tab(j){
		document.getElementById('li'+i).style.borderBottom="none";
		document.getElementById('li'+j).style.borderBottom="3px solid yellow";
		i=j;
	}

</script>

</body>
</html>