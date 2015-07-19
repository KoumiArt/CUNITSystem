<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title></title>
  </head>
  
  <body>
  <script type="text/javascript">
		$(function(){
			$("#teac_backId").click(function() {
				closeWindow();
				refreshTeacherList();
			});
			$("#teac_saveId").click(function() {
				var r = $("#teacherForm").form("validate");
				if(!r) {
					return false;
				}
				
				$.post(basePath+"/manager/saveTeacher",$("#teacherForm").serializeArray(),function(data){ 
					if(data !=null && $.trim(data) != "" && data == true){
						closeWindow();
						//$.messager.alert("操作提示","保存成功！","info");
						$.messager.show({
							title:"操作提示",
							msg:"保存成功！",
							timeout:5000,
							showType:"slide"
						});
						refreshTeacherList();
					} else {
						$.messager.alert("操作提示","保存失败！","error");
					}						
				});
			});
		});
	</script>
  	<center>
		<form id="teacherForm" style="width:480;height:255;" action="${pageContext.request.contextPath}/manager/saveResource" method="post" enctype="multipart/form-data">
			<table style="font-size: 13px;" width="480" height="255">
				<tr>
					<td width="100px">姓名：</td>
					<td width="100px"><input type="text"  class="easyui-validatebox" data-options="required:true" name="tName" /></td>
				</tr>
				<tr>
					<td width="100px">性别：</td>
					<td>
						<select name="sex" class="easyui-validatebox" style="width: 152px" data-options="required:true">
							<option value="1">男</option>
							<option value="2">女</option>
						</select>	
					</td>			
				</tr>
				<tr>
					<td width="100px">教龄：</td>
					<td>
					<input type="text"  name="teachingAge" data-options="required:true,max:50,min:1" /></td>			
				</tr>
				<tr>
					<td width="100px">身份证号：</td>
					<td>
					<input type="text" name="tNo" class="easyui-validatebox" data-options="required:true" /></td>			
				</tr>
				<tr>
					<td width="100px">邮箱：</td>
					<td>
					<input type="text" name="email" class="easyui-validatebox" data-options="required:true,validType:'email'" /></td>			
				</tr>
				<tr>
					<td width="100px">手机号：</td>
					<td>
					<input type="text" name="phone" data-options="required:true,validType:'mobile'" /></td>			
				</tr>
				<tr>
					<td width="100px">联系地址：</td>
					<td>
					<input type="text" name="address" class="easyui-validatebox" data-options="required:true" /></td>			
				</tr>
				<tr>
					<td align="center" colspan="2">
						<a id="teac_backId" class="easyui-linkbutton" data-options="iconCls:'icon-back'">取消</a>
					<span style="width: 56px"></span>
						<a id="teac_saveId" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
					</td>
				</tr>
			</table>
		</form>
	</center>
  </body>
</html>
