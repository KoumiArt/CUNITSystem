$(function($) {
	$('#enrolList').datagrid(
				{
					method : 'post',
					iconCls : 'icon-search', //图标
					singleSelect : true, //单选
					autoRowHeight:true,
					height: 460,//高度
					//width: 1000,
					fitColumns : true, //自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
					striped : true, //奇偶行颜色不同
					collapsible : true,//可折叠
					url : basePath+"/manager/getMyNetWorkCourse",
					idField : 'enrolId', //主键字段
					pagination : true, //显示分页
					rownumbers : true, //显示行号
					columns : [ [ {
						field : 'courseName',
						title : '课程名称',
						align : 'center',
						width : 180,
						formatter : function(value, rec) {
							return rec.netWorkCourse.courseName;
						}
					}, {
						field : 'description',
						title : '课程描述',
						align : 'center',
						width : 300,
						formatter : function(value, rec) {
							return rec.netWorkCourse.description;
						}
					},
					{
						field : 'opt',
						title : '操作',
						width : 300,
						align : 'center',
						rowspan : 2,
						formatter : function(value, rec) {
							var retrunStr = "";
							if(userRole == 2) {
								retrunStr += '<input type="button" onclick="studentExam(\''+rec.netWorkCourse.nwId+'\','+rec.userInfo.student.sId+',\''+rec.netWorkCourse.courseName+'\')" class="button_Csss" style="width:65px" value="相关考试" /> ';
								retrunStr += '<input type="button" onclick="seeResourceList(\''+rec.netWorkCourse.nwId+'\',\''+rec.netWorkCourse.courseName+'\');" class="button_Csss" style="width:65px" value="课程资源" /> ';
								retrunStr += '<input type="button" onclick="selfTest(\''+rec.netWorkCourse.nwId+'\',\''+rec.netWorkCourse.courseName+'\')" class="button_Csss" value="自测" /> <input type="button" onclick="markHomeWork(\''+rec.netWorkCourse.nwId+'\',\''+rec.netWorkCourse.courseName+'\')" class="button_Csss" value="做作业" /> '+
											'<input type="button" onclick="record_homeWork(\''+rec.netWorkCourse.nwId+'\',\''+rec.netWorkCourse.courseName+'\')" class="button_Csss" style="width:65px" value="作业记录" /> <input type="button" style="width:65px" onclick="examOnLine(\''+rec.netWorkCourse.nwId+'\',\''+rec.netWorkCourse.courseName+'\')" class="button_Csss" value="在线考试" />';
							} else if(userRole == 3) {
								retrunStr = '<input type="button" onclick="seeStudent(\''+rec.netWorkCourse.nwId+'\',\''+rec.netWorkCourse.courseName+'\');" class="button_Csss" style="width:65px" value="学生" /> ';
								retrunStr += '<input type="button" onclick="seeResourceList(\''+rec.netWorkCourse.nwId+'\',\''+rec.netWorkCourse.courseName+'\');" class="button_Csss" style="width:65px" value="课程资源" /> ';
								retrunStr += '<input type="button" onclick="homeWork(\''+rec.netWorkCourse.nwId+'\',\''+rec.netWorkCourse.courseName+'\');" class="button_Csss" style="width:65px" value="布置作业" /> <input type="button" style="width:65px" onclick="cri_homeWork(\''+rec.netWorkCourse.nwId+'\',\''+rec.netWorkCourse.courseName+'\');" class="button_Csss" value="批改作业" /> ';
							}
							return retrunStr;
						}
					} ] ],
					onLoadSuccess : function() {
						$('#enrolList').datagrid('clearSelections'); //一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
					}
				});
});

//重新加载列表
function refreshNetWorkCourseList() {
	$('#enrolList').datagrid('reload');
}


/**
 * 自测
 */
function selfTest(nwId,courseName){
	showMyDialog({
		title:"自测'"+courseName+"'",
		width:480,
		height:380,
		maximizable:true,
		href:basePath+"/manager/getQuestionRandom?nwId="+nwId,
		modal: true,
		buttons:[{
			text:'提交',
			handler:function(){
				doSubmit();
			}
		},{
			text:'取消',
			handler:function(){
				closeMyDialog();
			}
		}]
	});
}

/**
 * 做作业
 */
function markHomeWork(nwId,courseName){
	showMyDialog({
		title:"'"+courseName+"'作业",
		width:480,
		height:380,
		fitColumns : true,
		maximizable:true,
		href:basePath+"/client/getHomeWork?nwId="+nwId,
		modal: true,
		buttons:[{
			text:'提交',
			handler:function(){
				doSubmitHomeWork(nwId);
			}
		},{
			text:'取消',
			handler:function(){
				closeMyDialog();
			}
		}]
	});
}

/**
 * 作业记录
 */
function record_homeWork(nwId,courseName){
	showWindow({
		title:"'"+courseName+"'作业记录",
		width:680,
		height:550,
		fitColumns : true,
		maximizable:true,
		href:basePath+"/jsp/client/homeWorkLogs.jsp?nwId="+nwId,
		onMaximize:function(){
			$("#homeWorkLogList").datagrid('resize',{height: 650,//高度
				width:'auto'});
		},
		onRestore:function (){
			$("#homeWorkLogList").datagrid('resize',{height: 500,//高度
				width:666});
		}
	});
}

/**
 * 布置作业
 */
function homeWork(nwId,courseName){
	showWindow({
		title:"布置'"+courseName+"'作业",
		width:680,
		height:550,
		fitColumns : true,
		maximizable:true,
		href:basePath+"/jsp/manager/questionList.jsp?nwId="+nwId,
		onMaximize:function(){
			$("#questionList").datagrid('resize',{height: 'auto',//高度
				width:'auto'});
		},
		onRestore:function (){
			$("#questionList").datagrid('resize',{height: 'auto',//高度
				width:'auto'});
		}
	});
}

/**
 * 批改作业
 */
function cri_homeWork(nwId,courseName){
	showWindow({
		title:"批改'"+courseName+"'作业",
		width:680,
		height:550,
		fitColumns : true,
		maximizable:true,
		href:basePath+"/jsp/client/stuNetWorkCourseList.jsp?type=2&nwId="+nwId,
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

/**
 *在线考试 
 */
function examOnLine(nwId,courseName){
	//查询是否已经考过试
	$.post(basePath+"/manager/isExitExam",{"nwId":nwId},function(data){
		if(!data){
			showMyDialog({
				title:"在线考试：'"+courseName+"'",
				width:480,
				height:380,
				maximizable:true,
				href:basePath+"/manager/getExamQuestion?nwId="+nwId,
				modal: true,
				buttons:[{
					text:'提交',
					handler:function(){
						doExamQuestionSubmit(nwId);
					}
				},{
					text:'取消',
					handler:function(){
						closeMyDialog();
					}
				}]
			});
		} else {
			$.messager.alert("操作提示","你已经参加过本次考试！","error");
		}
	});
}


function seeStudent(nwId,courseName){
	showWindow({
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

function studentExam(nwId,sId,courseName){
	showWindow({
		title:"'"+courseName+"'相关考试",
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

function palyVideo(path){
	path = encodeURI(encodeURI(path));
	showWindow({
		title : "视频播放器",
		href :  basePath + "/jsp/manager/videoPlay.jsp?path="+path,
		width:750,
		height:480,
		shadow:false,
		modal:false,
		onClose:function(){
			//销毁window
			var video = document.getElementById("example_video_1");
			if(video != undefined && video !=null){
				video.pause();
			}
		}
	});
}