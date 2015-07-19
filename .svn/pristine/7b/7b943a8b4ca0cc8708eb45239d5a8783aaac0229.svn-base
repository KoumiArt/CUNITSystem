<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

<title></title>

</head>
<body>
	
<script type="text/javascript">
	function doSubmit(){
		var q_msg_id = document.getElementById("q_msg_id");
		if(q_msg_id != undefined && q_msg_id != null && q_msg_id != ""){
			$.messager.alert("操作提示","当前课程没题目,无法提交！","info");
			return;
		}
		//获取所有选择的答案
		var checkVals = $("input[type=radio]:checked");
		var alertMsgArr = [];
		var scoreTotal = 0;
		var totalSorce = 0;
		$("input[name=correct]").each(function(i,item){
			var op = item.value.split("^|^");
			var iscorr = false;
			for(var j=0;j<checkVals.length;j++){
				if(op[0] == checkVals[j].value){
					iscorr = true;
					scoreTotal += Number(op[1]);
					break;
				}
			}
			totalSorce += Number(op[1]);
			if(iscorr == false){
				alertMsgArr.push("第"+op[2]+"题,选择错误,正确选项是："+op[3]);
			}
		});
		var showMsgHtml="<div style='text-align:center;'>";
		$.each(alertMsgArr,function(i,item){
			showMsgHtml += item+"<br/>";
		});
		showMsgHtml += "</div><div style='text-align:center;color:red;font-size:15'>一共得了"+scoreTotal+"分！</div>";
		$("#resultMsg_id").val(showMsgHtml);
		if(showMsgHtml !=""){
			if(totalSorce == scoreTotal){
				$.messager.alert("测试结果","恭喜你全部答对了！","info");
				closeMyDialog();
			} else {
				$.messager.alert("测试结果",showMsgHtml,"info");
			}
		} 
	}
</script>
	<c:if test="${lstQuestion!='[]'}">
		<div style="padding-left: 100px;vertical-align: middle;height: 88%">
			<c:forEach items="${lstQuestion}" var="question" varStatus="i">
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
									<c:if test="${option.correct==1}">
										<input type="hidden" name="correct" value="${option.optionId}^|^${question.score }^|^${i.index+1 }^|^${option.oName}" />
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
	<c:if test="${lstQuestion=='[]'}">
		<center id="q_msg_id" style="padding-top: 33%;color: red;font-size: 13"> 题库没有试题！</center>
	</c:if>
</body>
</html>