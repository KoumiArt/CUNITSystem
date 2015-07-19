function createChat(userName,userId){
	if ($('#ht').tabs('exists', userName)){
        $('#ht').tabs('select', userName);
    } else {
		$('#ht').tabs('add',{
			title:userName,
			closable:true,
			content:"<div id='"+userId+"' class='easyui-layout' data-options='fit:true'></div>"
		});
		$("#ht").tabs({
			onClose:function(title,index){
				clearInterval(eval("interval_"+userId));
			}
		});
		$('#ht').tabs('select', userName);
    }
	
	var optionsCenter = {
		region: "center",
		split:true,
	    title: "咨询 "+userName+ " 老师",
	    content:"<div id='chart_"+userId+"'></div>"
	};
	$("#"+userId).layout('add', optionsCenter);
	var optionsSouth = {
		region: "south",
		height: 200,
		content:"<div style='float:left'><textarea rows='5' id='"+userId+"' cols='100' style='height:196px'></textarea></div><div style='float:right;padding-top:15px;padding-right:15px;'><input type='button' onclick='sendMsg("+userId+");' style='width:150;height:170' value='发送'/></div>"
	};
	$("#"+userId).layout('add', optionsSouth);
	/**
	 * 刷新聊天面板clearInterval
	 */
	eval("window.interval_"+userId+" ="+setInterval("getMsg("+userId+")", 2000));
}


/**
 * @param msgId 发送的对方的ID
 * @returns
 */
function sendMsg(teacherId){
	var sendMsgStr = $("textarea[id="+teacherId+"]").val();
	$.post(basePath+"/chat/sendMsg",{"teacherId":teacherId,"message":sendMsgStr},function(data){
		
	});
	$("textarea[id="+teacherId+"]").val("");
	getMsg(teacherId);
}

/**
 * 获取聊天信息
 * @param userId
 */
function getMsg(teacherId){
	$.post(basePath+"/chat/getMsg",{"teacherId":teacherId},function(data){
		//设置聊天面板
		var spanStr = "";
		$.each(data,function(i,item){
			spanStr += "<span>"+item.ownerName+"&nbsp;&nbsp;"+item.timeStr+"</span><br/><span>"+item.message+"</span><br/>";
		});
		var isExit = document.getElementById("chart_"+teacherId);
		if(isExit == undefined)
			clearInterval(eval("interval_"+teacherId));
		$("#chart_"+teacherId).html("");
		$("#chart_"+teacherId).append(spanStr);
		$("#chart_"+teacherId).parent().scrollTop($("#chart_"+teacherId).scrollHeight);
	});
}