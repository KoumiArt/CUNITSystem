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


<title>老师列表</title>

</head>
<body>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/manager/teacherList.js"></script>
	<div id="tabdiv">
		<form method="post" id="searchTeacherFormId" action="${pageContext.request.contextPath}/manager/teacherList" style="padding-top: 5px;">
			<table style="font-size: 12px;width :100%;height: 80px;border: #7b9ebd 1px solid;padding-top: 5px;" cellSpacing="0" cellPadding="0"
				border="0">
				<tr>
					<td nowrap style="padding-left: 5px;width: 660px">
						姓名：<input name="tName" type="text" />
						性别：
						<select name="sex" class="easyui-validatebox" style="width: 152px" data-options="required:true">
							<option value="0">-----请选择-----</option>
							<option value="1">男</option>
							<option value="2">女</option>
						</select>
						教龄：
						<input name="beginTeachingAge" type="text" class="easyui-validatebox"/>
						- <input name="endTeachingAge" type="text" class="easyui-validatebox"  />
					</td>
					<td align="left" style="padding-left: 15px;">
						<a id="searchTeacherId" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
					</td>
				</tr>
			</table>
		</form>
		<table id="teacherList"></table>
	</div>
</body>
</html>