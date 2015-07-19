<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title></title>
  </head>
  
  <body>
  <script type="text/javascript">
		 
		$(function(){
			$("#que_backId").click(function() {
				closeWindow();
				refreshQuestion();
			});
			$("#que_saveId").click(function() {
				var r = $("#questionForm").form("validate");
				if(!r) {
					return false;
				}
				
				$.post(basePath+"/manager/saveQuestion",$("#questionForm").serializeArray(),function(data){ 
					if(data !=null && $.trim(data) != "" && data == true){
						closeWindow();
						//$.messager.alert("操作提示","保存成功！","info");
						$.messager.show({
							title:"操作提示",
							msg:"保存成功！",
							timeout:5000,
							showType:"slide"
						});
						refreshQuestion();
					} else {
						$.messager.alert("操作提示","保存失败！","error");
					}						
				});
			});
		});
	</script>
  	<center>
		<form id="questionForm" style="width:480;height:255;" action="${pageContext.request.contextPath}/manager/saveResource" method="post" enctype="multipart/form-data">
			<table style="font-size: 13px;" width="480" height="255">
				<tr>
					<td width="100px">课程名称：</td>
					<td width="100px">
						<input name="netWorkCourse.nwId" data-options="required:true">
					</td>
				</tr>
				<tr>
					<td width="100px">题目：</td>
					<td width="100px"><textarea  class="easyui-validatebox" data-options="required:true" name="content" ></textarea></td>
				</tr>
				<tr>
					<td width="100px">分数：</td>
					<td width="100px"><input type="text" data-options="required:true,min:1,max:20" name="score" /></td>
				</tr>
				<tr>
					<td width="100px">描述：</td>
					<td width="100px"><textarea  class="easyui-validatebox" name="description" ></textarea></td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<a id="que_backId" class="easyui-linkbutton" data-options="iconCls:'icon-back'">取消</a>
					<span style="width: 56px"></span>
						<a id="que_saveId" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
					</td>
				</tr>
			</table>
		</form>
	</center>
  </body>
</html>
