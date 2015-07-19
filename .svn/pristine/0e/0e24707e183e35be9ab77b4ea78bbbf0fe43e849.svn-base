<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title></title>
  </head>
  
  <body>
  <script type="text/javascript">
		$(function(){
			$("#sub_backId").click(function() {
				closeWindow();
				refreshSubjectList();
			});
			$("#sub_saveId").click(function() {
				var r = $("#subjectForm").form("validate");
				if(!r) {
					return false;
				}
				
				$.post(basePath+"/manager/saveSubject",$("#subjectForm").serializeArray(),function(data){ 
					if(data !=null && $.trim(data) != "" && data == true){
						closeWindow();
						$.messager.alert("操作提示","保存成功！","info");
						refreshSubjectList();
					} else {
						$.messager.alert("操作提示","保存失败！","error");
					}						
				});
			});
		});
	</script>
  	<center>
		<form id="subjectForm" style="width:480;height:255;" action="${pageContext.request.contextPath}/manager/saveResource" method="post" enctype="multipart/form-data">
			<table style="font-size: 13px;" width="480" height="255">
				<tr>
					<td width="100px">科目名：</td>
					<td width="100px"><input type="text"  class="easyui-validatebox" data-options="required:true" name="subjectName" /></td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<a id="sub_backId" class="easyui-linkbutton" data-options="iconCls:'icon-back'">取消</a>
					<span style="width: 56px"></span>
						<a id="sub_saveId" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
					</td>
				</tr>
			</table>
		</form>
	</center>
  </body>
</html>
