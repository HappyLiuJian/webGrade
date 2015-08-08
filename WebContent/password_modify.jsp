<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>修改密码</title>
<!-- Bootstrap -->
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/index.css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
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
	<%
		String userId = (String) session.getAttribute("userId");
		String userType = (String) session.getAttribute("userType");
	%>
	<div class="container">
		<form method="post" action="PasswordModifyAction">
			<input name="userId" type="hidden" value=<%=userId%> /> <input
				name="userType" type="hidden" value=<%=userType%> />
			<div class="form-group">
				<label>原密码：</label> <input type="password" class="form-control"
					name="oldPassword" id="oldPassword">
			</div>
			<div class="form-group">
				<label>新密码：</label> <input type="password" class="form-control"
					name="newPassword" id="newPassword">
			</div>
			<div class="form-group">
				<label>确认密码：</label> <input type="password" class="form-control"
					name="newPasswordConfirm" type="password" id="newPasswordConfirm">
			</div>
			<button type="submit" class="btn btn-primary"
				onclick="return check()">确认</button>
			<button type="reset" class="btn btn-primary tail">重置</button>
		</form>
	</div>
	<script>
		function check() {
			var oldPassword = document.getElementById("oldPassword").value;
			var newPassword = document.getElementById("newPassword").value;
			var newPasswordConfirm = document
					.getElementById("newPasswordConfirm").value;
			if (oldPassword == "" || newPassword == ""
					|| newPasswordConfirm == "") {
				alert("输入信息不完整！");
				return false;
			}
			if (newPassword != newPasswordConfirm) {
				alert("两次输入的密码不同！");
				return false;
			}
		}
	</script>
</body>
</html>