<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>首页</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	var basePath = "${pageContext.request.contextPath}"; 
	var userRole = "${userSession.userType}";
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/validate.js"></script>
<style type="text/css">
.button_Csss {
	BORDER-RIGHT: #7b9ebd 1px solid;
	PADDING-RIGHT: 2px;
	BORDER-TOP: #7b9ebd 1px solid;
	PADDING-LEFT: 2px;
	FONT-SIZE: 12px;
	FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0,
		StartColorStr=#ffffff, EndColorStr=#cecfde );
	BORDER-LEFT: #7b9ebd 1px solid;
	cursor:pointer;
	COLOR: #444444;
	PADDING-TOP: 2px;
	BORDER-BOTTOM: #7b9ebd 1px solid;
	width: 50px;
}
.box{ margin-left:10px; background:url(${pageContext.request.contextPath}/images/bg.png) -232px -82px no-repeat; padding-left:25px;color:#666; cursor: hand}
</style>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false,href:'${pageContext.request.contextPath}/jsp/manager/top.jsp'"
		style="height:97px;">
	</div>
	<div title="功能菜单" data-options="region:'west',split:true"
		style="width:200px;padding:10px;">
			<div id="aa" class="easyui-accordion" data-options="fit:true"
				style="width:300px;height:200px;">
				<c:forEach items="${lstMenuParent}" var="menuParent">
					<div title="&nbsp;&nbsp;&nbsp;&nbsp;${menuParent.menuName }"
						style="overflow:auto;padding:10px;" >
						<c:forEach items="${mapMenuChild}" var="menuChild">
							<c:if test="${menuParent.menuId==menuChild.key}">
									<c:forEach items="${menuChild.value}" var="menu">
										<a id="rightLi${menu.menuId }"  class="box"
											onclick="setmain('${menu.menuName}','${menu.menuURL}')" style="cursor: pointer" >${menu.menuName}</a><br/>
									</c:forEach>
							</c:if>
						</c:forEach>
					</div>
				</c:forEach>
			</div>
	</div>
	<div data-options="region:'center',border:false,title:'所在位置：后台管理首页'" >
		<div id="tt" class="easyui-tabs" data-options="fit:true,border:false,plain:'true'">
				
		</div>
		
	</div>
	<div id="MyPopWindow" data-options="modal:true,shadow:true,minimizable:false,cache:false,maximizable:false,collapsible:false,resizable:false"
		 style="margin: 0px;padding: 0px;overflow: auto;"></div>
	<div id="myDialog"></div>
</body>
</html>