<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>userInfo</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<style type="text/css">
		input{
			width:200px;
			border:1px solid #ccc;
			padding:2px;
		}
	</style>
  </head>
  <body>
	<script type="text/javascript">
		$(function() {
			$("#backId").click(function() {
				$('#updateUserWin').window('close');
			});
			$("#saveId").click(function() {				
				var r = $('#userForm').form('validate');
				if(!r) {
					return false;
				}
				$.post(basePath + "/editUserInfo",$("#userForm").serializeArray(),function(data){ 
					if(data !=null && $.trim(data) != "" && data == true){
						$('#updateUserWin').window('close');
						$.messager.show({
							title:"操作提示",
							msg:"修改成功！",
							timeout:3000,
							showType:"slide"
						});
						//$.post(basePath + "/logout");
					} else {
						$('#updateUserWin').window('close');
						$.messager.show({
							title:"操作提示",
							msg:"修改失败！", 
							timeout:3000,
							showType:"slide"
						});
					}	
				});
			});			
		});
		$.extend($.fn.validatebox.defaults.rules, {
  		 	mobile: {
		        validator: function (value) {
		        	var reg = /^1[3|4|5|8|9]\d{9}$/;
		            return reg.test(value);
		        },
		        message: '输入手机号码格式不准确.'
	    	}
	   });
	   $(function(){
			$('#userForm input').each(function () {
	            if ($(this).attr('required') || $(this).attr('validType'))
		                $(this).validatebox();
		    });	
	   });
	</script>
  <center>
  <div id="show" class="wrap">
	<form id="userForm" action="${pageContext.request.contextPath}/editUserInfo" method="post">
	<table id="userInfoId" style="font-size: 13px">
		<tr height="10px">
			<td colspan="2" align="center"><h2>用户信息修改</h2></td>
		</tr>
		<tr>
			<td width="100px">登录名称：</td>
			<td width="100px">${userSession.loginName }</td>
		</tr>
		<tr>
			<td width="100px">真实姓名：</td>
			<td>
			<span id="names">
				<input type="text" class="easyui-validatebox" name="${userSession.userType==2 ? 'student.sName':'teacher.tName' }" data-options="required:true" value="${userSession.userType==2 ? userSession.student.sName:userSession.teacher.tName }"  />
			</span>
			</td>			
		</tr>
		<tr>
			<td width="100px">身份证号：</td>
			<td>
				<span id="code">
					<input type="text" class="easyui-validatebox" name="${userSession.userType==2 ? 'student.sNo':'teacher.tNo' }" data-options="required:true" value="${userSession.userType==2 ? userSession.student.sNo:userSession.teacher.tNo }"  />
				</span>
			</td>
		</tr>
		<tr>
			<td width="100px">性别：</td>
			<td width="100px">
				<span id="sex">
					<input type="text" class="easyui-validatebox" name="${userSession.userType==2 ? 'student.sex':'teacher.sex' }" data-options="required:true" value="${userSession.userType==2 ? userSession.student.sexStr:userSession.teacher.sexStr }"  />
				</span>
			</td>
		</tr>
		<tr>
			<td width="100px">年龄：</td>
			<td width="100px">
				<span id="age">
					<input type="text" class="easyui-validatebox" name="${userSession.userType==2 ? 'student.age' : 'teacher.teachingAge'}" data-options="required:true" value="${userSession.userType==2 ? userSession.student.age:userSession.teacher.teachingAge }"  />
					<input type="hidden" class="easyui-validatebox" name="fkId" data-options="required:true" value="${userSession.fkId }"  />
					<input type="hidden" class="easyui-validatebox" name="userType" data-options="required:true" value="${userSession.userType }"  />
				</span>
			</td>
		</tr>
		<tr>
			<td width="100px">电子邮件：</td>
			<td width="100px">
				<span id="email">
					<input type="text" class="easyui-validatebox" data-options="required:true" data-options="validType:'email'" name="${userSession.userType==2 ? 'student.email':'teacher.email'}" class="easyui-validatebox"  value="${userSession.userType ==2 ? userSession.student.email: userSession.teacher.email}"  />
				</span>
			</td>
		</tr>
		<tr>
			<td width="100px">地址：</td>
			<td width="100px">
				<span id="address">
					<input type="text" class="easyui-validatebox"  name="${userSession.userType==2 ? 'student.address':'teacher.address'}"  value="${userSession.userType==2 ? userSession.student.address:userSession.teacher.address }"  />
				</span>
			</td>
		</tr>
		<tr>
			<td width="100px">手机号码：</td>
			<td>
				<span id="phone">
					<input type="text" class="easyui-numberbox"  data-options="validType:'mobile'" name="${userSession.userType==2 ? 'student.phone':'teacher.phone'}" value="${userSession.userType==2 ? userSession.student.phone:userSession.teacher.phone }" />
				</span>
			</td>
		</tr>
		<tr>
			<td >
				<a id="backId" class="easyui-linkbutton" data-options="iconCls:'icon-back'">返回</a>
			</td>
			<td>
				<a id="saveId" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
			</td>
		</tr>
	</table>
	</form>
</div>
</center>
  </body>
</html>
