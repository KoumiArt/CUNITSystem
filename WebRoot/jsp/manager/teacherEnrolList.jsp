<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
<head>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


<title>我的课程列表</title>

</head>
<body>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/manager/teacherEnrolList.js"></script>
	<input type="hidden" id="result_hidd_tId" value="${param.tId }"/>
	<table id="teacherEnrolList"></table>
</body>
</html>