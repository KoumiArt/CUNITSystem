/**
 * userRole 1 管理员  2 学生 3 老师
 * 
 */

$(function($) {
	var result_hidd_nwId = $("#result_hidd_nwId").val();
	if(result_hidd_nwId == undefined || result_hidd_nwId == null || result_hidd_nwId == "")
		result_hidd_nwId = 0;
	$('#teacherResourceList').datagrid(
				{
					method : 'post',
					iconCls : 'icon-search', //图标
					singleSelect : false, //多选
					autoRowHeight:true,
					height: 'auto',//高度
					fitColumns : true, //自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
					striped : true, //奇偶行颜色不同
					collapsible : true,//可折叠
					url : basePath+"/manager/teacherResourceList",
					queryParams: {"nwId":result_hidd_nwId},
					idField : 'resourceId', //主键字段
					loadFilter :function(data){
						$.each(data.rows,function(i,item){
							if(userRole == 1)
								item.resourcePath = "/resourceFile/"+item.resourcePath;
						});
						return data;
					},
					columns : [ [ {
						field : 'resourceName',
						title : '资源名称',
						align : 'center',
						width : 100
					}, {
						field : 'resourceType',
						title : '资源类型',
						align : 'center',
						width : 45,
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
					} ,{
						field : 'opt',
						title : '操作',
						width : 78,
						align : 'center',
						rowspan : 2,
						formatter : function(value, rec) {
							var returnStr = "";
							if(rec.resourceType == 5)
								returnStr += '<input type="button" onclick="palyVideo(\''+rec.resourcePath+'\');" class="button_Csss" value="播放" /> ';
							returnStr += '<input type="button" onclick="downLoadResource('+rec.resourceId+')" class="button_Csss" value="下载" />';
							return returnStr;
						}
					}] ],
					onLoadSuccess : function() {
						$('#resourceList').datagrid('clearSelections'); //一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
					}
				});
	
});


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