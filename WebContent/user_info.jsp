<%@page import="tools.DBManager"%>
<%@page import="user.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="./css/userinfo.css">
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
		} else {
			String userId = (String) session.getAttribute("userId");
			String userType = (String) session.getAttribute("userType");
			DBManager manager = new DBManager();
			User user = manager.getInfo(userId, userType);
			if (userType.equals("student")) {
	%>
	<div class="tableDiv">
		<h2 class="title">个人信息</h2>
		<table class="table table-striped">
			<tr>
				<td>用户ID：</td>
				<td><%=userId%></td>
			</tr>
			<tr>
				<td>用户类型：</td>
				<td><%=userType%></td>
			</tr>
			<tr>
				<td>姓名：</td>
				<td><%=((Student) user).getName()%></td>
			</tr>
			<tr>
				<td>性别：</td>
				<td><%=((Student) user).getSex()%></td>
			</tr>
			<tr>
				<td>年龄：</td>
				<td><%=((Student) user).getAge()%></td>
			</tr>
			<tr>
				<td>学院：</td>
				<td><%=((Student) user).getAcademy()%></td>
			</tr>
			<tr>
				<td>专业：</td>
				<td><%=((Student) user).getMajor()%></td>
			</tr>
			<tr>
				<td>班级：</td>
				<td><%=((Student) user).getClassId()%></td>
			</tr>
		</table>
	</div>
	<%
		} else if (userType.equals("teacher")) {
	%>
	<div class="tableDiv">
		<h2 class="title">个人信息</h2>
		<table class="table table-striped">
			<tr>
				<td>用户ID：</td>
				<td><%=userId%></td>
			</tr>
			<tr>
				<td>用户类型：</td>
				<td><%=userType%></td>
			</tr>
			<tr>
				<td>姓名：</td>
				<td><%=((Teacher) user).getName()%></td>
			</tr>
			<tr>
				<td>性别：</td>
				<td><%=((Teacher) user).getSex()%></td>
			</tr>
			<tr>
				<td>年龄：</td>
				<td><%=((Teacher) user).getAge()%></td>
			</tr>
			<tr>
				<td>职位：</td>
				<td><%=((Teacher) user).getPosition()%></td>
			</tr>
		</table>
	</div>
	<%
		} else if (userType.equals("admin")) {
	%>
	<div class="tableDiv">
		<h2 class="title">个人信息</h2>
		<table class="table table-striped">
			<tr>
				<td>用户ID：</td>
				<td><%=userId%></td>
			</tr>
			<tr>
				<td>用户类型：</td>
				<td><%=userType%></td>
			</tr>
			<tr>
				<td>姓名：</td>
				<td><%=((Admin) user).getName()%></td>
			</tr>
		</table>
	</div>
	<%
		}
		}
	%>
</body>
</html>