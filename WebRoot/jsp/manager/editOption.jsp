<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title></title>
  </head>
  
  <body>
  <script type="text/javascript">
		$(function(){
			$("#opt_backId").click(function() {
				closeWindow();
				refreshOption();
			});
			$("#opt_saveId").click(function() {
				var r = $("#optionForm").form("validate");
				if(!r) {
					return false;
				}
				
				$.post(basePath+"/manager/saveOption",$("#optionForm").serializeArray(),function(data){ 
					if(data !=null && $.trim(data) != "" && data == true){
						closeWindow();
						//$.messager.alert("操作提示","保存成功！","info");
						$.messager.show({
							title:"操作提示",
							msg:"保存成功！",
							timeout:5000,
							showType:"slide"
						});
						refreshOption();
					} else {
						$.messager.alert("操作提示","保存失败！","error");
					}						
				});
			});
		});
	</script>
  	<center>
		<form id="optionForm" style="width:480;height:255;" action="${pageContext.request.contextPath}/manager/saveResource" method="post" enctype="multipart/form-data">
			<input type="hidden" name="question.questionId">
			<table style="font-size: 13px;" width="480" height="255">
				<tr>
					<td width="100px">名称：</td>
					<td width="100px"><input type="text"  class="easyui-validatebox" data-options="required:true" name="oName" /></td>
				</tr>
				<tr>
					<td width="100px">内容：</td>
					<td width="100px"><input type="text"  class="easyui-validatebox" data-options="required:true" name="content" /></td>
				</tr>
					<tr>
					<td width="100px">真确答案：</td>
					<td width="100px">
						<select name="correct">
							<option value="2">否</option>
							<option value="1">是</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<a id="opt_backId" class="easyui-linkbutton" data-options="iconCls:'icon-back'">取消</a>
					<span style="width: 56px"></span>
						<a id="opt_saveId" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
					</td>
				</tr>
			</table>
		</form>
	</center>
  </body>
</html>
