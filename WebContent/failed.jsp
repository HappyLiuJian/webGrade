<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<title>登陆失败</title>
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
<style>
	.container{
		width:400px;
	}
</style>
</head>
<body>
	<div class="container">
	<div class="alert alert-warning" role="alert">
		对不起，登陆失败！<br /> <font color="red">原因： </font>
		用户名或密码错误！
		<br /> <br />
		<a id="time">5</a>
		秒后将返回登陆界面。
	</div>
	</div>
	<%
		response.setHeader("Refresh", "5;URL=/demo/index.jsp");
	%>
</body>

<script type="text/javascript">
	var c = 5;
	var t
	timedCount();
	function timedCount() {
		document.getElementById('time').innerHTML = c;
		c--;
		if(c!=0){
			t = setTimeout("timedCount()", 1000);
		}
	}
</script>
</html>