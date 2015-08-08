<%@page import="tools.DBManager"%>
<%@page import="course.Score"%>
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
		ArrayList<Score> scoreList = manager.getScoreByTeacher(userId, courseId);
	%>
	<div class="container">
		<h3>
			查询/修改成绩 课程：<%=manager.getCourseNameById(courseId)%></h3>
		<table id=table class="display">

			<thead>
				<tr>
					<th>班级</th>
					<th>学号</th>
					<th>姓名</th>
					<th>成绩</th>
					<th>操作</th>
				</tr>
			</thead>
			<%
				for (int i = 0; i < scoreList.size(); i++) {
			%>

			<tr id=<%="score" + i%>>
				<td><%=scoreList.get(i).getClassId()%></td>
				<td><%=scoreList.get(i).getStudentId()%></td>
				<td><%=scoreList.get(i).getName()%></td>
				<td id=<%="tdscore" + i%>><%=scoreList.get(i).getScore()%></td>
				<td id=<%="tdbutton" + i%>><button id=<%="update" + i%>
						onclick="update(<%=i%>,<%=scoreList.get(i).getScore()%>,<%=scoreList.get(i).getStudentId()%>,<%=courseId%>)">修改</button>
			</tr>
			<%
				}
			%>
		</table>
	</div>


	<script>
	function update(i,oldScore,studentId){
		var tdscore=document.getElementById("tdscore"+i);
		var tdbutton=document.getElementById("tdbutton"+i);
		tdscore.innerHTML="";
		tdbutton.innerHTML="";

		var i1 = document.createElement("input");
		i1.type = "text";
     	i1.name = "score";
		i1.value = oldScore;
		i1.className = "input";
		var button = document.createElement("button");
		button.onclick = function (){
			sendUpdate(i,oldScore,studentId,i1.value);
		};
		button.innerText = "提交";		
		tdscore.appendChild(i1);
		tdbutton.appendChild(button);
	}

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

	function sendUpdate(i,oldScore,studentId,score) {
		var url = "/demo/UpdateScoreAction"+"?studentId="+studentId+"&courseId="+<%=courseId%>+"&score="+score;
		xmlHttp.open("POST", url, true);
		xmlHttp.onreadystatechange = function(){
			updateResult(i,oldScore,studentId,score);
		};
		xmlHttp.send(null);
	}
	function updateResult(i,oldScore,studentId,score) {
		if (xmlHttp.readyState == 4) {
			var response = xmlHttp.responseText;
			var jsonObj=JSON.parse(response);
			var tdscore=document.getElementById("tdscore"+i);
			var tdbutton=document.getElementById("tdbutton"+i);
			tdbutton.innerHTML="";
			var button = document.createElement("button");
			button.onclick = function (){
				update(i,oldScore,studentId);
			};
			button.innerText = "修改";
			tdbutton.appendChild(button);
			if(jsonObj.resultCode==1){
				alert(jsonObj.resultMessage);
				tdscore.innerHTML=score;
			}
			else{
				alert(jsonObj.resultMessage);
				tdscore.innerHTML=oldScore;
			}
		}
	}	
	
	</script>
</body>
</html>