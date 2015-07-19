$(function($) {
	$('#examList').datagrid(
				{
					method : 'post',
					iconCls : 'icon-search', //图标
					singleSelect : true, //多选
					autoRowHeight:true,
					height: 'auto',//高度
					width:'100%',
					fitColumns : true, //自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
					striped : true, //奇偶行颜色不同
					collapsible : true,//可折叠
					url : basePath+"/manager/examList",
					idField : 'examId', //主键字段
					pagination : true, //显示分页
					rownumbers : true, //显示行号
					columns : [ [  {
						field : 'examId',
						styler : function(value, row,index) {
							if(row.invalid == false){
								this.checkbox = false;
							}
						},
						formatter : function(value, rec) {
							if(rec.invalid == false){
								return '&nbsp&nbsp&nbsp';
							}
						},
						checkbox : true
					},{
						field : 'examName',
						title : '考试名称',
						align : 'center',
						width : 280
					},{
						field : 'courseName',
						title : '课程名称',
						align : 'center',
						width : 280,
						formatter : function(value, rec) {
							return rec.netWorkCourse.courseName;
						}
					}, {
						field : 'endDateStr',
						title : '结束日期',
						align : 'center',
						width : 300
					}, {
						field : 'invalid',
						title : '状态',
						align : 'center',
						width : 300,
						formatter : function(value, rec) {
							if(rec.invalid == false){
								return '已失效';
							}
							return '未失效';
						}
					},{
						field : 'opt',
						title : '操作',
						align : 'center',
						width : 300,
						formatter : function(value, rec) {
							var returnBtnStr = "";
							if(rec.invalid == false){
								returnBtnStr = ' <input type="button" onclick="showExamResult(\''+rec.examId+'\',\''+rec.netWorkCourse.nwId+'\')" class="button_Csss" style="width:55px" value="考试结果"/>';
							} else {
								returnBtnStr = '<input type="button" onclick="examEdit(\''+rec.examId+'\')" class="button_Csss" style="width:55px" value="修改考试"/> '+
								   '<input type="button" onclick="removeExam(\''+rec.examId+'\')" class="button_Csss" style="width:55px" value="删除考试"/> '+
								   '<input type="button" onclick="conjunctionExam(\''+rec.examId+'\',\''+rec.netWorkCourse.nwId+'\')"  class="button_Csss" style="width:55px" value="关联试题"/>';
							}
							return returnBtnStr;
						}
					} ] ],
					toolbar : [ {
						text : '新增考试',
						iconCls : 'icon-add',
						handler : function() {
							examEdit();
						}
					},{
						text : '批量删除',
						iconCls : 'icon-remove',
						handler : function() {
							batchRemoveExam();
						}
					}],
					onLoadSuccess : function() {
						$('#examList').datagrid('clearSelections'); //一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
					}
				});
});

//重新加载列表
function refreshExamList() {
	$('#examList').datagrid('reload');
}

function examEdit(examId){
	var url = basePath+'/jsp/manager/editExam.jsp';
	var title = "新增考试";
	if(examId!=undefined && examId !=null && examId !=""){
		url = url + "?examId="+examId;
		title = "修改考试";
	}
	showWindow({
			title:title,
			href:url,
			width:530,
			height:350,
			onLoad:function(){
				if(examId!=null&&examId!=""&&examId!=undefined){
					$.post(basePath+"/manager/getExam",{"examId":examId},function(data){
						$("#examForm input[name='netWorkCourse.nwId']").combobox({   
						    url:basePath+"/manager/netWorkCourseCmbList",
						    valueField:'nwId',   
						    textField:'courseName',
						    editable : false  ,
						    onLoadSuccess : function(){
						    	$(this).combobox('setValue', data.netWorkCourse.nwId);
						    }
						}); 
						$("#examForm input[name=examName]").val(data.examName);
						$("#examForm input[name=endDate]").val(data.endDateStr);
						$("#examForm").append("<input type='hidden' name='examId' value='"+examId+"'/>");
					});
				} else {
					$("#examForm input[name='netWorkCourse.nwId']").combobox({   
					    url:basePath+"/manager/netWorkCourseCmbList",
					    valueField:'nwId',   
					    textField:'courseName',
					    editable : false 
					}); 
				}
			}
		});
}

function removeExam(examId){
	$.messager.confirm('操作提示', '是否要删除该信息？', function(r){
		if(r){
			$.post(basePath+"/manager/deleteExam",{"examId":examId},function(data){
				if(data){
					$.messager.show({
						title:"操作提示",
						msg:"删除成功！",
						timeout:5000,
						showType:"slide"
					});
					refreshExamList();
				} else {
					$.messager.alert("操作提示","删除失败！","error");
				}
			});
		}
	});
}


function batchRemoveExam(){
	$.messager.confirm('操作提示', '是否要删除该信息？', function(r){
		if(r){
			var rows = $('#examList').datagrid('getSelections');
			if (rows.length == 0) {
				$.messager.alert('提示', "请选择你要删除的试卷！", 'info');
				return;
			}
			var examArr = [];
			$.each(rows, function(i, n) {
				examArr.push(n.examId);
			});
			$.post(window.parent.basePath+"/manager/batchDeleteExam",$.param({"examArr":examArr},true),function(data){
				if(data){
					$.messager.show({
						title:"操作提示",
						msg:"批量删除成功！",
						timeout:5000,
						showType:"slide"
					});
					refreshExamList();
				} else {
					$.messager.alert("操作提示","删除失败！","error");
				}
			});
		}
	});
}

/**
 * 关联试题
 * @param nwId
 */
function conjunctionExam(examId,nwId){
	showWindow({
		title:"关联的试题",
		width:680,
		height:460,
		fitColumns : true,
		maximizable:true,
		href:basePath+"/jsp/manager/conjunctionExam.jsp?nwId="+nwId+"&examId="+examId,
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

function showExamResult(examId,nwId){
	showWindow({
		title:"考试结果",
		width:680,
		height:460,
		fitColumns : true,
		maximizable:true,
		href:basePath+"/jsp/manager/examResultList.jsp?examId="+examId+"&nwId="+nwId,
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
