$(function($) {
	var result_hidd_stuId = $("#result_hidd_stuId").val();
	if(result_hidd_stuId == undefined || result_hidd_stuId == null || result_hidd_stuId == "")
		result_hidd_stuId = 0;
	var result_hidd_nwId = $("#result_hidd_nwId").val();
	if(result_hidd_nwId == undefined || result_hidd_nwId == null || result_hidd_nwId == "")
		result_hidd_nwId = 0;
	$('#sumResultList').datagrid(
				{
					method : 'post',
					iconCls : 'icon-search', //图标
					singleSelect : false, //多选
					autoRowHeight:true,
					height: 'auto',//高度
					fitColumns : true, //自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
					striped : true, //奇偶行颜色不同
					collapsible : true,//可折叠
					url : basePath+"/manager/stuExamList",
					idField : 'examId', //主键字段
					queryParams: {"stuId":result_hidd_stuId,"nwId":result_hidd_nwId},
					columns : [ [ {
						field : 'CourseName',
						title : '课程名称',
						align : 'center',
						width : 280
					}, {
						field : 'tName', 
						title : '授课教师',
						align : 'center',
						width : 280
					}, {
						field : 'examName',
						title : '考试名称',
						align : 'center',
						width : 280
					}, {
						field : 'endDate',
						title : '结束日期',
						align : 'center',
						width : 300
					}, {
						field : 'score',
						title : '分数',
						align : 'center',
						width : 300
					} ] ],
					onLoadSuccess : function() {
						$('#sumResultList').datagrid('clearSelections'); //一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
					}
				});
});

//重新加载列表
function refreshExamList() {
	$('#sumResultList').datagrid('reload');
}
