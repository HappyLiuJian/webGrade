
<%@page import="user.Teacher"%>
<%@page import="tools.DBManager"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

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
		ArrayList<Teacher> teacherInfo = manager.getAllTeacher();
	%>

	<div class="container table1">
		<h3>教师列表</h3>
		<table class="display" id="table">
			<thead>
				<tr>
					<th>教师ID</th>
					<th>姓名</th>
					<th>性别</th>
					<th>年龄</th>
					<th>职位</th>
					<th>密码</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < teacherInfo.size(); i++) {
						String updateString = "update(" + i + "," + teacherInfo.get(i).getId() + ",'"
								+ teacherInfo.get(i).getName() + "','" + teacherInfo.get(i).getSex() + "',"
								+ teacherInfo.get(i).getAge() + ",'" + teacherInfo.get(i).getPosition() + "','"
								+ teacherInfo.get(i).getPassword() + "')";
						String deleteString = "deleteInfo(" + teacherInfo.get(i).getId() + ")";
				%>
				<tr id=<%=teacherInfo.get(i).getId()%>>
					<td><%=teacherInfo.get(i).getId()%></td>
					<td id=<%="name" + i%>><%=teacherInfo.get(i).getName()%></td>
					<td id=<%="sex" + i%>><%=teacherInfo.get(i).getSex()%></td>
					<td id=<%="age" + i%>><%=teacherInfo.get(i).getAge()%></td>
					<td id=<%="position" + i%>><%=teacherInfo.get(i).getPosition()%></td>
					<td id=<%="password" + i%>><%=teacherInfo.get(i).getPassword()%></td>
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
	function update(i,Id,oldName,oldSex,oldAge,oldPosition,oldPassword){
		var tdname=document.getElementById("name"+i);
		var tdsex=document.getElementById("sex"+i);
		var tdage=document.getElementById("age"+i);
		var tdposition=document.getElementById("position"+i);
		var tdpassword=document.getElementById("password"+i);
		var tdbutton=document.getElementById("button"+i);
		
		tdname.innerHTML="";
		tdsex.innerHTML="";
		tdposition.innerHTML="";
		tdage.innerHTML="";
		tdpassword.innerHTML="";
		tdbutton.innerHTML="";
		

		var i1 = document.createElement("input");
		i1.type = "text";
		i1.value = oldName;
		i1.className = "input";
		
		var i2 = document.createElement("input");
		i2.type = "text";
		i2.value = oldSex;
		i2.className = "input";
		
		var i3 = document.createElement("input");
		i3.type = "text";
		i3.value = oldAge;
		i3.className = "input";
		
		var i4 = document.createElement("input");
		i4.type = "text";
		i4.value = oldPosition;
		i4.className = "input";
		
		var i5 = document.createElement("input");
		i5.type = "text";
		i5.value = oldPassword;
		i5.className = "input";
		
		var button = document.createElement("button");
		button.onclick = function (){
			sendUpdate(i,Id,oldName,oldSex,oldAge,oldPosition,oldPassword,i1.value,i2.value,i3.value,i4.value,i5.value);
		};
		button.innerText = "提交";
		
		tdname.appendChild(i1);
		tdsex.appendChild(i2);
		tdage.appendChild(i3);
		tdposition.appendChild(i4);
		tdpassword.appendChild(i5);
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

	function sendUpdate(i,Id,oldName,oldSex,oldAge,oldPosition,oldPassword,newName,newSex,newAge,newPosition,newPassword) {
		var url = "/demo/UpdateTeacherAction";
		xmlHttp.open("POST", url, true);
		xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlHttp.onreadystatechange = function(){
			updateResult(i,Id,oldName,oldSex,oldAge,oldPosition,oldPassword,newName,newSex,newAge,newPosition,newPassword);
		};
		xmlHttp.send('teacherId='+Id+'&name='+newName+'&password='+newPassword+'&sex='+newSex+'&position='+newPosition+'&age='+newAge);
	}
	function updateResult(i,Id,oldName,oldSex,oldAge,oldPosition,oldPassword,newName,newSex,newAge,newPosition,newPassword) {
		if (xmlHttp.readyState == 4) {
			var response = xmlHttp.responseText;
			var jsonObj=JSON.parse(response);
			var tdname=document.getElementById("name"+i);
			var tdsex=document.getElementById("sex"+i);
			var tdage=document.getElementById("age"+i);
			var tdposition=document.getElementById("position"+i);
			var tdpassword=document.getElementById("password"+i);
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
				tdsex.innerHTML=newSex;
				tdage.innerHTML=newAge;
				tdposition.innerHTML=newPosition;
				tdpassword.innerHTML=newPassword;	
				button.onclick = function (){
					update(i,Id,newName,newSex,newAge,newPosition,newPassword);
				};
			}
			else{
				alert(jsonObj.resultMessage);
				tdname.innerHTML=oldName;
				tdsex.innerHTML=oldSex;
				tdage.innerHTML=oldAge;
				tdposition.innerHTML=oldPosition;
				tdpassword.innerHTML=oldPassword;
				button.onclick = function (){
					update(i,Id,oldName,oldSex,oldAge,oldPosition,oldPassword);
				};
			}
		}
	}	
	
	function deleteInfo(Id){
		var url = "/demo/DeleteTeacherAction";
		xmlHttp.open("POST", url, true);
		xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlHttp.onreadystatechange = function(){
			deleteResult(Id);
		};
		xmlHttp.send('teacherId='+Id);
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
	
	<div class="container">
		<form method="POST" name="frmLogin" action="admin_query_ready.jsp">
			<button type="submit" class="btn btn-primary">返回</button>
		</form>
	</div>

</body>
</html>