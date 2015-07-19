/**
 * userRole 1 管理员  2 学生 3 老师
 * 
 */

$(function($) {
	$('#resourceList').datagrid(
				{
					method : 'post',
					iconCls : 'icon-search', //图标
					singleSelect : false, //多选
					autoRowHeight:true,
					height: 460,//高度
					fitColumns : true, //自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
					striped : true, //奇偶行颜色不同
					collapsible : true,//可折叠
					url : basePath+"/manager/resourceList",
					idField : 'resourceId', //主键字段
					pagination : true, //显示分页
					rownumbers : true, //显示行号
					loadFilter :function(data){
						$.each(data.rows,function(i,item){
							if(userRole == 1)
								item.resourcePath = "/resourceFile/"+item.resourcePath;
						});
						return data;
					},
					columns : [ [ {
						field : 'resourceId',
						checkbox : true
					}, {
						field : 'resourceName',
						title : '资源名称',
						align : 'center',
						width : 100
					}, {
						field : 'courseName',
						title : '所属课程',
						align : 'center',
						width : 100
					}, {
						field : 'resourceType',
						title : '资源类型',
						align : 'center',
						width : 100,
						formatter : function(value, rec) {
							var resourceTypeStr = "";
							switch (rec.resourceType) {
								case "1":
									resourceTypeStr = "音频";
									break;
								case "2":
									resourceTypeStr = "教学素材";
									break;
								case "3":
									resourceTypeStr = "教学课件";
									break;
								case "4":
									resourceTypeStr = "文献资料";
									break;
								case "5":
									resourceTypeStr = "视频";
									break;
							}
							return resourceTypeStr;
						}
					}, {
						field : 'resourcePath',
						title : '资源路径',
						align : 'center',
						width : 100
					}, {
						field : 'createTimeStr',
						title : '创建时间',
						align : 'center',
						width : 100
					} ,
					{
						field : 'opt',
						title : '操作',
						width : 100,
						align : 'center',
						rowspan : 2,
						formatter : function(value, rec) {
							var retrunStr = "";
							if(rec.resourceType == 5)
								retrunStr += '<input type="button" onclick="palyVideo(\''+rec.resourcePath+'\');" class="button_Csss" value="播放" /> ';
							//if(rec.resourceType == 1)
							//	retrunStr += '<input type="button" onclick="palyAudio(\''+rec.resourcePath+'\');" class="button_Csss" value="播放" /> ';
							if(userRole == 1)
								retrunStr = '<input type="button" onclick="editResource('+rec.resourceId+')" class="button_Csss" value="修改" /> <input type="button" onclick="removeResource('+rec.resourceId+')" class="button_Csss" value="删除" /> ';
							retrunStr += '<input type="button" onclick="downLoadResource('+rec.resourceId+')" class="button_Csss" value="下载" />';
							return retrunStr;
						}
					} ] ],
					onLoadSuccess : function() {
						$('#resourceList').datagrid('clearSelections'); //一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
					}
				});
	//管理员添加工具栏
	if(userRole == 1){
		$('#resourceList').datagrid(
					{
						toolbar :[ {
							text : '新增',
							iconCls : 'icon-add',
							handler : function() {
								editResource();
							}
						},{
							text : '批量删除',
							iconCls : 'icon-remove',
							handler : function() {
								batchRemoveResource();
							}
						}]
					});
	} else {
		//如果是学生  隐藏创建时间列
		if(userRole == 2){
			$('#resourceList').datagrid("hideColumn","createTimeStr");
			$('#resourceList').datagrid("hideColumn","resourcePath");
		}
		$('#resourceList').datagrid("hideColumn","resourceId");
	}

	$("#searchResourceId").click(function(){
		var params = $('#resourceList').datagrid('options').queryParams; //先取得 datagrid 的查询参数
		var fields = $('#searchResourceFormId').serializeArray(); //自动序列化表单元素为JSON对象
		$.each(fields, function(i, field) {
			params[field.name] = field.value; //设置查询参数
		});
		refreshResourceList();
	});
});

