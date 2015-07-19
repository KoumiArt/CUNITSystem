$(function(){
	q_getMsgToMe();
	window.msgToMe = setInterval("q_getMsgToMe()", 2000);
});

function q_createChat(userName,userId){
	if ($('#qc').tabs('exists', userName)){
        $('#qc').tabs('select', userName);
    } else {
		$('#qc').tabs('add',{
			title:userName,
			closable:true,
			content:"<div id='"+userId+"' class='easyui-layout' data-options='fit:true'></div>"
		});
		$("#qc").tabs({
			onClose:function(title,index){
				clearInterval(eval("interval_"+userId));
			}
		});
		$('#qc').tabs('select', userName);
    }
	var optionsCenter = {
		region: "center",
		split:true,
	    title: "咨询 "+userName+ " 老师",
	    content:"<div id='q_chart_"+userId+"'></div>"
	};
	$("#"+userId).layout('add', optionsCenter);
	var optionsSouth = {
		region: "south",
		height: 200,
		content:"<div style='float:left'><textarea rows='5' id='"+userId+"' cols='100' style='height:196px'></textarea></div><div style='float:right;padding-top:15px;padding-right:15px;'><input type='button' onclick='q_sendMsg("+userId+");' style='width:150;height:170' value='发送'/></div>"
	};
	$("#"+userId).layout('add', optionsSouth);
	q_getMsg(userId);
	/**
	 * 刷新聊天面板
	 */
	eval("window.interval_"+userId+" ="+setInterval("q_getMsg("+userId+")", 2000));
}



/**
 * 获取聊天信息
 * @param userId
 */
function q_getMsg(userId){
	$.post(basePath+"/chat/getMsg",null,function(data){
		//设置聊天面板
		var spanStr = "";
		$.each(data,function(i,item){
			spanStr += "<span>"+item.ownerName+"&nbsp;&nbsp;"+item.timeStr+"</span><br/><span>"+item.message+"</span><br/>";
		});
		var isExit = document.getElementById("q_chart_"+userId);
		if(isExit == undefined){
			clearInterval(msgToMe);
			return;
		}
		$("#q_chart_"+userId).html("");
		$("#q_chart_"+userId).append(spanStr);
		$("#q_chart_"+userId).parent().scrollTop($("#q_chart_"+userId).scrollHeight);
	});
}

/**
 * 获取与我聊天的学生
 * @param userId
 */
function q_getMsgToMe(){
	$.post(basePath+"/chat/getMsgToMe",null,function(data){
		//
		var spanStr = "";
		$.each(data,function(i,item){
			spanStr += "<a class='box' style='cursor: pointer' onclick=\"q_createChat('"+item.student.sName+"','"+item.userId+"')\">"+item.student.sName+"</a><br/>";
		});
		var isExit = document.getElementById("stu_chat_id");
		if(isExit == undefined){
			clearInterval(msgToMe);
			return;
		}
		$("#stu_chat_id").html("");
		$("#stu_chat_id").append(spanStr);
	});
}


/**
 * @param msgId 发送的对方的ID
 * @returns
 */
function q_sendMsg(teacherId){
	var sendMsgStr = $("textarea[id="+teacherId+"]").val();
	$.post(basePath+"/chat/sendMsg",{"teacherId":teacherId,"message":sendMsgStr},function(data){
		
	});
	$("textarea[id="+teacherId+"]").val("");
	q_getMsg(teacherId);
}