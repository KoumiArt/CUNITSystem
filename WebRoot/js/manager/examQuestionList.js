$(function($) {
	var exam_hidd_nwId = $("#exam_hidd_nwId").val();
	if(exam_hidd_nwId == undefined || exam_hidd_nwId == null || exam_hidd_nwId == "")
		exam_hidd_nwId = 0;
	$('#examQuestionList').datagrid(
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
					url : basePath+"/manager/questionList",
					idField : 'questionId', //主键字段
					queryParams: {"netWorkCourse.nwId":exam_hidd_nwId},
					pagination : true, //显示分页
					rownumbers : true, //显示行号
					columns : [ [ {
						field : 'questionId',
						checkbox : true
					},{
						field : 'content',
						title : '题目',
						align : 'center',
						width : 200
					} ,{
						field : 'netWorkCourse',
						title : '课程名称',
						align : 'center',
						width : 150,
						formatter : function(value, rec) {
							return rec.netWorkCourse.courseName;
						}
					},{
						field : 'createTimeStr',
						title : '创建时间',
						align : 'center',
						width : 200
					}, {
						field : 'score',
						title : '分数',
						align : 'center',
						width : 80
					}] ],
					onLoadSuccess : function(data) {
						$('#examQuestionList').datagrid('clearSelections'); //一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
					}
				});
});


function addExamQuestion(){
	var exam_hidd_examId = $("#exam_hidd_examId").val();
	if(exam_hidd_examId == undefined || exam_hidd_examId == null || exam_hidd_examId == "")
		exam_hidd_examId = 0;
	var exam_hidd_nwId = $("#exam_hidd_nwId").val();
	if(exam_hidd_nwId == undefined || exam_hidd_nwId == null || exam_hidd_nwId == "")
		exam_hidd_nwId = 0;
	var rows = $('#examQuestionList').datagrid('getSelections');
	if (rows.length == 0) {
		$.messager.alert('提示', "请选择关联的题目！", 'info');
		return;
	}
	var examQuestionArr = [];
	$.each(rows, function(i, n) {
		examQuestionArr.push(n.questionId);
	});
	$.post(window.parent.basePath+"/manager/addExamQuestion",$.param({"examId":exam_hidd_examId,"nwId":exam_hidd_nwId,"examQuestionArr":examQuestionArr},true),function(data){
		if(data){
			$.messager.show({
				title:"操作提示",
				msg:"提交成功！",
				timeout:5000,
				showType:"slide"
			});
			closeMyDialog();
			refreshConjunctionExam();
		} else {
			$.messager.alert("操作提示","提交失败！","error");
		}
	});
}

//重新加载列表
function refreshExamQuestion() {
	$('#examQuestionList').datagrid('reload');
}
