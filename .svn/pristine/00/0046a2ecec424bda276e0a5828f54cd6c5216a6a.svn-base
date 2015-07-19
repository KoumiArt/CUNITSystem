$(function() {
	var homew_hidd_nwId = $("#homew_hidd_nwId").val();
	if(homew_hidd_nwId == undefined || homew_hidd_nwId == null || homew_hidd_nwId == "")
		homew_hidd_nwId = 0;
	$('#homeWorkLogList').datagrid(
				{
					method : 'post',
					iconCls : 'icon-search', //图标
					singleSelect : false, //多选
					autoRowHeight:true,
					height: 500,//高度
					width:'auto',
					fitColumns : true, //自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
					striped : true, //奇偶行颜色不同
					collapsible : true,//可折叠
					url : basePath+"/client/getHomeWorkLogs",
					idField : 'hwLogId', //主键字段
					queryParams: {"nwId":homew_hidd_nwId},
					pagination : true, //显示分页
					rownumbers : true, //显示行号
					columns : [ [{
						field : 'subTimeStr',
						title : '提交时间',
						align : 'center',
						width : 200
					},{
						field : 'msg',
						title : '',
						align : 'center',
						width : 200,
						hidden : true
					} ] ],
					onLoadSuccess : function(data) {
						if(data.total <=0){
							$('#homeWorkLogList').datagrid("hideColumn","subTimeStr");
							$('#homeWorkLogList').datagrid("showColumn","msg");
							$('#homeWorkLogList').datagrid('appendRow',{
								msg: '<span style="color:red">没有作业记录</span>'
							});
						} else {
							$('#homeWorkLogList').datagrid("hideColumn","msg");
						}
						$('#homeWorkLogList').datagrid('clearSelections'); //一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
					}
				});
	
});

//重新加载列表
function refreshHomeWorkLog() {
	$('#homeWorkLogList').datagrid('reload');
}

