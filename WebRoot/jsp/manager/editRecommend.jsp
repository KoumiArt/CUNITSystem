<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title></title>
  </head>
  
  <body>
  	<input type="hidden" id="rec_result" value="${rec_result }"/>
  	<input type="hidden" id="recId" value="${param.recId }"/>
  	<iframe id="myIframe" frameborder="0" width="100%" height="100%" src="${pageContext.request.contextPath}/jsp/manager/recommendFile.jsp">
		
	</iframe>
  </body>
</html>
