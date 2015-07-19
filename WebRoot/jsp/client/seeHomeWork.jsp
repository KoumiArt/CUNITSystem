<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title></title>

</head>
<body>
	<c:if test="${lstHomeWork!='[]' and lstHomeWork!='' and lstHomeWork != null}">
		<div style="padding-left: 100px;vertical-align: middle;height: 100%;background: gray;">
			<c:forEach items="${lstHomeWork}" var="question" varStatus="i">
				<!-- 属性对应subject-resultmap.xml中的resultMap的id为answerResultMap中的键名 -->
				
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="20px">${i.index+1 }.</td><td>${question.content}<br/>
						</td>
					</tr>
					<c:if test="${question.optionList=='[]' || question.optionList eq null }">
						<tr>
							<td colspan="2">
								<span style="color: red;font-size: 13">此题目没有选项！</span>
							</td>
						</tr>
					</c:if>
					<c:if test="${question.optionList!='[]' and question.optionList != null}">
						<c:forEach items="${question.optionList}" var="option">
							<tr>
								<td width="20px">
									<c:if test="${question.curOptionId == option.optionId}">
										<input type="radio" disabled="disabled" checked="checked" name="optionId" value="${option.optionId}"/>
									</c:if>
									<c:if test="${question.curOptionId != option.optionId}">
										<input type="radio" disabled="disabled"  name="optionId" value="${option.optionId}"/>
									</c:if>
								</td>
								<td>
									${option.oName}. ${option.content}<br/>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</c:forEach>
		</div>
	</c:if>
	<c:if test="${lstHomeWork=='[]' || lstHomeWork eq null || lstHomeWork==''}">
		<center id="msg_id" style="padding-top: 33%;color: red;font-size: 13"> 此课程没有作业！</center>
	</c:if>
</body>
</html>