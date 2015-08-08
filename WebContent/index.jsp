<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>成绩系统</title>

<!-- Bootstrap -->
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/index.css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script type="text/javascript" src="./js/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<h1 id="welcome">欢迎来到成绩管理系统</h1>
		<hr>
		<form method="POST" name="frmLogin" action="LoginAction">
			<div class="form-group">
				<label for="用户名">用户名</label> <input type="text" class="form-control"
					id="ID" placeholder="请输入用户名" name="userId"> <span
					id="inputSuccess2Status" class="sr-only">(success)</span>
			</div>
			<div class="form-group">
				<label for="Password">密码</label> <input type="password"
					class="form-control" id="Password" placeholder="请输入密码"
					name="password">
			</div>
			<br>
			<button type="submit" class="btn btn-primary"
				onclick="return validateLogin()">登陆</button>
			<!--<div class="tail">
				<label class="radio-inline"> <input type="radio"
					name="userType" value="student" checked="checked"> 学生
				</label> <label class="radio-inline"> <input type="radio"
					name="userType" value="teacher"> 教师
				</label> <label class="radio-inline"> <input type="radio"
					name="userType" value="admin"> 管理员
				</label>
			</div>-->
			<div class="btn-group tail" data-toggle="buttons">
				<label class="btn btn-primary active"> <input type="radio"
					name="userType" value="student" id="option1" autocomplete="off" checked> 学生
				</label> <label class="btn btn-primary"> <input type="radio"
					name="userType" value="teacher" id="option2" autocomplete="off"> 教师
				</label> <label class="btn btn-primary"> <input type="radio"
					name="userType" value="admin" id="option3" autocomplete="off"> 管理员
				</label>
			</div>
		</form>
	</div>
	<script>
		$('input[type="radio"]').on('click',function() {
					$('input[type="radio"]:checked').parent('label').addClass(
							'active');
					$('input[type="radio"]:checked').parent('label').siblings()
							.removeClass('active');
					//$(this).button('complete') // button text will be "finished!"
				})
		function validateLogin() {
			var sUserId = document.frmLogin.userId.value;
			var sPassword = document.frmLogin.password.value;
			if (sUserId == "") {
				alert("用户名不能为空");
				return false;
			}
			if (sPassword == "") {
				alert("密码不能为空");
				return false;
			}
		}
	</script>
</body>
</html>



