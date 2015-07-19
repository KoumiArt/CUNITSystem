$(function($) {
	var stuNet_hidd_nwId = $("#stuNet_hidd_nwId").val();
	if(stuNet_hidd_nwId == undefined || stuNet_hidd_nwId == null || stuNet_hidd_nwId == "")
		stuNet_hidd_nwId = 0;
	var stuNet_hidd_type = $("#stuNet_hidd_type").val();
	if(stuNet_hidd_type == undefined || stuNet_hidd_type == null || stuNet_hidd_type == "")
		stuNet_hidd_type = 2;
	$('#stuNetWorkCourseList').datagrid(
				{
					method : 'post',
					iconCls : 'icon-search', //图标
					singleSelect : true, //多选
					autoRowHeight:true,
					height: 'auto',//高度
					width: 'auto',
					fitColumns : true, //自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
					striped : true, //奇偶行颜色不同
					collapsible : true,//可折叠
					url : basePath+"/manager/stuNetWorkCourseList",
					idField : 'nwId', //主键字段
					queryParams: {"nwId":stuNet_hidd_nwId},
					pagination : true, //显示分页
					rownumbers : true, //显示行号
					columns : [ [ {
						field : 'sName',
						title : '学生名称',
						align : 'center',
						width : 300,
						formatter : function(value, rec) {
							return rec.userInfo.student.sName;
						}
					},
					{
						field : 'opt',
						title : '操作',
						width : 160,
						align : 'center',
						rowspan : 2,
						formatter : function(value, rec) {
							if(stuNet_hidd_type == 1)
								return '<input type="button" style="width:60px" onclick="studentExam(\''+rec.nwId+'\',\''+rec.userInfo.student.sId+'\',\''+rec.userInfo.student.sName+'\')" class="button_Csss" value="相关考试" />';
							else
								return '<input type="button" style="width:60px" onclick="seeHomeWork(\''+rec.nwId+'\',\''+rec.userInfo.userId+'\',\''+rec.netWorkCourse.courseName+'\',\''+rec.userInfo.student.sName+'\')" class="button_Csss" value="查看作业" />';
						}
					} ] ],
					onLoadSuccess : function() {
						$('#stuNetWorkCourseList').datagrid('clearSelections'); //一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
					}
				});
	
	$("#searchStuNetWorkCourseId").click(function(){
		var params = $('#stuNetWorkCourseList').datagrid('options').queryParams; //先取得 datagrid 的查询参数
		var fields = $('#searchStuNetWorkCourseFormId').serializeArray(); //自动序列化表单元素为JSON对象
		$.each(fields, function(i, field) {
			params[field.name] = field.value; //设置查询参数
		});
		refreshStuNetWorkCourseList();
	});
});

//重新加载列表
function refreshStuNetWorkCourseList() {
	$('#stuNetWorkCourseList').datagrid('reload');
}

function seeHomeWork(nwId,userId,courseName,userName){
	showMyDialog({
		title:"'"+userName+"'的作业",
		width:480,
		height:380,
		fitColumns : true,
		maximizable:true,
		href:basePath+"/client/seeHomeWork?nwId="+nwId+"&userId="+userId,
		modal: true,
		buttons:[{
			text:'批阅',
			handler:function(){
				//检查是否批阅过
				$.post(basePath+"/client/checkHomeWorkComment",{"nwId":nwId,"stuId":userId},function(data){
					if(data){
						$.messager.alert("操作提示","此学生作业已经批阅过！","error");
					} else {
						$("#py_id").dialog({
							title:"批阅",
							width:380,
							height:200,
							modal: true,
							content:"<center style='padding-top:18%'>批阅：<select id='isEligible'><option value='1'>合格</option><option value='2'>不合格</option></select></center>",
							buttons:[{
								text:'提交',
								handler:function(){
									homeWorkComment(nwId,userId);
								}
							},{
								text:'取消',
								handler:function(){
									$("#py_id").dialog('close');
								}
							}]
						});
					}
				});
			}
		},{
			text:'取消',
			handler:function(){
				closeMyDialog();
			}
		}]
	});
}

function homeWorkComment(nwId,stuId){
	var isEligible = $("#isEligible").val();
	$.post(basePath+"/client/submitHomeWorkComment",{"nwId":nwId,"stuId":stuId,"isEligible":isEligible},function(data){
		if(data){
			$("#py_id").dialog('close');
			closeMyDialog();
			$.messager.show({
				title:"操作提示",
				msg:"提交成功！",
				timeout:5000,
				showType:"slide"
			});
		} else {
			$.messager.alert("操作提示","提交失败！","error");
		}
	});
}

function studentExam(nwId,sId,sName){
	showMyDialog({
		title:"学生'"+sName+"'的考试列表",
		width:680,
		height:400,
		fitColumns : true,
		maximizable:true,
		href:basePath+"/jsp/manager/sumResultList.jsp?sId="+sId+"&nwId="+nwId,
		onMaximize:function(){
			$("#sumResultList").datagrid('resize',{height: 'auto',//高度
				width:'auto'});
		},
		onRestore:function (){
			$("#sumResultList").datagrid('resize',{height: 'auto',//高度
				width:'auto'});
		}
	});
}
