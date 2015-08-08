
<%@page import="tools.DBManager"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width = device - width, initial-scale = 1">
<title>admin_query</title>
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
<link rel="stylesheet" type="text/css" href="./css/table.css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
	      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
</head>
<body>
	<div class="container">
		<h1 id="welcome">查询管理</h1>
		<hr>
		<div>
			<h4>全部查询</h4>
			<table>
				<tbody>
					<tr>
						<td><a href=admin_query_admin.jsp?>管理员</a></td>
					</tr>
					<tr>
						<td><a href=admin_query_student.jsp?>学生</a></td>
					</tr>
					<tr>
						<td><a href=admin_query_teacher.jsp?>教师</a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
