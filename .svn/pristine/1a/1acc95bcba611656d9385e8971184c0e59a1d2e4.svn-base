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

<base target="_self">
<title>file</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.3.5/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.3.5/themes/icon.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.5/jquery-1.4.4.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.5/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
		$(function(){
			var myParent = window.parent;
			$("#rec_backId").click(function() {
				if(!myParent.hasOwnProperty("closeWindow"))
					myParent = window.parent.parent;
				myParent.closeWindow();
				myParent.refreshRecommendList();
			});
			$("#rec_saveId").click(function() {
				var r = $("#recommendForm").form("validate");
				if(!r) {
					return false;
				}
				var recommendFile = $.trim($("#recommendFile").val());
				if(recommendFile!=null && recommendFile !=""){
					$("#path").val($("#recommendFile").val());
				}
				document.getElementById("recommendForm").submit();
			});
		});
		function myRecLoad(){
			var result = $("input[id=rec_result]", parent.document).val();
			if(result !=null && $.trim(result) != ""){
				myParent = window.parent.parent;
				if(result == "true"){
					myParent.closeWindow();
					myParent.refreshRecommendList();
				} else {
					$.messager.alert("操作提示","保存失败！","error");
				}
			} else {
				var recId = $(parent.document).find("#recId").val();
				if(recId!=null&&recId!=""&&recId!=undefined){
					$.post(window.parent.basePath+"/manager/getRecommend",{"recId":recId},function(data){
						$("textarea[name=content]").val(data.content);
						$("input[name=path]").val(data.path);
						$("input[name=recId]").val(data.recId);
						$("input[name=recommendFile]").validatebox('disableValidation');
						$("select[name=recType]").val(data.recType);
						$("#recommendForm").append("<input type='hidden' name='recId' value='"+recId+"'/>");
					});
				}
			}
		}
	</script>
</head>
<body onload="myRecLoad()" >
	<center id="myCenter" >
		<form id="recommendForm" target="_self" style="width:480;height:255;" action="${pageContext.request.contextPath}/manager/saveRecommend" method="post" enctype="multipart/form-data">
			<input type="hidden" name="path" id="path"/>
			<table style="font-size: 13px;" width="480" height="255">
				<tr>
					<td width="100px">推荐内容：</td>
					<td width="100px"><textarea cols="39" rows="6" class="easyui-validatebox" data-options="required:true" name="content" /></textarea></td>
				</tr>
				<tr>
					<td width="100px">推荐类型：</td>
					<td>
						<select name="recType" style="width: 152px">
							<option value="1">教学材料</option>
							<option value="2">教学课程</option>
							<option value="3">教学方法</option>
							<option value="4">教学目标</option>
						</select>			
				</tr>
				<tr>
					<td width="100px">附件：</td>
					<td>
					<input type="file" name="recommendFile" id="recommendFile" class="easyui-validatebox" /></td>			
				</tr>
				<tr>
					<td align="center" colspan="2">
						<a id="rec_backId" class="easyui-linkbutton" data-options="iconCls:'icon-back'">取消</a>
					<span style="width: 56px"></span>
						<a id="rec_saveId" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>