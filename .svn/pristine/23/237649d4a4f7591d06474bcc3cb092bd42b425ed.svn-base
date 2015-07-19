$(function($) {
	$('#teacherList').datagrid(
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
					url : basePath+"/manager/teacherList",
					
					idField : 'tId', //主键字段
					pagination : true, //显示分页
					rownumbers : true, //显示行号
					columns : [ [ {
						field : 'tId',
						checkbox : true
					}, {
						field : 'tName',
						title : '姓名',
						align : 'center',
						width : 200
					}, {
						field : 'sexStr',
						title : '性别',
						align : 'center',
						width : 100
					}, {
						field : 'teachingAge',
						title : '年龄',
						align : 'center',
						width : 100
					} , {
						field : 'tNo',
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
							return '<input type="button" style="width:70px" onclick="showExamList('+rec.tId+')" class="button_Csss" value="相关课程" /> <input type="button" onclick="teacherEdit('+rec.tId+')" class="button_Csss" value="修改" /> <input type="button" onclick="removeTeacher('+rec.tId+')" class="button_Csss" value="删除" />';
						}
					} ] ],
					toolbar : [ {
						text : '新增',
						iconCls : 'icon-add',
						handler : function() {
							teacherEdit();
						}
					},{
						text : '批量删除',
						iconCls : 'icon-remove',
						handler : function() {
							batchRemoveTeacher();
						}
					}],
					onLoadSuccess : function() {
						$('#teacherList').datagrid('clearSelections'); //一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
						$("#teacherList").datagrid('resize',{
							width:'auto'})
					}
				});
	
	$("#searchTeacherId").click(function(){
		var params = $('#teacherList').datagrid('options').queryParams; //先取得 datagrid 的查询参数
		var fields = $('#searchTeacherFormId').serializeArray(); //自动序列化表单元素为JSON对象
		$.each(fields, function(i, field) {
			params[field.name] = field.value; //设置查询参数
		});
		refreshTeacherList();
	});
});

//重新加载列表
function refreshTeacherList() {
	$('#teacherList').datagrid('reload');
}


function teacherEdit(tId){
	var url = basePath+'/jsp/manager/editTeacher.jsp';
	var title = "新增老师信息";
	if(tId!=undefined && tId !=null && tId !=""){
		url = url + "?tId="+tId;
		title = "修改老师信息";
	}
	showWindow({
			title:title,
			href:url,
			width:530,
			height:350,
			onLoad:function(){
				if(tId!=null&&tId!=""&&tId!=undefined){
					$.post(basePath+"/manager/getTeacher",{"tId":tId},function(data){
						$("#teacherForm input[name=tName]").val(data.tName);
						$("#teacherForm select[name=sex]").val(data.sex);
						$("#teacherForm input[name=teachingAge]").numberbox({
							value:data.teachingAge
						});
						$("#teacherForm input[name=tNo]").val(data.tNo);
						$("#teacherForm input[name=email]").val(data.email);
						//$("#teacherForm input[name=phone]").val(data.phone);
						$("#teacherForm input[name=phone]").numberbox({
							value:data.phone
						});
						$("#teacherForm input[name=address]").val(data.address);
						$("#teacherForm").append("<input type='hidden' name='tId' value='"+tId+"'/>");
					});
				}else {
					$("#teacherForm input[name=phone]").numberbox({
					});
					$("#teacherForm input[name=teachingAge]").numberbox({
					});
				}
			}
		});
}

function removeTeacher(tId){
	$.messager.confirm('操作提示', '是否要删除该信息？', function(r){
		if(r){
			$.post(basePath+"/manager/deleteTeacher",{"tId":tId},function(data){
				if(data){
					//$.messager.alert("操作提示","删除成功！","info");
					$.messager.show({
						title:"操作提示",
						msg:"删除成功！",
						timeout:5000,
						showType:"slide"
					});
					refreshTeacherList();
				} else {
					$.messager.alert("操作提示","删除失败！","error");
				}
			});
		}
	});
}


function batchRemoveTeacher(){
	$.messager.confirm('操作提示', '是否要删除该信息？', function(r){
		if(r){
			var rows = $('#teacherList').datagrid('getSelections');
			if (rows.length == 0) {
				$.messager.alert('提示', "请选择你要删除的老师！", 'info');
				return;
			}
			var teacherArr = [];
			$.each(rows, function(i, n) {
				teacherArr.push(n.tId);
			});
			$.post(window.parent.basePath+"/manager/batchDeleteTeacher",$.param({"teacherArr":teacherArr},true),function(data){
				if(data){
					//$.messager.alert("操作提示","删除成功！","info");
					$.messager.show({
						title:"操作提示",
						msg:"删除成功！",
						timeout:5000,
						showType:"slide"
					});
					refreshTeacherList();
				} else {
					$.messager.alert("操作提示","删除失败！","error");
				}
			});
		}
	});
}

function showExamList(tId){
	showWindow({
		title:"相关课程",
		width:680,
		height:400,
		fitColumns : true,
		maximizable:true,
		href:basePath+"/jsp/manager/teacherEnrolList.jsp?tId="+tId,
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
