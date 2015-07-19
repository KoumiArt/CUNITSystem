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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/manager/questionList.js"></script>
	<input type="hidden" id="hidd_nwId" value="${param.nwId }"/>
	<form method="post" id="searchQuestionFormId" action="${pageContext.request.contextPath}/manager/questionList" style="padding-top: 5px;">
		<table style="font-size: 12px;width:100%;height: 80px;border: #7b9ebd 1px solid;padding-top: 5px;" cellSpacing="0" cellPadding="0"
			border="0">
			<tr>
				<td nowrap style="padding-left: 5px;width: 260px">
					题目：<input name="title" type="text" />
				</td>
				<td nowrap style="padding-left: 5px;width: 260px">
					内容：<input name="content" type="text" />
				</td>
				<td nowrap style="padding-left: 5px;width: 50%" id="nwTD_id">
					课程名称：<input name="netWorkCourse.nwId" type="text">
				</td>
				<td align="left" style="padding-left: 18px;width: 100px">
					<a id="searchQuestionId" class="easyui-linkbutton"  style="width: 62px" data-options="iconCls:'icon-search'">查询</a>
				</td>
			</tr>
		</table>
	</form>
	<table id="questionList"></table>
</body>
</html>