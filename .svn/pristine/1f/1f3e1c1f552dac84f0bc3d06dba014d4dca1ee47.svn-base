<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.cunitsystem.listener.OnlineUsers"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
  </head>
  
  <body>
  	<div id="disMain">
		<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td style="width:230px;height:340px;">
					<div style="width: 80px;font-size: 13px">在线用户</div>
					<select id="onLineUserId" multiple="multiple" style="height:345px;width:100%" ondblclick="addAlreadyUser();">
					<c:forEach items="<%=OnlineUsers.getInstance().getUsers()%>" var="user">
						<c:if test="${user.userType == 2 && user.userId!= userSession.userId}">
							<option value="${user.userId }">${user.student.sName }</option>
						</c:if>
					</c:forEach>
					</select>
				</td>
				<td style="width:300px;height:340px;">
					<div style="width: 80px;font-size: 13px">已选用户</div>
					<select id="alreadyUserId" multiple="multiple" style="height:318px;width:100%" ondblclick="removeAlreadyUser();">
					</select>
					<div style="float:right;padding-top: 0px;padding-right: 40px;padding-bottom: 4px">
					<input type="button" class="button_Csss" value="确定" onclick="addDiscussion();" />&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" class="button_Csss" value="取消" onclick="closeWindow();"/>
					</div>
				</td>
			</tr>
		</table>
	</div>
  </body>
</html>
