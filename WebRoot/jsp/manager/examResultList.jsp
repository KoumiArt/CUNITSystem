<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


<title></title>

</head>
<body>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/manager/examResultList.js"></script>
	<input type="hidden" id="result_hidd_examId" value="${param.examId }"/>
	<input type="hidden" id="result_hidd_nwId" value="${param.nwId }"/>
	<div style="padding:5px;border:1px solid #95B8E7;" >
			考试成绩列表
	</div>
	<table id="examResultList"></table>
</body>
</html>