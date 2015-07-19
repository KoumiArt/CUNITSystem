$(function($) {
	var result_hidd_tId = $("#result_hidd_tId").val();
	if(result_hidd_tId == undefined || result_hidd_tId == null || result_hidd_tId == "")
		result_hidd_tId = 0;
	$('#teacherEnrolList').datagrid(
				{
					method : 'post',
					iconCls : 'icon-search', //图标
					singleSelect : true, //单选
					autoRowHeight:true,
					height: 'auto',//高度
					fitColumns : true, //自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
					striped : true, //奇偶行颜色不同
					collapsible : true,//可折叠
					url : basePath+"/manager/teacherEnrolList",
					queryParams : {'tId':result_hidd_tId},
					idField : 'enrolId', //主键字段
					columns : [ [ {
						field : 'CourseName',
						title : '课程名称',
						align : 'center',
						width : 200
					}, {
						field : 'description',
						title : '课程描述',
						align : 'center',
						width : 330
					}, {
						field : 'opti',
						title : '操作',
						width : 200,
						align : 'center',
						rowspan : 2,
						formatter : function(value, rec) {
							return	'<input type="button" onclick="seeStudent(\''+rec.nwId+'\',\''+rec.CourseName+'\');" class="button_Csss" style="width:65px" value="学生" /> <input type="button" onclick="seeResourceList(\''+rec.nwId+'\',\''+rec.CourseName+'\');" class="button_Csss" style="width:65px" value="推荐资源" />';
						}
					}] ],
					onLoadSuccess : function() {
						$('#teacherEnrolList').datagrid('clearSelections'); //一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
					}
				});
});




function seeStudent(nwId,courseName){
	showMyDialog({
		title:"报读'"+courseName+"'的学生",
		width:680,
		height:550,
		fitColumns : true,
		maximizable:true,
		href:basePath+"/jsp/client/stuNetWorkCourseList.jsp?type=1&nwId="+nwId,
		onMaximize:function(){
			$("#stuNetWorkCourseList").datagrid('resize',{height: 'auto',//高度
				width:'auto'});
		},
		onRestore:function (){
			$("#stuNetWorkCourseList").datagrid('resize',{height: 'auto',//高度
				width:'auto'});
		}
	});
}

 function seeResourceList(nwId,courseName){
	 showMyDialog({
			title:"'"+courseName+"'的相关资源",
			width:680,
			height:450,
			fitColumns : true,
			maximizable:true,
			href:basePath+"/jsp/manager/teacherResourceList.jsp?nwId="+nwId,
			onMaximize:function(){
				$("#teacherResourceList").datagrid('resize',{height: 'auto',//高度
					width:'auto'});
			},
			onRestore:function (){
				$("#teacherResourceList").datagrid('resize',{height: 'auto',//高度
					width:'auto'});
			}
		});
 }