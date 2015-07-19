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

<base target="_self">
<title>file</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.3.5/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.3.5/themes/icon.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.5/jquery-1.4.4.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.5/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
		$.extend($.fn.validatebox.defaults.rules, {
		 	compValue: {
		        validator: function (value) {
		            return '-----请选择-----'!=value;
		    	},
		    	message: '请选择所属课程'
			}
		});
		$(function(){
			var myParent = window.parent;
			$("#backId").click(function() {
				if(!myParent.hasOwnProperty("closeWindow"))
					myParent = window.parent.parent;
				myParent.closeWindow();
				myParent.refreshResourceList();
			});
			$("#saveId").click(function() {
				var r = $("#resourceForm").form("validate");
				if(!r) {
					return false;
				}
				var resourceFile = $.trim($("#resourceFile").val());
				if(resourceFile!=null && resourceFile !=""){
					$("#resourcePath").val($("#resourceFile").val());
				}
				document.getElementById("resourceForm").submit();
			});
		});
		function myLoad(){
			var result = $("input[id=result]", parent.document).val();
			if(result !=null && $.trim(result) != ""){
				myParent = window.parent.parent;
				if(result == "true"){
					myParent.closeWindow();
					myParent.refreshResourceList();
				} else {
					$.messager.alert("操作提示","保存失败！","error");
				}
			} else {
				var resourceId = $(parent.document).find("#resourceId").val();
				if(resourceId!=null&&resourceId!=""&&resourceId!=undefined){
					$.post("${pageContext.request.contextPath}/manager/getResource",{"resourceId":resourceId},function(data){
						$("#resourceForm input[name='belongCourse']").combobox({   
						    url:"${pageContext.request.contextPath}/manager/netWorkCourseCmbList",
						    valueField:'nwId',   
						    textField:'courseName',
						    editable : false  ,
						    loadFilter : function(data){
						    	data.unshift({"createTime":'',"createTimeStr":'',"nwId":0,"courseName":'-----请选择-----'});
						    	return data;
						    },
						    onLoadSuccess : function(){
						    	$(this).combobox('setValue', data.belongCourse);
						    }
						}); 
						$("input[name=resourceName]").val(data.resourceName);
						$("input[name=resourcePath]").val(data.resourcePath);
						$("input[name=resourceId]").val(data.resourceId);
						$("input[name=resourceFile]").validatebox('disableValidation');
						$("select[name=resourceType]").val(data.resourceType);
					});
				} else {
					$("#resourceForm input[name='belongCourse']").combobox({   
					    url : "${pageContext.request.contextPath}/manager/netWorkCourseCmbList",
					    valueField : 'nwId',   
					    textField : 'courseName',
					    editable : false  ,
					    loadFilter : function(data){
					    	data.unshift({"createTime":'',"createTimeStr":'',"nwId":0,"courseName":'-----请选择-----'});
					    	return data;
					    },
					    onLoadSuccess : function(){
					    	$(this).combobox('setValue', 0);
					    }
					}); 
				}
			}
		}
	</script>
</head>
<body onload="myLoad()" >
	<center id="myCenter" >
		<form id="resourceForm" target="_self" style="width:480;height:255;" action="${pageContext.request.contextPath}/manager/saveResource" method="post" enctype="multipart/form-data">
			<input type="hidden" name="resourcePath" id="resourcePath"/>
			<input type="hidden" name="resourceId"/>
			<table style="font-size: 13px;" width="480" height="255">
				<tr>
					<td width="100px">资源名称：</td>
					<td width="100px"><input type="text"  class="easyui-validatebox" data-options="required:true" name="resourceName" /></td>
				</tr>
				<tr>
					<td width="100px">所属课程：</td>
					<td width="100px">
						<input name="belongCourse" type="text" data-options="required:true,validType:'compValue'"/>
					</td>
				</tr>
				<tr>
					<td width="100px">资源类型：</td>
					<td>
					<select name="resourceType" class="easyui-validatebox" style="width: 152px" data-options="required:true">
						<option value="1">音频</option>
						<option value="5">视频</option>
						<option value="2">教学素材</option>
						<option value="3">教学课件</option>
						<option value="4">文献资料</option>
					</select>			
				</tr>
				<tr>
					<td width="100px">资源文件：</td>
					<td>
					<input type="file" name="resourceFile" id="resourceFile" class="easyui-validatebox" data-options="required:true" /></td>			
				</tr>
				<tr>
					<td align="center" colspan="2">
						<a id="backId" class="easyui-linkbutton" data-options="iconCls:'icon-back'">取消</a>
					<span style="width: 56px"></span>
						<a id="saveId" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>