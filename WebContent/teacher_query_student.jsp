<%@page import="user.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tools.DBManager"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="utf-8">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
			language: {
		        "sProcessing": "处理中...",
		        "sLengthMenu": "显示 _MENU_ 项结果",
		        "sZeroRecords": "没有匹配结果",
		        "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
		        "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
		        "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
		        "sInfoPostFix": "",
		        "sSearch": "搜索:",
		        "sUrl": "",
		        "sEmptyTable": "表中数据为空",
		        "sLoadingRecords": "载入中...",
		        "sInfoThousands": ",",
		        "oPaginate": {
		            "sFirst": "首页",
		            "sPrevious": "上页",
		            "sNext": "下页",
		            "sLast": "末页"
		        },
		        "oAria": {
		            "sSortAscending": ": 以升序排列此列",
		            "sSortDescending": ": 以降序排列此列"
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
		String courseId = request.getParameter("courseId");
		String userId = (String) session.getAttribute("userId");
		DBManager manager = new DBManager();
		ArrayList<Student> studentList = manager.getStudentByTeacher(userId, courseId);
	%>
	<div class="container">
		<h3>
			查询/修改学生        课程：<%=manager.getCourseNameById(courseId)%></h3>
		<table id=table class="display">
			<thead>
				<tr>
					<th>学院</th>
					<th>专业</th>
					<th>班级</th>
					<th>学号</th>
					<th>姓名</th>
					<th>性别</th>
					<th>年龄</th>
					<th>操作</th>
				</tr>
			</thead>
			<%
				for (int i = 0; i < studentList.size(); i++) {
			%>
			<tr id=<%=studentList.get(i).getId()%>>
				<td><%=studentList.get(i).getAcademy()%></td>
				<td><%=studentList.get(i).getMajor()%></td>
				<td><%=studentList.get(i).getClassId()%></td>
				<td><%=studentList.get(i).getId()%></td>
				<td><%=studentList.get(i).getName()%></td>
				<td><%=studentList.get(i).getSex()%></td>
				<td><%=studentList.get(i).getAge()%></td>
				<td><button
						onclick="deleteStudent(<%=studentList.get(i).getId()%>)">删除</button></td>
			</tr>
			<%
				}
			%>
		</table>
		<div>
			<form action="AddStudentToCourse" method="post" target=main>
				<input type="hidden" name="courseId" value=<%=courseId%>> <label
					for="学号">添加学生</label> <input type="text" class="form-control"
					id="ID" placeholder="请输入学号" name="studentId">
				<button type="submit">提交</button>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		var xmlHttp = false;
		/*@cc_on @*/
		/*@if (@_jscript_version >= 5)
		try {
		  xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
		  try {
		    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		  } catch (e2) {
		    xmlHttp = false;
		  }
		}
		@end @*/
		if (!xmlHttp & typeof XMLHttpRequest != 'undefined') {
			xmlHttp = new XMLHttpRequest();
		}
	</script>
	<script type="text/javascript">
		function deleteStudent(studentId) {
			var url = "/demo/DeleteStudentInCourse"+"?studentId="+studentId+"&courseId="+<%=courseId%>;
			xmlHttp.open("POST", url, true);
			xmlHttp.onreadystatechange = function(){
				deleteResult(studentId);
			}
			xmlHttp.send(null);
		}
		function deleteResult(Id) {
			if (xmlHttp.readyState == 4) {
				var response = xmlHttp.responseText;
				var jsonObj=JSON.parse(response);
				if(jsonObj.resultCode==1){
					alert(jsonObj.resultMessage);		
					var tr=document.getElementById(Id);
					var table=$('#table').DataTable()
					table.row(tr).remove().draw();
				}
			}
		}	
		
		
	</script>
</body>
</html>