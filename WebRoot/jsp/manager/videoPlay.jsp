<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Video.js | HTML5 Video Player</title>

  <!-- Chang URLs to wherever Video.js files will be hosted -->
  <link href="video-js.css" rel="stylesheet" type="text/css">
  <!-- video.js must be in the <head> for older IEs to work. -->
  <script src="${pageContext.request.contextPath}/js/video-js/video.js"></script>

  <!-- Unless using the CDN hosted version, update the URL to the Flash SWF -->

  <script type="text/javascript">
    	videojs.options.flash.swf = "video-js.swf";
  </script>
</head>
<body>
	<center>
	  <video id="example_video_1" class="video-js vjs-default-skin" controls preload="none" width="730" height="438"
	      data-setup="{}">
	     <source id="srcId" src="${pageContext.request.contextPath}/resourceFile/${param.path}" type='video/mp4' />
	     <track kind="captions" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
    	 <track kind="subtitles" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
    	 你的浏览器不支持Html 5  video标签
	  </video>
	</center>
	<script type="text/javascript">
    document.getElementById("srcId").src = "${pageContext.request.contextPath}/resourceFile/"+decodeURI(decodeURI("${param.path}"));
    document.getElementById("example_video_1").load();
  </script>
</body>
</html>