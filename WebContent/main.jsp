<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="utf-8">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>学生成绩管理系统</title>
<%
	String userIdConfirm = (String) session.getAttribute("userId");
	if (userIdConfirm == null || userIdConfirm.isEmpty()) {
%>
<script>
	parent.location.href = 'index.jsp';
</script>
<%
	}
%>
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
<body style="overflow-x:hidden;overflow-y:hidden;">
	<%
		String userId = (String) session.getAttribute("userId");
		String userType = (String) session.getAttribute("userType");
		String name = (String) session.getAttribute("name");
	%>
	<div class="container_fluid">
		<div class="row">
			<div class="col-md-6">
				<h1 class="title">成绩管理系统</h1>
			</div>
		</div>
		<div class="info">
			<ul class="list-unstyled">
				<li><label class="label">欢迎你,<%=name%>!</label><label class="lable"><a href="LogoutAction" class="logout">注销</a></label></li>
				<li><label class="label">你的身份是：<%=userType%></label></li>

			</ul>
		</div>
	</div>
	<%
		if (userType == null) {
			response.sendRedirect("index.jsp");
		} else if (userType.equals("teacher")) {
	%>
	<%@ include file="teacher_menu.jsp"%>
	<%
		} else if (userType.equals("admin")) {
	%>
	<%@ include file="admin_menu.jsp" %>
	<%
		} else if (userType.equals("student")) {
	%>
	<%@ include file="student_menu.jsp"%>
	<%
		}
	%>
	<div class="iframePage">
		<iframe name="main" frameborder="0" scrolling="auto"
			class="iframepage">
			<!-- -->
		</iframe>
	</div>
	<script type="text/javascript" src="./js/jquery.min.js"></script>
	<script type="text/javascript" src="./js/bootstrap.min.js"></script>
	<!--<script type="text/javascript" src="./js/admin.js"></script>-->
</body>
</html>