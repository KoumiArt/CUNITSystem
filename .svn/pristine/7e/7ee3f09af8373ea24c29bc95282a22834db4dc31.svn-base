<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>answer</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>
<script type="text/javascript">

	function gosub(){
		//所有真确结果
		var resAll = new Array();
		//所有用户选中的结果
		var radAll = new Array();
		//所有分数
		var scoAll = new Array();
		//错误题目编号
		var err = "";
		
		//获取所有结果
		for(var i = 1;i <= 50;i++){
			var res = $("div [id=request"+i+"]").attr("title");
			if(res == undefined){
				break;
			}
			resAll[i-1] = $.trim($("div [id=request"+i+"]").attr("title"));
			
			scoAll[i-1] = $("input [id=score"+i+"]").val();
		}
		
		//获取选中的值
		for(var i = 0;i<=50;i++){
			var chs = document.getElementsByName("rad"+i+"");
			var r = "";
			for(var j =0;j < chs.length;j++){
				if(chs[j].checked == true){
					r = r + chs[j].value;
				}
			}
			radAll[i] = $.trim(r);
			if(chs == undefined || chs.length == 0){
				break;
			}
		}
		
		
		
		//现在错误信息
		for(var i = 0;i < resAll.length;i++){
			//alert(resAll[i] +" | "+ radAll[i]);
			if($.trim(resAll[i]) != $.trim(radAll[i])){
				err = err + (i+1) +" ";
			}
		}
		if(err!=""){
			//alert("错误题号："+err);
			$.messager.alert('提示', "错误题号："+err, 'info');
		} else {
			$.messager.alert('提示', "恭喜你全答对啦.", 'info');
			closeWindow();		
		}
	}

	function showResult(){
		for(var i = 1;i <= 50;i ++){
			var res = $("div [id=request"+i+"]").attr("title");
			if(res == undefined){
				break;
			}
			$("div [id=request"+i+"]").html($("div [id=request"+i+"]").attr("title"));
		}
	}
	
</script>
<body>
	<!-- 数据库查出来的集合，集合中放的是Map  -->
	<div style="width: 800px; padding-left: 100px;">
	<c:forEach items="${lstAnswer}" var="answer" varStatus="i">
		<!-- 属性对应subject-resultmap.xml中的resultMap的id为answerResultMap中的键名 -->
		
		<table>
			<tr><td width="20px">${i.index+1 }.</td><td>${answer.tqContent}<br/><input type="hidden" id="score${i.index }" value="${answer.tqScore }" /></td></tr>
			<tr><td width="20px"><input type="checkbox" value="A" id="rad${i.index }" name="rad${i.index }" /></td><td>A.${answer.toTextOne}<br/></td></tr>
			<tr><td width="20px"><input type="checkbox" value="B" id="rad${i.index }" name="rad${i.index }" /></td><td>B.${answer.toTextTwo}<br/></td></tr>
			<tr><td width="20px"><input type="checkbox" value="C" id="rad${i.index }" name="rad${i.index }" /></td><td>C.${answer.toTextThree}<br/></td></tr>
			<tr><td width="20px"><input type="checkbox" value="D" id="rad${i.index }" name="rad${i.index }" /></td><td>D.${answer.toTextfour}<br/></td></tr>
			<tr><td width="20px"></td><td><div id="request${i.index+1 }" style="color: red;" title="${answer.quResult }"></div><br/></td></tr>
		</table>
	</c:forEach>
	<button onclick="gosub()">提交</button> | <button onclick="javascript:showResult()">显示真确答案</button>
	</div>
</body>
</html>