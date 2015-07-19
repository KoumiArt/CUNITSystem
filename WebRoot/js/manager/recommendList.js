$(function($) {
	$('#recommendList').datagrid(
				{
					method : 'post',
					iconCls : 'icon-search', //图标
					singleSelect : false, //多选
					autoRowHeight:true,
					height: 460,//高度
					fitColumns : true, //自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
					striped : true, //奇偶行颜色不同
					collapsible : true,//可折叠
					url : basePath+"/manager/recommendList",
					idField : 'recId', //主键字段
					pagination : true, //显示分页
					rownumbers : true, //显示行号
					loadFilter :function(data){
						$.each(data.rows,function(i,item){
							if(userRole == 1)
								if(item.path!=null)
									item.path = "/recommendFile/"+item.path;
						});
						return data;
					},
					columns : [ [ {
						field : 'recId',
						checkbox : true
					}, {
						field : 'content',
						title : '推荐内容',
						align : 'center',
						width : 300
					}, {
						field : 'recType',
						title : '推荐类型',
						align : 'center',
						width : 50,
						formatter : function(value, rec) {
							var recTypeStr = "";
							switch (rec.recType) {
								case "1":
									recTypeStr = "教学材料";
									break;
								case "2":
									recTypeStr = "教学课程";
									break;
								case "3":
									recTypeStr = "教学方法";
									break;
								case "4":
									recTypeStr = "教学目标";
									break;
							}
							return recTypeStr;
						}
					},{
						field : 'path',
						title : '资源路径',
						align : 'center',
						width : 130
					}, {
						field : 'createTimeStr',
						title : '创建时间',
						align : 'center',
						width : 100
					} ,{
						field : 'updateTimeStr',
						title : '修改时间',
						align : 'center',
						width : 100
					} ,{
						field : 'opt',
						title : '操作',
						width : 130,
						align : 'center',
						rowspan : 2,
						formatter : function(value, rec) {
							var returnStr = "";
							if(userRole == 1)
								returnStr =  '<input type="button" onclick="editRecommend('+rec.recId+')" class="button_Csss" value="修改" /> <input type="button" onclick="removeRecommend('+rec.recId+')" class="button_Csss" value="删除" />';
							else
								returnStr =  '<input type="button" onclick="editRecommend('+rec.recId+')" class="button_Csss" value="修改" />';
							if(rec.path != undefined && rec.path !=null)
								returnStr += " <input type='button' value='下载资源'  class='button_Csss' style='width:65px' onclick='downLoadRecommend(\""+rec.recId+"\")'/>";
							return returnStr;
						}
					} ] ],
					onLoadSuccess : function() {
						$('#recommendList').datagrid('clearSelections'); //一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
					}
				});
	
	//管理员添加工具栏
	if(userRole == 1){
		$('#recommendList').datagrid(
					{
						toolbar : [ {
							text : '新增',
							iconCls : 'icon-add',
							handler : function() {
								editRecommend();
							}
						},{
							text : '批量删除',
							iconCls : 'icon-remove',
							handler : function() {
								batchRemoveRecommend();
							}
						}]
					});
	} else {
		//如果是老师  隐藏创建时间列
		if(userRole == 3){
			$('#recommendList').datagrid("hideColumn","createTimeStr");
			$('#recommendList').datagrid("hideColumn","path");
		}
		$('#recommendList').datagrid("hideColumn","recId");
	}
	
	$("#searchRecommendId").click(function(){
		var params = $('#recommendList').datagrid('options').queryParams; //先取得 datagrid 的查询参数
		var fields = $('#searchRecommendFormId').serializeArray(); //自动序列化表单元素为JSON对象
		$.each(fields, function(i, field) {
			params[field.name] = field.value; //设置查询参数
		});
		refreshRecommendList();
	});
});

//重新加载列表
function refreshRecommendList() {
	$('#recommendList').datagrid('reload');
}


function editRecommend(recId){
	var url = basePath+'/jsp/manager/editRecommend.jsp';
	var title = "新增推荐";
	if(recId!=undefined && recId !=null && recId !=""){
		url = url + "?recId="+recId;
		title = "修改推荐";
	}
	showWindow({
			title:title,
			href:url,
			width:530,
			height:350
		});
}

function removeRecommend(recId){
	$.messager.confirm('操作提示', '是否要删除该信息？', function(r){
		if(r){
			$.post(window.parent.basePath+"/manager/deleteRecommend",{"recId":recId},function(data){
				if(data){
					//$.messager.alert("操作提示","删除成功！","info");
					$.messager.show({
						title:"操作提示",
						msg:"删除成功！",
						timeout:5000,
						showType:"slide"
					});
					refreshRecommendList();
				} else {
					$.messager.alert("操作提示","删除失败！","error");
				}
			});
		}
	});
}


function batchRemoveRecommend(){
	$.messager.confirm('操作提示', '是否要删除该信息？', function(r){
		if(r){
			var rows = $('#recommendList').datagrid('getSelections');
			if (rows.length == 0) {
				$.messager.alert('提示', "请选择你要删除的音频视频！", 'info');
				return;
			}
			var recommendArr = [];
			$.each(rows, function(i, n) {
				recommendArr.push(n.recId);
			});
			$.post(window.parent.basePath+"/manager/batchDeleteRecommend",$.param({"recommendArr":recommendArr},true),function(data){
				if(data){
					//$.messager.alert("操作提示","删除成功！","info");
					$.messager.show({
						title:"操作提示",
						msg:"删除成功！",
						timeout:5000,
						showType:"slide"
					});
					refreshRecommendList();
				} else {
					$.messager.alert("操作提示","删除失败！","error");
				}
			});
		}
	});
}

function downLoadRecommend(recId){
	$.post(basePath+"/manager/checkRecommendFileExit",{"recId":recId},function(data){
		if(data){
			$(document.body).find("#rec_downLoadIframe").remove();
			$(document.body).append('<iframe id="rec_downLoadIframe" style="display:none" frameborder="0" width="100%" height="100%" src="'+basePath+'/manager/downLoadRecommend?recId='+recId+'"></iframe>');
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
