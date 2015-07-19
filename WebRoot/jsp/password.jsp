<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<style type="text/css">
			input {
				width: 200px;
				border: 1px solid #ccc;
				padding: 2px;
			}
		</style>
	</head>
	<body>
		<script type="text/javascript">
			$(function() {
				$("#pwd_updateId").click(
					function() {
						var r = $('#userPwdForm').form('validate');
						if (!r) {
							return false;
						}
						$.post(basePath + "/editPwd", $("#userPwdForm").serializeArray(), function(data) {
							if(data !=null && $.trim(data) != "" && data == true){
								$('#updatePwdWin').window('close');
								$.messager.show({
									title:"操作提示",
									msg:"修改密码成功！",
									timeout:3000,
									showType:"slide"
								});
							} else {
								$.messager.alert("操作提示","修改密码失败！", "error");
							}	
						});
				});
				
				$("#pwd_backId").click(function() {
					$('#updatePwdWin').window('close');
				});
			});
		
			$.extend($.fn.validatebox.defaults.rules, {
				loginPwd: {
			        validator: function (value) {		        
			            return $("input[name=loginPwd]").val()==value;
			    	},
			    	message: '两次输入的密码不一致.'
				}
			});
			$(function() {
				$('#userForm input').each(function() {
					if ($(this).attr('required') || $(this).attr('validType'))
						$(this).validatebox();
				});
			});
		</script>
		<center>
			<div>
				<form id="userPwdForm" method="post" action="${pageContext.request.contextPath}/editPwd">
					<table id="pwdId">
						<tr height="10px">
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>
								原始密码：
							</td>
							<td>
								<input type="password" name="pwd" class="easyui-validatebox"
									 data-options="validType:'remote[\'${pageContext.request.contextPath}/checkOldLoginPwd?loginName=${userSession.loginName }\',\'pwd\']',required:true,invalidMessage:'原始密码不正确'" />
								<input type="hidden" class="easyui-validatebox" name="loginName" value="${userSession.loginName }"  />
								<span></span>
							</td>
						</tr>
						<tr>
							<td width="100px">密码：</td>
							<td><span id="loginPwd"><input type="password" name="loginPwd" class="easyui-validatebox" data-options="required:true"  /></span></td>			
						</tr>
						<tr>
							<td width="100px">确认密码：</td>
							<td><span id="loginPwd2"><input type="password" name="loginPwd2" class="easyui-validatebox"  data-options="required:true,validType:'loginPwd'"  /></span></td>			
						</tr>
					</table>
					<a id="pwd_backId" class="easyui-linkbutton" data-options="iconCls:'icon-back'">返回</a><span
						style="width: 26px"></span>
					<a id="pwd_updateId" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
				</form>

			</div>
		</center>
	</body>
</html>
