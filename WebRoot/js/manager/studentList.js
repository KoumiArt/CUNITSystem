$(function($) {
	$('#studentList').datagrid(
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
					url : basePath+"/manager/studentList",
					
					idField : 'sId', //主键字段
					pagination : true, //显示分页
					rownumbers : true, //显示行号
					columns : [ [ {
						field : 'sId',
						checkbox : true
					}, {
						field : 'sName',
						title : '姓名',
						align : 'center',
						width : 200
					}, {
						field : 'sexStr',
						title : '性别',
						align : 'center',
						width : 100
					}, {
						field : 'age',
						title : '年龄',
						align : 'center',
						width : 100
					} , {
						field : 'grade',
						title : '年级',
						align : 'center',
						width : 120,
						formatter : function(value, rec) {
							return rec.grade.gradeName;
						}
					} , {
						field : 'sNo',
						title : '身份证号',
						align : 'center',
						width : 200
					} , {
						field : 'email',
						title : '邮箱',
						align : 'center',
						width : 200
					} ,{
						field : 'phone',
						title : '手机号',
						align : 'center',
						width : 200
					} ,{
						field : 'address',
						title : '联系地址',
						align : 'center',
						width : 200
					} ,
					{
						field : 'opt',
						title : '操作',
						width : 400,
						align : 'center',
						rowspan : 2,
						formatter : function(value, rec) {
							return '<input type="button" onclick="studentExam('+rec.sId+',\''+rec.sName+'\')" class="button_Csss" style="width:70px" value="相关考试" /> <input type="button" onclick="studentEdit('+rec.sId+')" class="button_Csss" value="修改" /> <input type="button" onclick="removeStudent('+rec.sId+')" class="button_Csss" value="删除" />';
						}
					} ] ],
					toolbar : [ {
						text : '新增',
						iconCls : 'icon-add',
						handler : function() {
							studentEdit();
						}
					},{
						text : '批量删除',
						iconCls : 'icon-remove',
						handler : function() {
							batchRemoveStudent();
						}
					}],
					onLoadSuccess : function() {
						$('#studentList').datagrid('clearSelections'); //一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
						$("#studentList").datagrid('resize',{
							width:'auto'});
					}
				});
	
	$("#searchStudentId").click(function(){
		var params = $('#studentList').datagrid('options').queryParams; //先取得 datagrid 的查询参数
		var fields = $('#searchStudentFormId').serializeArray(); //自动序列化表单元素为JSON对象
		$.each(fields, function(i, field) {
			params[field.name] = field.value; //设置查询参数
		});
		refreshStudentList();
	});
});

//重新加载列表
function refreshStudentList() {
	$('#studentList').datagrid('reload');
}


function studentEdit(sId){
	var url = basePath+'/jsp/manager/editStudent.jsp';
	var title = "新增学生信息";
	if(sId!=undefined && sId !=null && sId !=""){
		url = url + "?sId="+sId;
		title = "修改学生信息";
	}
	showWindow({
			title:title,
			href:url,
			width:530,
			height:350,
			onLoad:function(){
				if(sId!=null&&sId!=""&&sId!=undefined){
					$.post(basePath+"/manager/getStudent",{"sId":sId},function(data){
						$("#studentForm input[name=sName]").val(data.sName);
						$("#studentForm select[name=sex]").val(data.sex);
						$("#studentForm input[name=age]").numberbox({
							value:data.age
						});
						$("#studentForm select[name='grade.gradeId']").val(data.grade.gradeId);
						$("#studentForm input[name=sNo]").val(data.sNo);
						$("#studentForm input[name=email]").val(data.email);
						$("#studentForm input[name=phone]").numberbox({
							value:data.phone
						});
						$("#studentForm input[name=address]").val(data.address);
						$("#studentForm").append("<input type='hidden' name='sId' value='"+sId+"'/>");
					});
				} else {
					$("#studentForm input[name=phone]").numberbox({
						
					});
					$("#studentForm input[name=age]").numberbox({
						
					});
				}
			}
		});
}

function removeStudent(sId){
	$.messager.confirm('操作提示', '是否要删除该信息？', function(r){
		if(r){
			$.post(basePath+"/manager/deleteStudent",{"sId":sId},function(data){
				if(data){
					//$.messager.alert("操作提示","删除成功！","info");
					$.messager.show({
						title:"操作提示",
						msg:"删除成功！",
						timeout:5000,
						showType:"slide"
					});
					refreshStudentList();
				} else {
					$.messager.alert("操作提示","删除失败！","error");
				}
			});
		}
	});
}


function batchRemoveStudent(){
	$.messager.confirm('操作提示', '是否要删除该信息？', function(r){
		if(r){
			var rows = $('#studentList').datagrid('getSelections');
			if (rows.length == 0) {
				$.messager.alert('提示', "请选择你要删除的学生！", 'info');
				return;
			}
			var studentArr = [];
			$.each(rows, function(i, n) {
				studentArr.push(n.sId);
			});
			$.post(window.parent.basePath+"/manager/batchDeleteStudent",$.param({"studentArr":studentArr},true),function(data){
				if(data){
					//$.messager.alert("操作提示","删除成功！","info");
					$.messager.show({
						title:"操作提示",
						msg:"删除成功！",
						timeout:5000,
						showType:"slide"
					});
					refreshStudentList();
				} else {
					$.messager.alert("操作提示","删除失败！","error");
				}
			});
		}
	});
}

function studentExam(sId,sName){
	showWindow({
		title:"学生'"+sName+"'的考试列表",
		width:680,
		height:400,
		fitColumns : true,
		maximizable:true,
		href:basePath+"/jsp/manager/sumResultList.jsp?sId="+sId,
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
