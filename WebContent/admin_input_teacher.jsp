<%@page import="course.Course"%>
<%@page import="tools.DBManager"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="utf-8">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<style>
	.container{
		width: 400px;
		position: relative;
		/*background-color: #cfcad8;*/
		margin-top: 10%;
		border-radius: 10px;
}
</style>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div class="container">
		<form name="frmLogin" method="post" action="AddTeacherInfo" target="main">
			<div class="form-group">
				<label>教工号</label> <input type="text" class="form-control"
					id="teacherId" placeholder="请输入教工号" name="teacherId">
			</div>
			<div class="form-group">
				<label>姓名</label> <input type="text" class="form-control"
					id="teacherName" placeholder="请输入姓名" name="teacherName">
			</div>
			<div class="form-group">
				<label>性别</label><select name="sex" class="form-control tail">
					<option value="男">男</option>
					<option value="女">女</option>
			</select>				
			</div>
			<div class="form-group">
				<label>职位</label> <input type="text" class="form-control"
					id="position" placeholder="请输入职位" name="position">
			</div>
			<div class="form-group">
				<label>年龄</label> <input type="text" class="form-control" id="age"
					placeholder="请输入年龄" name="age">
			</div>
			<div class="form-group">
				<label>密码</label> <input type="text" class="form-control"
					id="password" placeholder="请输入初始密码" name="password">
			</div>
			<button type="submit" class="btn btn-primary">录入</button>
		</form>
	</div>
	<script>
		
	</script>
</body>
</html>



