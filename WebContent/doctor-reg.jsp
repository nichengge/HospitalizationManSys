<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/base.css" />
<link rel="stylesheet" href="css/info-reg.css" />
<style type="text/css">
#titlevalue, #departmentvalue, #gendervalue {
	display: none;
}
</style>
<title>医院住院管理系统</title>
</head>

<body>
	<div class="title">
		<h2>
			医生录入
			<h2>
	</div>
	<label id="titlevalue">0</label>
	<label id="departmentvalue">0</label>
	<label id="gendervalue">0</label>
	<div class="main">
		<p class="short-input ue-clear">
			<label><font color="red">*</font>姓名：</label> <input id="doctorname"
				type="text" placeholder="姓名"><span id="doctorNameError"></span>
		</p>
		<div class="short-input select ue-clear">
			<label>科室：</label>
			<div class="select-wrap">
				<div class="select-title ue-clear" id="department">
					<span>请选择</span><i class="icon"><label id="departmentError"></label>
				</div>
				<ul class="select-list" id="depart">
				</ul>
			</div>
		</div>
		<p class="short-input ue-clear">
			<label><font color="red">*</font>入职时间：</label> <input type="date"
				id="time" placeholder="从业时间" /><span id="timeError"></span>
		</p>
		<div class="short-input select ue-clear">
			<label>职称：</label>
			<div class="select-wrap">
				<div class="select-title ue-clear" id="titles">
					<span>请选择<label></label></span><i class="icon"></i><label
						id="titlesError"></label>
				</div>
				<ul class="select-list" id="title">
				</ul>
			</div>
		</div>
		<div class="short-input select ue-clear">
			<label>性别：</label>
			<div class="select-wrap">
				<div class="select-title ue-clear" id="gender">
					<span>请选择<label></label></span><i class="icon"></i><label
						id="genderError"></label>
				</div>
				<ul class="select-list" id="sex">
					<li value="1">男</li>
					<li value="2">女</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="btn ue-clear">
		<a href="javascript:;" id="save" class="confirm">保存</a> <a
			href="javascript:;" id="reset" class="clear"
			onclick="window.location.reload(true)">重置</a>
	</div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/doctorzc.js"></script>
<script type="text/javascript">
	$("#department").on("click", function() {
		$("#depart").toggle();
		return false;
	});
	$("#depart").on("click", "li", function() {
		var txt = $(this).text();
		var label = $(this).val();
		$("#department").find("span").text(txt);
		$("#departmentvalue").text(label);
	});
	$("#titles").on("click", function() {
		$("#title").toggle();
		return false;
	});
	$("#title").on("click", "li", function() {
		var txt = $(this).text();
		var label = $(this).val();
		$("#titles").find("span").text(txt);
		$("#titlevalue").text(label);
	});
	$("#gender").on("click", function() {
		$("#sex").toggle();
		return false;
	});
	$("#sex").on("click", "li", function() {
		var txt = $(this).text();
		var label = $(this).val();
		$("#gender").find("span").text(txt);
		$("#gendervalue").text(label);
	});

	showRemind('input[type=text], textarea', 'placeholder');
</script>
</html>
