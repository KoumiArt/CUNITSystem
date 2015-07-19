<%@page import="com.cunitsystem.listener.OnlineUsers"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title></title>
    <script type="text/javascript">
    	
    </script>
  </head>
  
  <body>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/client/helpTeacher.js"></script>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'west',split:true,title:'在线老师'" style="width:200px;">
			<c:forEach items="<%=OnlineUsers.getInstance().getUsers()%>" var="user">
				<c:if test="${user.userType == 3 }">
					<a class="box" style="cursor: pointer" onclick="createChat('${user.teacher.tName }','${user.userId }');">${user.teacher.tName }</a><br/>
				</c:if>
			</c:forEach>
		</div>
		<div data-options="region:'center'" style="padding:10px;">
			<div id="ht" class="easyui-tabs" data-options="fit:true,border:false,plain:true"  title="聊天面板">
				
			</div>
		</div>
	</div>
  </body>
</html>
