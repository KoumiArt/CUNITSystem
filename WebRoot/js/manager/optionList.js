$(function($) {
	var questionId = $("#option_hidden input[name=questionId]").val();
	$('#optionList').datagrid(
				{
					method : 'post',
					iconCls : 'icon-search', //图标
					singleSelect : false, //多选
					autoRowHeight:true,
					height: 460,//高度
					fitColumns : true, //自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
					striped : true, //奇偶行颜色不同
					collapsible : true,//可折叠
					url : basePath+"/manager/optionList",
					idField : 'optionId', //主键字段
					pagination : true, //显示分页
					rownumbers : true, //显示行号
					queryParams: {"question.questionId":questionId},
					columns : [ [ {
						field : 'optionId',
						checkbox : true
					}, {
						field : 'oName',
						title : '名称',
						align : 'center',
						width : 300
					}, {
						field : 'content',
						title : '内容',
						align : 'center',
						width : 300
					}, {
						field : 'question',
						title : '所属试题',
						align : 'center',
						width : 300,
						formatter : function(value, rec) {
							return rec.question.content;
						}
					}, {
						field : 'createTimeStr',
						title : '创建时间',
						align : 'center',
						width : 200
					}, {
						field : 'opt',
						title : '操作',
						width : 400,
						align : 'center',
						rowspan : 2,
						formatter : function(value, rec) {
							return '<input type="button" onclick="optionEdit('+questionId+','+rec.optionId+')" class="button_Csss" value="修改" /> <input type="button" onclick="removeOption('+rec.optionId+')" class="button_Csss" value="删除" />';
						}
					} ] ],
					toolbar : [ {
						text : '新增',
						iconCls : 'icon-add',
						handler : function() {
							optionEdit(questionId);
						}
					},{
						text : '批量删除',
						iconCls : 'icon-remove',
						handler : function() {
							batchRemoveOption();
						}
					}],
					onLoadSuccess : function() {
						$('#optionList').datagrid('clearSelections'); //一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
					}
				});

	$("#searchOptionBackId").click(function(){
		reSetTab(basePath+'/jsp/manager/questionList.jsp');
	});
});

//重新加载列表
function refreshOption() {
	$('#optionList').datagrid('reload');
}


function optionEdit(questionId,optionId){
	var url = basePath+'/jsp/manager/editOption.jsp';
	var title = "新增选项";
	if(optionId!=undefined && optionId !=null && optionId !=""){
		url = url + "?optionId="+optionId;
		title = "修改选项";
	}
	showWindow({
			title:title,
			href:url,
			width:530,
			height:350,
			onLoad:function(){
				$("#optionForm input[name='question.questionId']").val(questionId);
				if(optionId!=null&&optionId!=""&&optionId!=undefined){
					$.post(basePath+"/manager/getOption",{"optionId":optionId},function(data){
						$("#optionForm input[name=content]").val(data.content);
						$("#optionForm input[name=oName]").val(data.oName);
						$("#optionForm select[name=correct]").val(data.correct);
						$("#optionForm").append("<input type='hidden' name='optionId' value='"+optionId+"'/>");
					});
				}
			}
		});
}

function removeOption(optionId){
	$.messager.confirm('操作提示', '是否要删除该信息？', function(r){
		if(r){
			$.post(basePath+"/manager/deleteOption",{"optionId":optionId},function(data){
				if(data){
					//$.messager.alert("操作提示","删除成功！","info");
					$.messager.show({
						title:"操作提示",
						msg:"删除成功！",
						timeout:5000,
						showType:"slide"
					});
					refreshOption();
				} else {
					$.messager.alert("操作提示","删除失败！","error");
				}
			});
		}
	});
}


function batchRemoveOption(){
	var rows = $('#optionList').datagrid('getSelections');
	if (rows.length == 0) {
		$.messager.alert('提示', "请选择你要删除的试题！", 'info');
		return;
	}
	var optionArr = [];
	$.each(rows, function(i, n) {
		optionArr.push(n.optionId);
	});
	$.messager.confirm('操作提示', '是否要删除该信息？', function(r){
		if(r){
			$.post(window.parent.basePath+"/manager/batchDeleteOption",$.param({"optionArr":optionArr},true),function(data){
				if(data){
					//$.messager.alert("操作提示","删除成功！","info");
					$.messager.show({
						title:"操作提示",
						msg:"删除成功！",
						timeout:5000,
						showType:"slide"
					});
					refreshOption();
				} else {
					$.messager.alert("操作提示","删除失败！","error");
				}
			});
		}
	});
}
