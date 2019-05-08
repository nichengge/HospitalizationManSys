<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" href="css/base.css" />
<link rel="stylesheet" href="css/info-mgt.css" />
<title>住院管理系统</title>
</head>
<style type="text/css">
body {
	padding: 0px;
	text-align: center;
}
</style>
<body style="background-color: #F1F8FC">
	<div style="margin-top: 80px;">
		<font size="5px">===欢迎使用住院管理系统===</font> <br> <img
			src="./images/welcome.png" /> <br> <br> <br> <br>
		<br> <br> <label id="nowIP"></label> <br> <font
			size="1px">当前系统版本:2.2.0_ Beta_0508</font> <br> &copy; Copyright
		2019 QUT fsci
	</div>
</body>

<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/core.js"></script>

<!-- 获取当前IP的JS -->
<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
<script type="text/javascript">
	var IP = "当前登录IP:" + returnCitySN['cip'] + "," + returnCitySN['cname'];
	$("#nowIP").text(IP);
	//alert(returnCitySN['cip'] + returnCitySN['cname']);
</script>
</html>
