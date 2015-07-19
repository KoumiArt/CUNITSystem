$(function($) {
	$('#subjectList').datagrid(
				{
					method : 'post',
					iconCls : 'icon-search', //图标
					singleSelect : false, //多选
					autoRowHeight:true,
					height: 460,//高度
					//width: 1000,
					fitColumns : true, //自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
					striped : true, //奇偶行颜色不同
					collapsible : true,//可折叠
					url : basePath+"/manager/subjectList",
					
					idField : 'subjectId', //主键字段
					pagination : true, //显示分页
					rownumbers : true, //显示行号
					columns : [ [ {
						field : 'subjectId',
						checkbox : true
					}, {
						field : 'subjectName',
						title : '科目名',
						align : 'center',
						width : 200
					}, {
						field : 'createTimeStr',
						title : '创建时间',
						align : 'center',
						width : 100
					},
					{
						field : 'opt',
						title : '操作',
						width : 400,
						align : 'center',
						rowspan : 2,
						formatter : function(value, rec) {
							return '<input type="button" onclick="subjectEdit('+rec.subjectId+')" class="button_Csss" value="修改" /> <input type="button" onclick="removeSubject('+rec.subjectId+')" class="button_Csss" value="删除" />';
						}
					} ] ],
					toolbar : [ {
						text : '新增',
						iconCls : 'icon-add',
						handler : function() {
							subjectEdit();
						}
					},{
						text : '批量删除',
						iconCls : 'icon-remove',
						handler : function() {
							batchRemoveSubject();
						}
					}],
					onLoadSuccess : function() {
						$('#subjectList').datagrid('clearSelections'); //一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
					}
				});
	
	$("#searchSubjectId").click(function(){
		var params = $('#subjectList').datagrid('options').queryParams; //先取得 datagrid 的查询参数
		var fields = $('#searchSubjectFormId').serializeArray(); //自动序列化表单元素为JSON对象
		$.each(fields, function(i, field) {
			params[field.name] = field.value; //设置查询参数
		});
		refreshSubjectList();
	});
});

//重新加载列表
function refreshSubjectList() {
	$('#subjectList').datagrid('reload');
}


function subjectEdit(subjectId){
	var url = basePath+'/jsp/manager/editSubject.jsp';
	var title = "新增学生信息";
	if(subjectId!=undefined && subjectId !=null && subjectId !=""){
		url = url + "?subjectId="+subjectId;
		title = "修改学生信息";
	}
	showWindow({
			title:title,
			href:url,
			width:530,
			height:350,
			onLoad:function(){
				if(subjectId!=null&&subjectId!=""&&subjectId!=undefined){
					$.post(basePath+"/manager/getSubject",{"subjectId":subjectId},function(data){
						$("#subjectForm input[name=subjectName]").val(data.subjectName);
						$("#subjectForm").append("<input type='hidden' name='subjectId' value='"+subjectId+"'/>");
					});
				}
			}
		});
}

function removeSubject(subjectId){
	$.messager.confirm('操作提示', '是否要删除该信息？', function(r){
		if(r){
			$.post(basePath+"/manager/deleteSubject",{"subjectId":subjectId},function(data){
				if(data){
					//$.messager.alert("操作提示","删除成功！","info");
					$.messager.show({
						title:"操作提示",
						msg:"删除成功！",
						timeout:5000,
						showType:"slide"
					});
					refreshSubjectList();
				} else {
					$.messager.alert("操作提示","删除失败！","error");
				}
			});
		}
	});
}


function batchRemoveSubject(){
	$.messager.confirm('操作提示', '是否要删除该信息？', function(r){
		if(r){
			var rows = $('#subjectList').datagrid('getSelections');
			if (rows.length == 0) {
				$.messager.alert('提示', "请选择你要删除的学生！", 'info');
				return;
			}
			var subjectArr = [];
			$.each(rows, function(i, n) {
				subjectArr.push(n.subjectId);
			});
			$.post(window.parent.basePath+"/manager/batchDeleteSubject",$.param({"subjectArr":subjectArr},true),function(data){
				if(data){
					//$.messager.alert("操作提示","删除成功！","info");
					$.messager.show({
						title:"操作提示",
						msg:"删除成功！",
						timeout:5000,
						showType:"slide"
					});
					refreshSubjectList();
				} else {
					$.messager.alert("操作提示","删除失败！","error");
				}
			});
		}
	});
}
