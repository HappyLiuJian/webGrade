<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>功能菜单</title>

<!-- Bootstrap -->
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/admin.css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div class="sidebar col-sm-3 col-md-2">
		<ul id="accordion" class="accordion nav nav-sidebar list-unstyled">
			<li><a class="link">用户管理<span class="glyphicon glyphicon-lock"></span></a>
				<ul class="submenu list-unstyled">
					<li><a href="user_info.jsp" target=main>查询个人信息</a></li>
					<li><a href="password_modify.jsp" target=main>修改密码</a></li>
				</ul></li>
			<li><a class="link">课程管理<span class="glyphicon glyphicon-tasks"></span></a>
				<ul class="submenu list-unstyled">
					<li><a href="student_query_score.jsp" target=main>查看成绩</a></li>
				</ul></li>
		</ul>
	</div>
	<script type="text/javascript" src="./js/jquery.min.js"></script>
	<script type="text/javascript" src="./js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./js/menu.js"></script>
</body>
</html>