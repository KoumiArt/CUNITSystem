<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title></title>
</head>
<body>
	<center>
	  <audio id="example_video_1" >
	  <source id="srcId" type='audio/mp3'></source>
    	 你的浏览器不支持Html 5  audio标签
	  </audio>
	</center>
	<script type="text/javascript">
    document.getElementById("srcId").src = "${pageContext.request.contextPath}/resourceFile/"+decodeURI(decodeURI("${param.path}"));
    document.getElementById("example_video_1").load();
  </script>
</body>
</html>