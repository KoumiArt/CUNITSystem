<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

<title></title>

</head>
<body>
	
<script type="text/javascript">
	function doExamQuestionSubmit(nwId){
		var msg_id = document.getElementById("e_q_msg_id");
		if(msg_id != undefined && msg_id != null && msg_id != ""){
			$.messager.alert("操作提示","当前课程没考试,无法提交！","info");
			return;
		}
		//获取所有选择的答案
		var checkVals = $("input[type=radio]:checked");
		var optionIds = [];
		$.each(checkVals,function(i,item){
			optionIds.push(item.value);
		});
		if(optionIds.length <=0){
			$.messager.alert("操作提示","提交失败,你还没有做,无法提交！","error");
			return;
		}
		$.post(basePath+"/manager/submitExamQusetion",$.param({"optionIds":optionIds,"nwId":nwId},true),function(data){
			if(data){
				$.messager.show({
							title:"操作提示",
							msg:"提交成功！",
							timeout:5000,
							showType:"slide"
						});
				closeMyDialog();
			} else {
				$.messager.alert("操作提示","提交失败！","error");
			}
		});
	}
</script>
	<c:if test="${lstExamQuestion!='[]'}">
		<div style="padding-left: 100px;vertical-align: middle;height: 88%">
			<c:forEach items="${lstExamQuestion}" var="question" varStatus="i">
				<!-- 属性对应subject-resultmap.xml中的resultMap的id为answerResultMap中的键名 -->
				
				<table >
					<tr>
						<td width="20px">${i.index+1 }.</td><td>${question.content}<br/>
						</td>
					</tr>
					<c:if test="${question.optionList=='[]'}">
						<tr>
							<td colspan="2">
								<span style="color: red;font-size: 13">此题目没有选项！</span>
							</td>
						</tr>
					</c:if>
					<c:if test="${question.optionList!='[]'}">
						<c:forEach items="${question.optionList}" var="option">
							<tr>
								<td width="20px">
									<input type="radio" name="${question.questionId}" value="${option.optionId}"/>
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
	<c:if test="${lstExamQuestion=='[]'}">
		<center id="e_q_msg_id" style="padding-top: 33%;color: red;font-size: 13">目前此课程没考试！</center>
	</c:if>
</body>
</html>