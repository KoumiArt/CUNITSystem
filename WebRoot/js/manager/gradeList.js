$(function($) {
	$('#gradeList').datagrid(
	{
		method : 'post',
		iconCls : 'icon-search', //图标
		singleSelect : false, //多选
		autoRowHeight:true,
		//height: 460,//高度
		//width: 1000,
		fitColumns : true, //自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
		striped : true, //奇偶行颜色不同
		collapsible : true,//可折叠
		url : basePath+"/manager/gradeList",
		
		idField : 'gradeId', //主键字段
		pagination : true, //显示分页
		rownumbers : true, //显示行号
		columns : [ [ {
			field : 'gradeId',
			checkbox : true
		}, {
			field : 'gradeName',
			title : '年级',
			align : 'center',
			width : 200
		}, {
			field : 'createTimeStr',
			title : '日期',
			align : 'center',
			width : 100
		},{
			field : 'opt',
			title : '操作',
			width : 400,
			align : 'center',
			rowspan : 2,
			formatter : function(value, rec) {
				return '<input type="button" onclick="" class="button_Csss" value="修改" /> <input type="button" onclick="" class="button_Csss" value="删除" />';
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
			$('#gradeList').datagrid('clearSelections'); //一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
		}
	});
	
});

