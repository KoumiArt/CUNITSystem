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


<title>网络课程列表</title>

</head>
<body>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/client/stuNetWorkCourseList.js"></script>
	<input type="hidden" id="stuNet_hidd_nwId" value="${param.nwId }"/>
	<input type="hidden" id="stuNet_hidd_type" value="${param.type }"/>
	<div id="tabdiv">
		<form method="post" id="searchStuNetWorkCourseFormId" action="${pageContext.request.contextPath}/manager/stuNetWorkCourseList" style="padding-top: 5px;">
			<table style="font-size: 12px;width :100%;height: 80px;border: #7b9ebd 1px solid;padding-top: 5px;" cellSpacing="0" cellPadding="0"
				border="0">
				<tr>
					<td nowrap style="padding-left: 5px;width: 260px">
						学生名称：<input name="sName" type="text" />
					</td>
					<td align="left" style="padding-left: 15px;">
						<a id="searchStuNetWorkCourseId" class="easyui-linkbutton" style="width: 62px"  data-options="iconCls:'icon-search'">查询</a>
					</td>
				</tr>
			</table>
		</form>
		<table id="stuNetWorkCourseList"></table>
	</div>
</body>
</html>