$(function($) {
	var result_hidd_examId = $("#result_hidd_examId").val();
	if(result_hidd_examId == undefined || result_hidd_examId == null || result_hidd_examId == "")
		result_hidd_examId = 0;
	var result_hidd_nwId = $("#result_hidd_nwId").val();
	if(result_hidd_nwId == undefined || result_hidd_nwId == null || result_hidd_nwId == "")
		result_hidd_nwId = 0;
	$('#examResultList').datagrid(
				{
					method : 'post',
					iconCls : 'icon-search', //图标
					singleSelect : false, //多选
					autoRowHeight:true,
					height: 'auto',//高度
					width:'auto',
					fitColumns : true, //自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
					striped : true, //奇偶行颜色不同
					collapsible : true,//可折叠
					url : basePath+"/manager/getExamResult",
					queryParams: {"examId":result_hidd_examId,"nwId":result_hidd_nwId},
					pagination : true, //显示分页
					rownumbers : true, //显示行号
					pagination : false,
					columns : [ [{
						field : 'stuName',
						title : '学生名称',
						align : 'center',
						width : 200
					} ,{
						field : 'totalScore',
						title : '考试分数',
						align : 'center',
						width : 150
					}] ],
					onLoadSuccess : function(data) {
						$('#examResultList').datagrid('clearSelections'); //一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
					}
				});
});

//重新加载列表
function refreshExamQuestion() {
	$('#examResultList').datagrid('reload');
}
