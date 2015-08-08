<%@page import="course.Course"%>
<%@page import="tools.DBManager"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
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
	width: 70px;
}
</style>
<body>
	<%
		DBManager manager = new DBManager();
		ArrayList<Course> courseInfo = manager.getAllCourse();
	%>
	<div class="container">
		<h3>课程列表</h3>
		<table id="table" class="display">
			<thead>
				<tr>
					<th>课程ID</th>
					<th>课程名</th>
					<th>学分</th>
					<th>课时</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < courseInfo.size(); i++) {
						String updateString = "update(" + i + "," + courseInfo.get(i).getCourseId() + ",'"
								+ courseInfo.get(i).getCourseName() + "'," + courseInfo.get(i).getCredit() + ","
								+ courseInfo.get(i).getClassHour() + ")";
						String deleteString = "deleteInfo(" + courseInfo.get(i).getCourseId() + ")";
				%>
				<tr id=<%=courseInfo.get(i).getCourseId()%>>
					<td><%=courseInfo.get(i).getCourseId()%></td>
					<td id=<%="name" + i%>><%=courseInfo.get(i).getCourseName()%></td>
					<td id=<%="credit" + i%>><%=courseInfo.get(i).getCredit()%></td>
					<td id=<%="classHour" + i%>><%=courseInfo.get(i).getClassHour()%></td>
					<td id=<%="button" + i%>>
						<button id=<%="update" + i%> onclick="<%=updateString%>">修改</button>
						<button id=<%="delete" + i%> onclick="<%=deleteString%>">删除</button>
					</td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	<script type="text/javascript">
	function update(i,Id,oldName,oldCredit,oldClassHour){
		var tdname=document.getElementById("name"+i);
		var tdcredit=document.getElementById("credit"+i);
		var tdclassHour=document.getElementById("classHour"+i);
		var tdbutton=document.getElementById("button"+i);
		
		tdname.innerHTML="";
		tdcredit.innerHTML="";
		tdclassHour.innerHTML="";
		tdbutton.innerHTML="";
		
		var i1 = document.createElement("input");
		i1.type = "text";
		i1.value = oldName;
		i1.className = "input";
		
		var i2 = document.createElement("input");
		i2.type = "text";
		i2.value = oldCredit;
		i2.className = "input";
		
		var i3 = document.createElement("input");
		i3.type = "text";
		i3.value = oldClassHour;
		i3.className = "input";
		
		var button = document.createElement("button");
		button.onclick = function (){
			sendUpdate(i,Id,oldName,oldCredit,oldClassHour,i1.value,i2.value,i3.value);
		};
		button.innerText = "提交";
		
		tdname.appendChild(i1);
		tdcredit.appendChild(i2);
		tdclassHour.appendChild(i3);
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

	function sendUpdate(i,Id,oldName,oldCredit,oldClassHour,newName,newCredit,newClassHour){
		var url = "/demo/UpdateCourseAction";
		xmlHttp.open("POST", url, true);
		xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlHttp.onreadystatechange = function(){
			updateResult(i,Id,oldName,oldCredit,oldClassHour,newName,newCredit,newClassHour);
		};
		xmlHttp.send('courseId='+Id+'&name='+newName+'&credit='+newCredit+'&classHour='+newClassHour);
	}
	function updateResult(i,Id,oldName,oldCredit,oldClassHour,newName,newCredit,newClassHour){
		if (xmlHttp.readyState == 4) {
			var response = xmlHttp.responseText;
			var jsonObj=JSON.parse(response);
			var tdname=document.getElementById("name"+i);
			var tdcredit=document.getElementById("credit"+i);
			var tdclassHour=document.getElementById("classHour"+i);
			var tdbutton=document.getElementById("button"+i);
			tdbutton.innerHTML="";
			
			var button = document.createElement("button");
			button.innerText = "修改";		
			tdbutton.appendChild(button);
			var a=document.createElement("a");
			a.innerHTML=" ";
			tdbutton.appendChild(a);
			var delbutton = document.createElement("button");
			delbutton.onclick = function (){
				deleteInfo(Id);
			};
			delbutton.innerText = "删除";		
			tdbutton.appendChild(delbutton);
			
			if(jsonObj.resultCode==1){
				alert(jsonObj.resultMessage);		
				tdname.innerHTML=newName;
				tdcredit.innerHTML=newCredit;
				tdclassHour.innerHTML=newClassHour;
				button.onclick = function (){
					update(i,Id,newName,newCredit,newClassHour);
				};
			}
			else{
				alert(jsonObj.resultMessage);
				tdname.innerHTML=oldName;
				tdcredit.innerHTML=oldCredit;
				tdclassHour.innerHTML=oldClassHour;
				button.onclick = function (){
					update(i,Id,oldName,oldCredit,oldClassHour);
				};
			}
		}
	}	
	
	function deleteInfo(Id){
		var url = "/demo/DeleteCourseAction";
		xmlHttp.open("POST", url, true);
		xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlHttp.onreadystatechange = function(){
			deleteResult(Id);
		};
		xmlHttp.send('courseId='+Id);
	}
	
	function deleteResult(Id){
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



