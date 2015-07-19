<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<style type="text/css" >
a{
	cursor: pointer
}
#show_table{ }
.tbl_exam{margin:auto;}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-size:12px;
}
.STYLE1 {
	font-size: 12px;
	color: #000000;
}
.STYLE5 {font-size: 12}
.STYLE7 {font-size: 12px; color: #FFFFFF; }
.Title li{float:left;list-style:none; background:url(${pageContext.request.contextPath}/images/icon2-act1.gif) no-repeat;width:43px;height:32px; text-align:center; padding-top:7px; margin-left:12px;}
.Title li a{font-size: 12px; color: #FFFFFF; text-decoration:none;}
.Title li a:hover{color: yellow;}
a img {
	border:none;
}
#navigation {
	
	margin:10px,3px,0px,0px;
	padding:0px;
	width:161px;
}
#navigation a.head {
	cursor:pointer;
	background:url(${pageContext.request.contextPath}/images/main_34.gif) no-repeat scroll;
	height:30px;
	display:block;
	font-weight:bold;
	margin:0px;
	padding:5px 0 5px;
	text-align:center;
	font-size:12px;
	text-decoration:none;
}
#navigation ul {
	border-width:0px;
	margin:0px;
	padding:0px;
	text-indent:0px;
}
#navigation li {
	list-style:none; display:inline;
}


#navigation li li a {
	margin-left:55px;
	width:75px;
	display:block;
	font-size:12px;
	text-decoration: none;
	text-align:center;
	padding:3px;
}
#navigation li li a:hover {
	background:url(${pageContext.request.contextPath}/images/tab_bg.gif) repeat-x;
		border:solid 1px #adb9c2;
}
.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}
.STYLE6 {color: #000000; font-size: 12; }
.STYLE10 {color: #000000; font-size: 12px; }
.STYLE19 {
	color: #344b50;
	font-size: 12px;
}
.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}
.STYLE22 {
	font-size: 12px;
	color: #295568;
}
.clearfix:after{content:".";display:block;height:0;clear:both;visibility:hidden}
.clearfix{display:inline-block}
.clearfix{display:block}

.pager { margin-top:15px; padding-right:20px;}
.pager ul { float:right; }
.pager ul li { float:left; border:1px solid #eee; line-height:18px; padding:0 3px; margin:0 1px; display:inline; }
.pager ul li.current { font-weight:bold; color:#630; }

.sublist {height:100%;weight:70px;}
.subl1{ background:url(${pageContext.request.contextPath}/images/bglist.gif) no-repeat right;}
.subl2{ background:url(${pageContext.request.contextPath}/images/bglist1.gif) no-repeat right;}
.subl3{ background:url(${pageContext.request.contextPath}/images/bglist2.gif) no-repeat right;}
.subl4{ background:url(${pageContext.request.contextPath}/images/bglist3.gif) no-repeat right;}
</style>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.3.5/themes/default/easyui.css" />
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
</head>

<body>

<script type="text/javascript">
	$(function() {
		$("#updatePwd").click(
			function() {
				$('#updatePwdWin').window({  
					title : '修改密码', 
					href : basePath+'/jsp/password.jsp',
				    width:400,   
				    height:200,   
				    modal:true,
				    shadow :true,
				    resizable : true,
				    collapsible : false,
				    minimizable : false,
				    maximizable : false  
				}); 
		});
	});
</script>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="57" background="${pageContext.request.contextPath}/images/main_03.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="378" height="57" background="${pageContext.request.contextPath}/images/main_01.jpg">&nbsp;</td>
        <td>&nbsp;</td>
        <td width="281" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="33" height="27"><img src="${pageContext.request.contextPath}/images/main_05.gif" width="33" height="27" /></td>
            <td width="248" background="${pageContext.request.contextPath}/images/main_06.gif"><table width="225" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="17"><div align="right"><a id="updatePwd" style="cursor: pointer"><img src="${pageContext.request.contextPath}/images/pass.gif" width="69" height="17" /></a></div></td>
                <!-- 
                <td><div align="right"><a style="cursor: hand" onclick="addTab('用户信息','${pageContext.request.contextPath}/jsp/userInfo.jsp')" ><img src="${pageContext.request.contextPath}/images/user.gif" width="69" height="17" /></a></div></td>
                 -->
                <td><div align="right"><a href="${pageContext.request.contextPath}/logout"><img src="${pageContext.request.contextPath}/images/logOut.jpg" alt="注销" width="69" height="17" /></a></div></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="40" background="${pageContext.request.contextPath}/images/main_10.jpg">
	    <table width="100%" height="40" border="0" cellspacing="0" cellpadding="0">
	      <tr>
	        <td width="194" height="40" >&nbsp;</td>
        	<td>
	        	<table width="100%" border="0" cellspacing="0" cellpadding="0" >
		          <tr>
		            <td width="21"><img src="${pageContext.request.contextPath}/images/main_13.gif" width="19" height="14" /></td>
		            <td width="35" class="STYLE7"><div align="center"><a onclick="location='${pageContext.request.contextPath}/menu/getMenus'" style="cursor: pointer;font-size: 12px; color: #FFFFFF;">首页</a></div></td>
		            <td  align="right" style="padding-right: 20px">
			        	<span class="STYLE1" style="float:right;margin-right:20px;color: #e1e2e3;font-size: 12px;">当前登录用户：${userSession.loginName }</span>
			        </td>
		          </tr>
		        </table>
	        </td>
	      </tr>
	    </table>
    </td>
  </tr>
</table>
<div id="updatePwdWin"></div>
</body>
</html>
