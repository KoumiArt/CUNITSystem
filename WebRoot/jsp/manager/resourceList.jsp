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


<title>资源列表</title>

</head>
<body>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/manager/resourceList.js"></script>
	<div id="tabdiv">
		<form method="post" id="searchResourceFormId" action="${pageContext.request.contextPath}/manager/resourceList" style="padding-top: 5px;">
			<table style="font-size: 12px;width :100%;height: 80px;border: #7b9ebd 1px solid;padding-top: 5px;" cellSpacing="0" cellPadding="0"
				border="0">
				<tr>
					<td nowrap style="padding-left: 5px;">
						资源名称：<input name="resourceName" type="text" />
						资源类型：
						<select name="resourceType" style="width: 152px">
							<option value="0">------请选择------</option>
							<option value="1">音频</option>
							<option value="5">视频</option>
							<option value="2">教学素材</option>
							<option value="3">教学课件</option>
							<option value="4">文献资料</option>
						</select>
						创建时间：<input
						name="beginTime" type="text" class="Wdate"
						onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
						- <input name="endTime" type="text"
						class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
					</td>
					<td align="left" style="padding-left: 15px;">
						<a id="searchResourceId" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
					</td>
				</tr>
			</table>
		</form>
		<table id="resourceList"></table>
	</div>
</body>
</html>