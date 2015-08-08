<%@page import="tools.DBManager"%>
<%@page import="course.sscore"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="./css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="./js/jquery.js"></script>
<script type="text/javascript" charset="utf8"
	src="./js/jquery.dataTables.js"></script>

<script>
	$(document).ready(function() {
		$('#table').DataTable({
			language : {
				"sProcessing" : "处理中...",
				"sLengthMenu" : "显示 _MENU_ 项结果",
				"sZeroRecords" : "没有匹配结果",
				"sInfo" : "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
				"sInfoEmpty" : "显示第 0 至 0 项结果，共 0 项",
				"sInfoFiltered" : "(由 _MAX_ 项结果过滤)",
				"sInfoPostFix" : "",
				"sSearch" : "搜索:",
				"sUrl" : "",
				"sEmptyTable" : "表中数据为空",
				"sLoadingRecords" : "载入中...",
				"sInfoThousands" : ",",
				"oPaginate" : {
					"sFirst" : "首页",
					"sPrevious" : "上页",
					"sNext" : "下页",
					"sLast" : "末页"
				},
				"oAria" : {
					"sSortAscending" : ": 以升序排列此列",
					"sSortDescending" : ": 以降序排列此列"
				}
			}
		});
	});
</script>
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
		String userId = (String) session.getAttribute("userId");
		DBManager manager = new DBManager();
		ArrayList<sscore> scoreList = manager.getScoreByStudent(userId);
	%>
	<div class="container">
		<h3>
			成绩列表</h3>
		<table id=table class="display">
			<thead>
				<tr>
					<th>课程号</th>
					<th>课程名</th>
					<th>学分</th>
					<th>成绩</th>
				</tr>
			</thead>
			<%
				for (int i = 0; i < scoreList.size(); i++) {
			%>

			<tr id=<%="score" + i%>>
				<td><%=scoreList.get(i).getCourseId()%></td>
				<td><%=scoreList.get(i).getCoursename()%></td>
				<td><%=scoreList.get(i).getCredit()%></td>
				<td><%=scoreList.get(i).getScore() %></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>