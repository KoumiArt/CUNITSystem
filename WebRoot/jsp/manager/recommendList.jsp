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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/manager/recommendList.js"></script>
	<div id="tabdiv">
		<form method="post" id="searchRecommendFormId" action="${pageContext.request.contextPath}/manager/recommendList" style="padding-top: 5px;">
			<table style="font-size: 12px;width :100%;height: 80px;border: #7b9ebd 1px solid;padding-top: 5px;" cellSpacing="0" cellPadding="0"
				border="0">
				<tr>
					<td nowrap style="padding-left: 5px;width: 660px">
						推荐内容：<input name="content" type="text" />
						推荐类型：
						<select name="recType" style="width: 152px">
							<option value="0">------请选择------</option>
							<option value="1">教学材料</option>
							<option value="2">教学课程</option>
							<option value="3">教学方法</option>
							<option value="4">教学目标</option>
						</select>
					</td>
					<td align="left" style="padding-left: 15px;">
						<a id="searchRecommendId" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
					</td>
				</tr>
			</table>
		</form>
		<table id="recommendList"></table>
	</div>
</body>
</html>