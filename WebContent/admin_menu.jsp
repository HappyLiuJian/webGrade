<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>admin_menu</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/admin.css">
</head>
<body>
	<div id="sidebar" class="sidebar col-sm-3 col-md-2">
      <ul id="accordion" class="accordion nav nav-sidebar list-unstyled">
          <li>
            <!--<div class="link">查询信息</div>-->
            <a class="link">查询<span class="glyphicon glyphicon-search"></span></a>
            <ul class="submenu list-unstyled">
              <li><a href="admin_query_ready.jsp" target="main">查询人员</a></li>
              <li><a href="admin_query_course.jsp" target="main">查询课程</a></li>
            </ul>
          </li>
          <li>
            <a class="link">录入<span class="glyphicon glyphicon-inbox"></span></a>
            <ul class="submenu list-unstyled">
              <li><a href="admin_input_student.jsp" target="main">录入学生</a></li>
              <li><a href="admin_input_teacher.jsp" target="main">录入教师</a></li>
              <li><a href="admin_input_admin.jsp" target="main">录入管理员</a></li>
              <li><a href="admin_input_course.jsp" target="main">录入课程</a></li>
            </ul>
          </li>
          <li>
            <a class="link">设置<span class="glyphicon glyphicon-wrench"></span></a>
            <ul class="submenu list-unstyled">
              <li><a href="password_modify.jsp" target="main">密码修改</a></li>
            </ul>
          </li>
      </ul>
    </div>
    <script type="text/javascript" src="./js/jquery.min.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/admin.js"></script>
</body>
</html>