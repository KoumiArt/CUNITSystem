$(function($) {
	var con_exam_hidd_nwId = $("#con_exam_hidd_nwId").val();
	if(con_exam_hidd_nwId == undefined || con_exam_hidd_nwId == null || con_exam_hidd_nwId == "")
		con_exam_hidd_nwId = 0;
	var con_exam_hidd_examId = $("#con_exam_hidd_examId").val();
	if(con_exam_hidd_examId == undefined || con_exam_hidd_examId == null || con_exam_hidd_examId == "")
		con_exam_hidd_examId = 0;
	$('#conjunctionExamList').datagrid(
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
					url : basePath+"/manager/conjunctionQuestionList",
					idField : 'questionId', //主键字段
					queryParams: {"nwId":con_exam_hidd_nwId,"examId":con_exam_hidd_examId},
					pagination : true, //显示分页
					rownumbers : true, //显示行号
					columns : [ [ {
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
					toolbar : [{
						text : '新增关联试题',
						iconCls : 'icon-add',
						handler : function() {
							addConjunctionExam(con_exam_hidd_nwId,con_exam_hidd_examId);
						}
					}],
					onLoadSuccess : function() {
						$('#conjunctionExamList').datagrid('clearSelections'); //一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
					}
				});
});


//重新加载列表
function refreshConjunctionExam() {
	$('#conjunctionExamList').datagrid('reload');
}

function addConjunctionExam(nwId,examId){
	showMyDialog({
		title:"选择试题",
		width:680,
		height:460,
		fitColumns : true,
		maximizable:true,
		href:basePath+"/jsp/manager/examQuestionList.jsp?nwId="+nwId+"&examId="+examId,
		modal: true,
		buttons:[{
			text:'提交',
			handler:function(){
				addExamQuestion();
			}
		},{
			text:'取消',
			handler:function(){
				closeMyDialog();
			}
		}],
		onMaximize:function(){
			$("#examQuestionList").datagrid('resize',{height: 'auto',//高度
				width:'auto'});
		},
		onRestore:function (){
			$("#examQuestionList").datagrid('resize',{height: 'auto',//高度
				width:'auto'});
		}
	});
}