<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>userInfo</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	
  </head>
  <body>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/client/register.js"></script>
  <center>
  <div id="show" class="wrap">
	<form id="userForm" action="${pageContext.request.contextPath}/registerUser" method="post">
	<table id="userInfoId" style="font-size: 13px">
		<tr height="20px">
			<td>
			</td>
			<td>
			</td>
		</tr>
		<tr>
			<td width="100px">用户类别：</td>
			<td width="100px">
				<select id="userType" name="userType" class="easyui-combobox" style="width: 150px" data-options="required:true,editable:false">
					<option value="2">学生</option>
					<option value="3">老师</option>
				</select>
			</td>
		</tr>
		<tr>
			<td width="100px">身份证号：</td>
			<td>
				<input type="text" name="userSessionId"  class="easyui-validatebox" data-options="validType:'remote[\'${pageContext.request.contextPath}/checkCardId?paramter=\'+$(\'#userType\').combobox(\'getValue\'),\'userSessionId\']',required:true,invalidMessage:'该身份证号不存在,不能注册'" />
			</td>			
		</tr>
		<tr>
			<td width="100px">登录名称：</td>
			<td width="100px"><input type="text"  class="easyui-validatebox" name="loginName" data-options="required:true,invalidMessage:'登录名已存在',validType:'remote[\'${pageContext.request.contextPath}/checkLoginName\',\'loginName\']'"/></td>
		</tr>
		<tr>
			<td width="100px">密码：</td>
			<td><span id="loginPwd"><input type="password" name="loginPwd" class="easyui-validatebox" data-options="required:true"  /></span></td>			
		</tr>
		<tr>
			<td width="100px">确认密码：</td>
			<td><span id="loginPwd2"><input type="password" name="loginPwd2" class="easyui-validatebox"  data-options="required:true,validType:'loginPwd'"  /></span></td>			
		</tr>
		<tr>
			<td align="center" colspan="2">
				<a id="reg_backId" class="easyui-linkbutton" data-options="iconCls:'icon-back'">返回</a>
			<span style="width: 56px"></span>
				<a id="reg_saveId" class="easyui-linkbutton" data-options="iconCls:'icon-save'">注册</a>
			</td>
		</tr>
	</table>
	</form>
</div>
</center>
  </body>
</html>
