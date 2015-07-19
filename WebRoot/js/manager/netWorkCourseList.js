$(function($) {
	$('#netWorkCourseList').datagrid(
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
					url : basePath+"/manager/netWorkCourseList",
					idField : 'nwId', //主键字段
					pagination : true, //显示分页
					rownumbers : true, //显示行号
					columns : [ [/* {
						field : 'nwId',
						checkbox : true
					},*/ {
						field : 'courseName',
						title : '课程名称',
						align : 'center',
						width : 200
					}, {
						field : 'description',
						title : '课程描述',
						align : 'center',
						width : 330
					},
					{
						field : 'opt',
						title : '操作',
						width : 200,
						align : 'center',
						rowspan : 2,
						formatter : function(value, rec) {
							var retrunStr = "";
							if(userRole == 1)
								//retrunStr = '<input type="button" onclick="netWorkCourseEdit('+rec.nwId+')" class="button_Csss" value="修改" /> <input type="button" onclick="removeNetWorkCourse('+rec.nwId+')" class="button_Csss" value="删除" />';
								retrunStr = '<input type="button" onclick="netWorkCourseEdit('+rec.nwId+')" class="button_Csss" value="修改" />';
							else if(userRole == 2) {
								if(rec.curUserIsEnrol == 0)
									retrunStr = '<input type="button" onclick="addEnrol('+rec.nwId+')" class="button_Csss" value="报名" />';
								else 
									retrunStr = '<input type="button" style="color: #D4D4D4;cursor:default;" disabled="disabled" class="button_Csss" value="已报名" />';
							} else if(userRole == 3) {
								if(rec.curUserIsEnrol == 0)
									retrunStr = '<input type="button" onclick="addEnrol('+rec.nwId+')" class="button_Csss" value="授课" />';
								else 
									retrunStr = '<input type="button" style="color: #D4D4D4;cursor:default;" disabled="disabled" class="button_Csss" value="已授课" />';
							}
							return retrunStr;
						}
					} ] ],
					onLoadSuccess : function() {
						$('#netWorkCourseList').datagrid('clearSelections'); //一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
					}
				});
	//管理员添加工具栏
	if(userRole == 1){
		$('#netWorkCourseList').datagrid(
					{
						toolbar : [ {
							text : '新增',
							iconCls : 'icon-add',
							handler : function() {
								netWorkCourseEdit();
							}
						}/*,{
							text : '批量删除',
							iconCls : 'icon-remove',
							handler : function() {
								batchRemoveNetWorkCourse();
							}
						}*/]
					});
	} else {
		$('#netWorkCourseList').datagrid("hideColumn","nwId");
	}
	
	$("#searchNetWorkCourseId").click(function(){
		var params = $('#netWorkCourseList').datagrid('options').queryParams; //先取得 datagrid 的查询参数
		var fields = $('#searchNetWorkCourseFormId').serializeArray(); //自动序列化表单元素为JSON对象
		$.each(fields, function(i, field) {
			params[field.name] = field.value; //设置查询参数
		});
		refreshNetWorkCourseList();
	});
});

//重新加载列表
function refreshNetWorkCourseList() {
	$('#netWorkCourseList').datagrid('reload');
}


function netWorkCourseEdit(nwId){
	var url = basePath+'/jsp/manager/editNetWorkCourse.jsp';
	var title = "新增学生信息";
	if(nwId!=undefined && nwId !=null && nwId !=""){
		url = url + "?nwId="+nwId;
		title = "修改学生信息";
	}
	showWindow({
			title:title,
			href:url,
			width:530,
			height:350,
			onLoad:function(){
				if(nwId!=null&&nwId!=""&&nwId!=undefined){
					$.post(basePath+"/manager/getNetWorkCourse",{"nwId":nwId},function(data){
						$("#netWorkCourseForm input[name=courseName]").val(data.courseName);
						$("#netWorkCourseForm textarea[name=description]").val(data.description);
						$("#netWorkCourseForm").append("<input type='hidden' name='nwId' value='"+nwId+"'/>");
					});
				}
			}
		});
}

function removeNetWorkCourse(nwId){
	$.messager.confirm('操作提示', '是否要删除该信息？', function(r){
		if(r){
			$.post(basePath+"/manager/deleteNetWorkCourse",{"nwId":nwId},function(data){
				if(data){
					//$.messager.alert("操作提示","删除成功！","info");
					$.messager.show({
						title:"操作提示",
						msg:"删除成功！",
						timeout:5000,
						showType:"slide"
					});
					refreshNetWorkCourseList();
				} else {
					$.messager.alert("操作提示","删除失败！","error");
				}
			});
		}
	});
}


function batchRemoveNetWorkCourse(){
	$.messager.confirm('操作提示', '是否要删除该信息？', function(r){
		if(r){
			var rows = $('#netWorkCourseList').datagrid('getSelections');
			if (rows.length == 0) {
				$.messager.alert('提示', "请选择你要删除的学生！", 'info');
				return;
			}
			var netWorkCourseArr = [];
			$.each(rows, function(i, n) {
				netWorkCourseArr.push(n.nwId);
			});
			$.post(window.parent.basePath+"/manager/batchDeleteNetWorkCourse",$.param({"netWorkCourseArr":netWorkCourseArr},true),function(data){
				if(data){
					//$.messager.alert("操作提示","删除成功！","info");
					$.messager.show({
						title:"操作提示",
						msg:"删除成功！",
						timeout:5000,
						showType:"slide"
					});
					refreshNetWorkCourseList();
				} else {
					$.messager.alert("操作提示","删除失败！","error");
				}
			});
		}
	});
}

function addEnrol(nwId){
	$.post(basePath+"/manager/addEnrol",{"nwId":nwId},function(data){
		if(data){
			//$.messager.alert("操作提示","操作成功！","info");
			$.messager.show({
				title:"操作提示",
				msg:"操作成功！",
				timeout:5000,
				showType:"slide"
			});
			refreshNetWorkCourseList();
		} else {
			$.messager.alert("操作提示","操作失败！","info");
		}
	});
}