function tools(){
	return [ {
		text : '新增',
		iconCls : 'icon-add',
		handler : function() {
			editResource();
		}
	},{
		text : '批量删除',
		iconCls : 'icon-remove',
		handler : function() {
			batchRemoveResource();
		}
	}];
}


/*function(){
	var tools = new Array();
	if(userRole == 1)
		tools = [ {
				text : '新增',
				iconCls : 'icon-add',
				handler : function() {
					editResource();
				}
			},{
				text : '批量删除',
				iconCls : 'icon-remove',
				handler : function() {
					batchRemoveResource();
				}
			}];
	return tools;
}*/

//重新加载列表
function refreshResourceList() {
	$('#resourceList').datagrid('reload');
}


function editResource(resourceId){
	var url = basePath+'/jsp/manager/editResource.jsp';
	var title = "新增资源";
	if(resourceId!=undefined && resourceId !=null && resourceId !=""){
		url = url + "?resourceId="+resourceId;
		title = "修改资源";
	}
	showWindow({
			title:title,
			href:url,
			width:530,
			height:350
		});
}

function removeResource(resourceId){
	$.messager.confirm('操作提示', '是否要删除该信息？', function(r){
		if(r){
			$.post(window.parent.basePath+"/manager/deleteResource",{"resourceId":resourceId},function(data){
				if(data){
					//$.messager.alert("操作提示","删除成功！","info");
					$.messager.show({
						title:"操作提示",
						msg:"删除成功！",
						timeout:5000,
						showType:"slide"
					});
					refreshResourceList();
				} else {
					$.messager.alert("操作提示","删除失败！","error");
				}
			});
		}
	});
}


function batchRemoveResource(){
	$.messager.confirm('操作提示', '是否要删除该信息？', function(r){
		if(r){
			var rows = $('#resourceList').datagrid('getSelections');
			if (rows.length == 0) {
				$.messager.alert('提示', "请选择你要删除的音频视频！", 'info');
				return;
			}
			var resourceArr = [];
			$.each(rows, function(i, n) {
				resourceArr.push(n.resourceId);
			});
			$.post(window.parent.basePath+"/manager/batchDeleteResource",$.param({"resourceArr":resourceArr},true),function(data){
				if(data){
					//$.messager.alert("操作提示","删除成功！","info");
					$.messager.show({
						title:"操作提示",
						msg:"删除成功！",
						timeout:5000,
						showType:"slide"
					});
					refreshResourceList();
				} else {
					$.messager.alert("操作提示","删除失败！","error");
				}
			});
		}
	});
}

function downLoadResource(resourceId){
	//location.href = basePath+'/manager/downLoadResource?resourceId='+resourceId;
	$.post(window.parent.basePath+"/manager/checkResourceFileExit",{"resourceId":resourceId},function(data){
		if(data){
			$(document.body).find("#downLoadIframe").remove();
			$(document.body).append('<iframe id="downLoadIframe" style="display:none" frameborder="0" width="100%" height="100%" src="'+basePath+'/manager/downLoadResource?resourceId='+resourceId+'"></iframe>');
		} else {
			showWindow({
				title : "错误页面",
				href :  basePath + "/jsp/errors/noFile.jsp",
				width:530,
				height:350
			});
		}
	});
}

function palyVideo(path){
	path = encodeURI(encodeURI(path));
	showWindow({
		title : "视频播放器",
		href :  basePath + "/jsp/manager/videoPlay.jsp?path="+path,
		width:750,
		height:480,
		shadow:false,
		modal:false,
		onClose:function(){
			//销毁window
			var video = document.getElementById("example_video_1");
			if(video != undefined && video !=null){
				video.pause();
			}
		}
	});
}

function palyAudio(path){
	/*path = encodeURI(encodeURI(path));
	showWindow({
		title : "音频播放器",
		href :  basePath + "/jsp/manager/audioPlay.jsp?path="+path,
		width:650,
		height:180,
		shadow:false,
		modal:false
	});*/
}
