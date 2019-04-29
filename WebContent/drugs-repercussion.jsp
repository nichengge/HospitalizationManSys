<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<link rel="stylesheet" href="css/base.css" />
<link rel="stylesheet" href="css/info-reg.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.dialog.css" />
<title>医院住院管理系统</title>
</head>

<body>
	<div class="title">
		<h2>退药处理</h2>
	</div>
	<form id="drugsRepercussion">
	<div class="main">
		<p class="short-input ue-clear">
			<label><font color="red">*</font>住院编号：</label> 
			<input type="search" id="patientId" name="patientId" results="s" placeholder="住院编号" />
		</p>
		<p class="short-input ue-clear">
			<label><font color="red">*</font>患者姓名：</label> 
			<input type="text" readonly name="patientName" id="patientName" placeholder="患者姓名" />
		</p>
		<input type="text" style="display:none;"  name="drugsId" id="drugsId"/>
		<div class="query"> 
		<p class="short-input ue-clear">
			<label><font color="red">*</font>药品名称：</label>
			<input id="durgsName" type="text" placeholder="请选择" list="drugsList"> 
			<datalist id="drugsList">
			</datalist>
		</p> 
		<p class="short-input ue-clear">
			<label>数量：</label> <input type="text" name="count" id="count" placeholder="数量" onfocus="checknum()" onblur="checknum1()"/>
			<input type="hidden" name="count1" id="count1">
		</p>
		<p class="short-input ue-clear">
			<label><font color="red">*</font>退药原因：</label>
			<textarea id="repercussion" name="repercussion" placeholder="退药原因"></textarea>
		</p>
	</div>
	<div class="btn ue-clear">
		<a href="javascript:;" class="confirm">退药</a>
		<a href="javascript:;" class="clear">重置</a>
	</div>
	</div>
	</form>
	<!-- 病人查询 -->
 	<div  class="exitDialog">
		<iframe src="patient_find.jsp" frameBorder="0" width="100%" scrolling="auto" height="100%"></iframe>
	</div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/core.js"></script>
<script type="text/javascript" src="js/jquery.dialog.js"></script>
<script type="text/javascript" src="js/drugsRepercussion.js"></script>
 <script type="text/javascript">
</script>
</html>