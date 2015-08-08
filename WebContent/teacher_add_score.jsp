<%@page import="course.Score"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tools.DBManager"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
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
<style>
.container {
	margin-top: 10px;
	hight: auto;
}

.input {
	width: 50px;
}
</style>
<body>
	<%
		String courseId = request.getParameter("courseId");
		String userId = (String) session.getAttribute("userId");
		DBManager manager = new DBManager();
		ArrayList<Score> studentList = manager.getUnregist(userId, courseId);
	%>
	<%
		if (studentList.size() == 0) {
	%>
	<script>
		alert("全部成绩已录入完毕！")
	</script>
	<%
		} else {
	%>
	<div class="container">
		<h3>录入成绩        课程：<%=manager.getCourseNameById(courseId)%></h3>
	</div>

	<form action="AddScoreAction" method="post">
		<input type="hidden" name="courseId" value=<%=courseId%>>
		<div class="container">
			<table class="table">
				<thead>
					<tr>
						<th>班级</th>
						<th>学号</th>
						<th>姓名</th>
						<th>成绩</th>
					</tr>
				</thead>
				<%
					for (int i = 0; i < studentList.size(); i++) {
				%>

				<tr>
					<td><%=studentList.get(i).getClassId()%></td>
					<td><%=studentList.get(i).getStudentId()%></td>
					<td><%=studentList.get(i).getName()%></td>
					<td><input name=<%=studentList.get(i).getStudentId()%>
						type="text" onkeyup="value=value.replace(/[^\d]/g,'')"
						class="input"></td>
				</tr>
				<%
					}
				%>
			</table>
			<input type="submit" value="提交">
		</div>
	</form>
	<%
		}
	%>
</body>
</html>