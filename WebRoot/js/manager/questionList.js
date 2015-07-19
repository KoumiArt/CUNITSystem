$(function($) {
	var hidd_nwId = $("#hidd_nwId").val();
	if(hidd_nwId == undefined || hidd_nwId == null || hidd_nwId == "")
		hidd_nwId = 0;
	$('#questionList').datagrid(
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
					queryParams: {"netWorkCourse.nwId":hidd_nwId},
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
					}, {
						field : 'description',
						title : '描述',
						align : 'center',
						width : 200
					},{
						field : 'opt',
						title : '操作',
						width : 400,
						align : 'center',
						rowspan : 2,
						formatter : function(value, rec) {
							var retrunStr = "";
							if(userRole == 1) {
								retrunStr = '<input type="button" onclick="toOption('+rec.questionId+')" class="button_Csss" value="选项" /> <input type="button" onclick="questionEdit('+rec.questionId+')" class="button_Csss" value="修改" /> <input type="button" onclick="removeQuestion('+rec.questionId+')" class="button_Csss" value="删除" />';
							}
							return retrunStr;
						}
					} ] ],
					onLoadSuccess : function() {
						$('#questionList').datagrid('clearSelections'); //一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
					}
				});
	if(userRole == 1){
		$('#questionList').datagrid({
			toolbar : [ {
				text : '新增',
				iconCls : 'icon-add',
				handler : function() {
					questionEdit();
				}
			},{
				text : '批量删除',
				iconCls : 'icon-remove',
				handler : function() {
					batchRemoveQuestion();
				}
			}]
		});
		$("#searchQuestionFormId input[name='netWorkCourse.nwId']").combobox({   
		    url:basePath+"/manager/netWorkCourseCmbList",
		    valueField:'nwId',   
		    textField:'courseName',
		    editable : false  ,
		    loadFilter : function(data){
		    	data.unshift({"createTime":'',"createTimeStr":'',"nwId":0,"courseName":'-----请选择-----'});
		    	return data;
		    },
		    onLoadSuccess : function(){
		    	$(this).combobox('setValue', 0);
		    }
		}); 
	} else if(userRole == 3){
		$('#questionList').datagrid("hideColumn","netWorkCourse");
		$('#questionList').datagrid("hideColumn","createTimeStr");
		$('#questionList').datagrid("hideColumn","opt");
		$("#searchQuestionFormId #nwTD_id").remove();
		$("#MyPopWindow").append('<div style="width: 100%;text-align: center;padding-bottom: 5px;padding-top: 35px;"><a class="easyui-linkbutton" data-options="iconCls:\'icon-save\'" onclick="doSubmitHomeWork(\''+hidd_nwId+'\')" >提交</a></div>');
	}
	
	$("#searchQuestionId").click(function(){
		var params = $('#questionList').datagrid('options').queryParams; //先取得 datagrid 的查询参数
		var fields = $('#searchQuestionFormId').serializeArray(); //自动序列化表单元素为JSON对象
		$.each(fields, function(i, field) {
			params[field.name] = field.value; //设置查询参数
		});
		refreshQuestion();
	});
});

/**
 * 提交布置作业
 */
function doSubmitHomeWork(nwId){
	var rows = $('#questionList').datagrid('getSelections');
	if (rows.length == 0) {
		$.messager.alert('提示', "请选择题目！", 'info');
		return;
	}
	
	var questionIdArr = [];
	var isAdd = true;
	$.each(rows, function(i, n) {
		for(var j =0;j<questionIdArr.length;j++){
			if(questionIdArr[j] == n.questionId){
				isAdd = false;
				break;
			}
		}
		if(isAdd){
			questionIdArr.push(n.questionId);
		}
	});
	
	
	showMyDialog({
	    title: "作业提交截止时间",
	    width: 400,
	    height: 200,
	    closed: false,
	    cache: false,
	    content: '<center style="padding-top:50px;">截止时间：<input name="lastTime" type="text" class="Wdate" onClick="WdatePicker({dateFmt:\'yyyy-MM-dd HH:mm:ss\'})" /></center>',
	    modal: true,
	    buttons:[{
			text:'确定',
			handler:function(){
				var lastTime = $("input[name=lastTime]").val();
				$.post(basePath+"/client/homeWork",{"questionIdArr":questionIdArr.join(","),"lastTime":lastTime,"nwId":nwId},function(data){
					if(data == 1){
						$.messager.show({
							title:"操作提示",
							msg:"作业布置成功！",
							timeout:5000,
							showType:"slide"
						});
						closeMyDialog();
						closeWindow();
					} else if(data == 2){
						$.messager.alert("操作提示","作业布置失败！","error");
					} else if(data == 3){
						$.messager.alert("操作提示","最迟提交时间至少要大于当前时间1小时！","error");
					}
				});
				//
			}
		},{
			text:'取消',
			handler:function(){
				closeMyDialog();
			}
		}]
	});
}

