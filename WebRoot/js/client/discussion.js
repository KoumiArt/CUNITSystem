$(function(){
	getDiscussionMsgToMe();
	window.dis_msgToMe = setInterval("getDiscussionMsgToMe()", 2000);
});


/**
 * 获取我的聊天消息
 */
function getDiscussionMsgToMe(){
	$.post(basePath+"/chat/getDiscussionMsgToMe",null,function(data){
		var title = "";
		var userIds = "";
		$.each(data,function(i,item){
			title += item.student.sName + ",";
			userIds += item.userId + "_";
		});
		title = title.substring(0,title.length-1);
		userIds = userIds.substring(0,userIds.length-1);
		var spanStr = "";
		$.each(data,function(i,item){
			spanStr += "<a class='box' style='cursor: pointer' onclick=\"dis_createChat('"+item.disChatId+"','"+title+"','"+userIds+"')\">于\""+item.student.sName+"\"的讨论组</a><br/>";
		});
		var isExit = document.getElementById("dis_chat_id");
		if(isExit == undefined){
			clearInterval(dis_msgToMe);
			return;
		}
		$("#dis_chat_id").html("");
		$("#dis_chat_id").append(spanStr);
	});
}

function dis_createChat(disChatId,title,userIds){
	$("#disc").show();
	createChatWindow(title,userIds,title.split(","),disChatId);
	dis_getMsg(userIds,disChatId);
}

function dis_sendMsg(userIds,disChatId){
	var userIdArr = userIds.split("_");
	var sendMsgStr = $("textarea[id="+userIds+"]").val();
	$.post(basePath+"/chat/sendDiscussionMsg",$.param({"userIdArr":userIdArr,"message":sendMsgStr,"curDisChatId":disChatId},true),function(data){
		
	});
	$("textarea[id="+userIds+"]").val("");
	dis_getMsg(userIds,disChatId);
}

function dis_getMsg(userIds,disChatId){
	var userIdArr = userIds.split("_");
	$.post(basePath+"/chat/getDiscussionMsg",$.param({"userIdArr":userIdArr,"curDisChatId":disChatId},true),function(data){
		//设置聊天面板
		var spanStr = "";
		$.each(data,function(i,item){
			spanStr += "<span>"+item.ownerName+"&nbsp;&nbsp;"+item.timeStr+"</span><br/><span>"+item.message+"</span><br/>";
		});
		var isExit = document.getElementById("dis_chart_"+userIds);
		if(isExit == undefined){
			clearInterval(eval("interval_"+userIds));
			return;
		}
		$("#dis_chart_"+userIds).html("");
		$("#dis_chart_"+userIds).append(spanStr);
		$("#dis_chart_"+userIds).parent().scrollTop(document.getElementById("dis_chart_"+userIds).scrollHeight);
	});
}

function addFun(){
	showWindow({
		title:"创建讨论组",
		width:530,
		height:400,
		cache:false,
		href: basePath+"/jsp/client/onLineUser.jsp"
		//content:$("#disMain").html()
	});
	//$("#disMain").remove();
}

function addAlreadyUser(){
	var len = $("#MyPopWindow #alreadyUserId option").length;
	var obj = $("#MyPopWindow #alreadyUserId");
	var op = $("#MyPopWindow #onLineUserId").find("option:selected");
	for (var i = 0; i < len; i++) { 
		option_value = obj[0].options[i].value;
		if(op.val() == option_value){
			return;
		}
	} 
	
	$("#MyPopWindow #alreadyUserId").append(op.clone());
}
function removeAlreadyUser(){
	$("#MyPopWindow #alreadyUserId").find("option:selected").remove();
}
function addDiscussion(){
	var len = $("#MyPopWindow #alreadyUserId option").length;
	if(len<=0)
		return;
	var obj = $("#MyPopWindow #alreadyUserId");
	var userArr=[];
	var userIds = "";
	var title = "";
	for (var i = 0; i < len; i++) { 
		title += obj[0].options[i].text+",";
		userIds += obj[0].options[i].value+"_";
		userArr.push({"userName":obj[0].options[i].text,"userId":obj[0].options[i].value});
	} 
	title = title.substring(0,title.length-1);
	userIds = userIds.substring(0,userIds.length-1);
	
	closeWindow();
	$("#MyPopWindow #alreadyUserId option").remove();
	$("#disc").show();
	createChatWindow(title,userIds,title.split(","),'');
}

function createChatWindow(title,userIds,userNameArr,curDisChatId){
	title = "于\""+title+"\"的讨论组";
	if ($('#disc').tabs('exists', title)){
        $('#disc').tabs('select', title);
    } else {
		$('#disc').tabs('add',{
			title:title,
			closable:true,
			cache:false,
			content:"<div id='group_"+userIds+"' class='easyui-layout' data-options='fit:true'></div>"
		});
		$("#disc").tabs({
			onClose:function(title,index){
				clearInterval(eval("interval_"+userIds));
			}
		});
		$('#disc').tabs('select', title);
    }
	
	var spanStr = "";
	$.each(userNameArr,function(i,item){
		spanStr += "<a class='box' style='cursor: pointer' >"+item+"</a><br/>";
	});
    var optionsWest = {
		region: "west",
		width: 154,
		cache:false,
		content:spanStr
	};
	$("#group_"+userIds).layout('add', optionsWest);
    var optionsCenter = {
		region: "center",
		cache:false,
		content:"<div id='"+userIds+"' class='easyui-layout' data-options='fit:true' style='height:100%'></div>"
	};
	$("#group_"+userIds).layout('add', optionsCenter);
	var optionsCenter1 = {
		region: "center",
		content:"",
		cache:false,
		content:"<div id='dis_chart_"+userIds+"'></div>"
	};
	$("#"+userIds).layout('add', optionsCenter1);
	var optionsSouth1 = {
		region: "south",
		cache:false,
		height: 236,
		content:"<div style='float:left'><textarea id='"+userIds+"' rows='5' cols='81' style='height:196px'></textarea></div><div style='float:right;padding-top:15px;padding-right:15px;'><input type='button' onClick=\"dis_sendMsg('"+userIds+"','"+curDisChatId+"')\" style='width:150;height:170' value='发送'/></div>"
	};
	$("#"+userIds).layout('add', optionsSouth1);
	
	eval("window.interval_"+userIds+" ="+setInterval("dis_getMsg('"+userIds+"','"+curDisChatId+"')", 2000));
}