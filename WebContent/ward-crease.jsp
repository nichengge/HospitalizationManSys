<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<link rel="stylesheet" href="css/base.css" />
<link rel="stylesheet" href="css/info-reg.css" />
<title>医院住院管理系统</title>
</head>
<style type="text/css">
#typeNo, #departmentNo {
	display: none;
}
</style>
<body>
	<div class="title">
		<h2>病房增加</h2>
	</div>
	<form id="wardForm">
		<div class="main">
			<p class="short-input ue-clear">
				<label><font color="red">*</font>房&nbsp;间&nbsp;号：</label> <input
					id="wardNo" name="wardNo" type="text" placeholder="房间号"> <span
					id="wardError"><em>*</em>必须为正整数</span>
			</p>
			<div class="short-input select ue-clear">
				<label><font color="red">*</font>科&nbsp;&nbsp;&nbsp;&nbsp;室：</label>
				<div class="select-wrap">
					<div class="select-title ue-clear" id="department">
						<span>请选择</span><i class="icon">
					</div>
					<ul class="select-list" id="depart">
					</ul>
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span id="departError"></span>
			</div>
			<div class="short-input select ue-clear">
				<label><font color="red">*</font>类&nbsp;&nbsp;&nbsp;&nbsp;型：</label>
				<div class="select-wrap">
					<div class="select-title ue-clear" id="type">
						<span>请选择</span><i class="icon">
					</div>
					<ul class="select-list" id="types">
					</ul>
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;<span id="typeError"></span>
			</div>
			<p class="short-input ue-clear">
				<label><font color="red">*</font>容&nbsp;&nbsp;量：</label> <input
					id="wardspace" name="wardSpace" type="text" placeholder="容量"> <span
					id="wardspaceerror"><em>*</em>必须为正整数</span>
			</p>
			<p class="short-input ue-clear">
				<label><font color="red">*</font>创建时间：</label> <input type="text"
					id="createTime" name="createTime" readonly="readonly" placeholder="创建时间" />
				&nbsp;&nbsp;&nbsp;&nbsp;<span id="createError"></span>
			</p>
		</div>
		<input id="departmentNo" name="departmentNo" /> <input id="typeNo"
			name="typeNo" />
		<div class="btn ue-clear">
			<a href="javascript:void(0);" id="add" class="confirm">增加</a> <a
				href="javascript:void(0);" id="reset" class="clear">重置</a>
		</div>
	</form>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/wardAdd.js"></script>

<script type="text/javascript">
$("#department").on("click",function(){
	$("#depart").toggle();
	return false;
});
$("#depart").on("click","li",function(){
	var txt = $(this).text();
	var label = $(this).val();
	$("#department").find("span").text(txt);
	$("#departmentNo").val(label);
});
$("#type").on("click",function(){
	$("#types").toggle();
	return false;
});
$("#types").on("click","li",function(){
	var txt = $(this).text();
	var label = $(this).val();
	$("#type").find("span").text(txt);
	$("#typeNo").val(label);
});
var now = new Date(); 
createTime.value=new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate();
</script>
</html>
