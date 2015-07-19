<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title></title>
  </head>
  
  <body>
  <script type="text/javascript">
		 
		$(function(){
			$("#exam_backId").click(function() {
				closeWindow();
				refreshExamList();
			});
			$("#exam_saveId").click(function() {
				var r = $("#examForm").form("validate");
				if(!r) {
					return false;
				}
				
				$.post(basePath+"/manager/saveExam",$("#examForm").serializeArray(),function(data){ 
					if(data !=null && $.trim(data) != "" && data == true){
						closeWindow();
						$.messager.show({
							title:"操作提示",
							msg:"保存成功！",
							timeout:5000,
							showType:"slide"
						});
						refreshExamList();
					} else {
						$.messager.alert("操作提示","保存失败！","error");
					}						
				});
			});
		});
	</script>
  	<center>
		<form id="examForm" style="width:480;height:255;" action="${pageContext.request.contextPath}/manager/saveResource" method="post" enctype="multipart/form-data">
			<table style="font-size: 13px;" width="480" height="255">
				<tr>
					<td width="100px">课程名称：</td>
					<td width="100px">
						<input name="netWorkCourse.nwId" data-options="required:true">
					</td>
				</tr>
				<tr>
					<td width="100px">考试名称：</td>
					<td width="100px"><input  class="easyui-validatebox" data-options="required:true" name="examName" /></td>
				</tr>
				<tr>
					<td width="100px">结束日期：</td>
					<td width="100px"><input name="endDate" type="text"
						class="Wdate easyui-validatebox" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" data-options="required:true"/></td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<a id="exam_backId" class="easyui-linkbutton" data-options="iconCls:'icon-back'">取消</a>
					<span style="width: 56px"></span>
						<a id="exam_saveId" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
					</td>
				</tr>
			</table>
		</form>
	</center>
  </body>
</html>