//重新加载列表
function refreshQuestion() {
	$('#questionList').datagrid('reload');
}


function questionEdit(questionId){
	var url = basePath+'/jsp/manager/editQuestion.jsp';
	var title = "新增试题";
	if(questionId!=undefined && questionId !=null && questionId !=""){
		url = url + "?questionId="+questionId;
		title = "修改试题";
	}
	showWindow({
			title:title,
			href:url,
			width:530,
			height:350,
			onLoad:function(){
				if(questionId!=null&&questionId!=""&&questionId!=undefined){
					$.post(basePath+"/manager/getQuestion",{"questionId":questionId},function(data){
						$("#questionForm input[name='netWorkCourse.nwId']").combobox({   
						    url:basePath+"/manager/netWorkCourseCmbList",
						    valueField:'nwId',   
						    textField:'courseName',
						    editable : false  ,
						    onLoadSuccess : function(){
						    	$(this).combobox('setValue', data.netWorkCourse.nwId);
						    }
						}); 
						$("#questionForm textarea[name=content]").val(data.content);
						$("#questionForm textarea[name=description]").val(data.description);
						//$("#questionForm input[name=title]").val(data.title);
						//$("#questionForm input[name=score]").val(data.score);
						$("#questionForm input[name=score]").numberbox({
							value:data.score
						});
						$("#questionForm").append("<input type='hidden' name='questionId' value='"+questionId+"'/>");
					});
				} else {
					$("#questionForm input[name='netWorkCourse.nwId']").combobox({   
					    url:basePath+"/manager/netWorkCourseCmbList",
					    valueField:'nwId',   
					    textField:'courseName',
					    editable : false 
					}); 
					$("#questionForm input[name=score]").numberbox({
					});
				}
			}
		});
}

function removeQuestion(questionId){
	$.messager.confirm('操作提示', '是否要删除该信息？', function(r){
		if(r){
			$.post(basePath+"/manager/deleteQuestion",{"questionId":questionId},function(data){
				if(data){
					//$.messager.alert("操作提示","删除成功！","info");
					$.messager.show({
						title:"操作提示",
						msg:"删除成功！",
						timeout:5000,
						showType:"slide"
					});
					refreshQuestion();
				} else {
					$.messager.alert("操作提示","删除失败！","error");
				}
			});
		}
	});
}


function batchRemoveQuestion(){
	var rows = $('#questionList').datagrid('getSelections');
	if (rows.length == 0) {
		$.messager.alert('提示', "请选择你要删除的试题！", 'info');
		return;
	}
	var questionArr = [];
	$.each(rows, function(i, n) {
		questionArr.push(n.questionId);
	});
	$.messager.confirm('操作提示', '是否要删除该信息？', function(r){
		if(r){
			$.post(window.parent.basePath+"/manager/batchDeleteQuestion",$.param({"questionArr":questionArr},true),function(data){
				if(data){
					$.messager.show({
						title:"操作提示",
						msg:"批量删除成功！",
						timeout:5000,
						showType:"slide"
					});
					refreshQuestion();
				} else {
					$.messager.alert("操作提示","删除失败！","error");
				}
			});
		}
	});
}


function toOption(questionId){
	reSetTab(basePath+'/jsp/manager/optionList.jsp?questionId='+questionId);
}
