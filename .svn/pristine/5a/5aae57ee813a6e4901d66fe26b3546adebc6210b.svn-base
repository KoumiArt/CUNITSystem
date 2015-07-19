<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
<title>高校精品课程网络综合教学系统</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.3.5/themes/gray/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.3.5/themes/icon.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.5/jquery-1.4.4.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.5/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	var basePath = "${pageContext.request.contextPath}"; 
	var userRole = "${userSession.userType}";
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js"></script>
<script type="text/javascript">
	var url = basePath+'/jsp/register.jsp';
	$(function() {
		$("#register").click(
			function() {
				$('#win').window({  
					title : '用户注册', 
					href : url,
				    width:400,   
				    height:250,   
				    modal:true,
				    shadow :true,
				    resizable : true,
				    collapsible : false,
				    minimizable : false,
				    maximizable : false  
				}); 
		});
	});
</script>
<style type="text/css">
	#userForm input{
		width:143px;
		border:1px solid #ccc;
		padding:2px;
	}
</style>
</head>
<body>
<div id="top"> </div>
<form method="post" action="${pageContext.request.contextPath}/login">
  <div id="center">
    <div id="center_left"></div>
    <div id="center_middle">
      <div class="user">
        <label>用户名：
        <input type="text" name="loginName"  />
        </label>
      </div>
      <div class="user">
        <label>密　码：
        <input type="password" name="loginPwd"  />
        </label>
      </div>
    </div>
    <div id="center_middle_right"></div>
    <div id="center_submit">
      <div class="button"><input type="image"  src="${pageContext.request.contextPath}/images/dl.gif"  style="width: 57px;height: 20px;"/> </div>
      <div class="button"><input id="register" name="register" type="image"  src="${pageContext.request.contextPath}/images/zc.jpg"  style="width: 57px;height: 20px;" onclick="return false;"/> </div>
    </div>
    <div id="center_right"></div>
  </div>
</form>
<div id="messages">${message }</div>
<div id="footer">
</div>
<div id="win"></div> 
</body>
</html>

