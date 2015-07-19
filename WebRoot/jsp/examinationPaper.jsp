<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加用户</title>
<script type="text/javascript">
	$(function($) {
		$('#examinationPaperList')
				.datagrid(
						{
							title : '试卷列表', //标题
							method : 'post',
							iconCls : 'icon-search', //图标
							singleSelect : false, //多选
							height : 360, //高度
							fitColumns : true, //自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
							striped : true, //奇偶行颜色不同
							collapsible : true,//可折叠
							url : "/ExaminationManagementSystem/question/ExaminationPaper",
							idField : 'tplId', //主键字段
							queryParams : {tp_Id:'${param.tp_Id}'}, //查询条件
							pagination : true, //显示分页
							rownumbers : true, //显示行号
							columns : [ [
									{
										field : 'tplId',
										title : 'id',
										align : 'center',
										width : 100
									},
									{
										field : 'tpName',
										title : '产品',
										align : 'center',
										width : 100
									},
									{
										field : 'rtpName',
										title : '等级',
										align : 'center',
										width : 100
									},
									{
										field : 'tplType',
										title : '类型',
										align : 'center',
										width : 100
									},
									{
										field : 'tplDdate',
										title : '日期',
										align : 'center',
										width : 100
									},
									{
										field : 'opt',
										title : '操作',
										width : 100,
										align : 'center',
										rowspan : 2,
										formatter : function(value, rec) {
											return '<input type="button" onclick="download('+rec.tplId+')" class="button_Csss" value="导出" /> <input type="button" onclick="answerQuestion('+rec.tplId+')" class="button_Csss" value="答题" />';
										}
									} ] ],
							onLoadSuccess : function() {
								$('#examinationPaperList').datagrid('clearSelections'); //一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
							}
						});
	});

	//重新加载列表
	function refreshList() {
		$('#examinationPaperList').datagrid('reload');
	}

	//表格查询
	$(function() {
		$("#searchId").click(function() {
			var params = $('#examinationPaperList').datagrid('options').queryParams; //先取得 datagrid 的查询参数
			var fields = $('#queryForm').serializeArray(); //自动序列化表单元素为JSON对象
			$.each(fields, function(i, field) {
				params[field.name] = field.value; //设置查询参数
			});
			$('#examinationPaperList').datagrid('reload'); //设置好查询参数 reload 一下就可以了
		});
	});

	function download(tplId){
		location.href = "/ExaminationManagementSystem/download?tplId="+tplId;
	}

	function answerQuestion(tplId) {	 		
		showWindow({
  			title:'更新用户信息',
  			href:'/ExaminationManagementSystem/question/answer?tplId='+tplId,
  			fitColumns : true,
  			maximized:true
  		});
	}
</script>
</head>
<body>
	<div style="padding: 10" id="tabdiv">

		<form method="post" id="queryForm" style="height: 10px;">
			<div class="page_QueryArea">
				<table style="width :100%" cellSpacing="0" cellPadding="0"
					border="0">
					<tr>
						<td nowrap style="font-size: 12px;width: 220px">发送时间：<input
							name="startDate" type="text" class="Wdate"
							onClick="WdatePicker()" /></td>
						<td style="width: 200px">- <input name="endDate" type="text"
							class="Wdate" onClick="WdatePicker()" />
						</td>
						<td style="font-size: 12px; width:230px;">类别：<select
							name="tplType" class="easyui-combobox" style="width:130px;">
								<option value="机试">机试</option>
								<option value="笔试">笔试</option>
						</select>
						</td>
						<td><a id="searchId" class="easyui-linkbutton" data-options="iconCls:icon-search">查询</a></td>
					</tr>
				</table>
			</div>
		</form>
		<table id="examinationPaperList"></table>
	</div>
</body>
</html>